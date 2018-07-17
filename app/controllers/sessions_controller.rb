class SessionsController < ApplicationController
    def new
        
    end
  
    def create
      #render json: params
      user = User.find_by(email: params[:session][:email])

      if user&.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Success! You are signed in, #{user.first_name}!"
        redirect_to home_path
      else
        flash[:danger] = "Invalid email or password"
        redirect_to home_path
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:notice] = 'Signed out!'
      redirect_to home_path
    end

    private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
