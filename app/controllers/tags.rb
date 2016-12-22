class BookmarkManager < Sinatra::Base

  get '/tags/:tag_name' do
    tag = Tag.first(tag_name: params[:tag_name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
