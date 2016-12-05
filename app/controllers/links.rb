class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.create(url: params[:URL], title: params[:title])
    params[:tag_name].split(',').each do |name|
      tag = Tag.first_or_create(tag_name: name.strip)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

end
