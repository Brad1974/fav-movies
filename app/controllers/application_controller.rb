class ApplicationController < Sinatra::Base


  configure do
    enable :sessions
    set :session_secret, "secret"

  end


    helpers do


      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:user_id])
      end
    end

  end
