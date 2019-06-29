mclass ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

# render the sign-up form view signup.erb
  get '/registrations/signup' do

    erb :'/registrations/signup'
  end

# handles the POST request that is sent when a user hits 'submit' on the sign-up form

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/home'
  end

# renders the login form
  get '/sessions/login' do

    # the line of code below render the view page in app/views/sessions/login.erb
    erb :'sessions/login'
  end

# responsible for receiving the POST request that gets sent when a user hits 'submit' on the login form.
  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end

 # responsible for logging the user out by clearing the session hash.
  get '/sessions/logout' do
    session.clear
    redirect '/'
  end
  
# responsible for rendering the user's homepage view.
# First, this route finds the current user based on the ID value stored in the session hash. Then, it sets an instance variable, @user, equal to that found user, allowing us to access the current user in the corresponding view page

  get '/users/home' do
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end
end
