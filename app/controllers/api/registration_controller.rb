class Api::RegistrationController < ApiController
    skip_before_action :authenticate_user!
    # before_action :set_users, only: %i[ create ]
  

    def new 
        @user = User.new 
    end

    def index 
    end

    def create
        @user = User.new(set_users)
        @user.save!
        @token = self.new_token(@user.email, @user.password)
        render 'api/users/show', formats: :json
    end

    private 

    def set_users
        user_attibutes = {username: params[:username], email: params[:email], password:[:password]}
        user_attibutes
    end

    def users_params
      params.require(:user).permit(:username, :email, :password)
    end

    def new_token(email, password)
        token = Api::AuthenticationController.new 
        token_created = token.create(email, password)
        token_created 
    end

end
