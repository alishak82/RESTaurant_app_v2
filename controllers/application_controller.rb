class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'restaurant'
  })

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  enable :sessions, :method_override

  get '/' do
    if current_user
      erb :authenticated
    else
      erb :not_authenticated
    end
  end


end