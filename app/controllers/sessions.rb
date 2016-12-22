class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end
  
  get '/session/new' do
      @user = User.new
      erb :'session/new'
  end

  post '/session' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'session/new'
    end
  end

end
