class Api::AuthenticationController < ApiController
    skip_before_action :authenticate_user!

    def index 
    end

    def create(email = params[:email], password = [:password])
        user = User.find_by(email: email)

        if user && user.valid_password?(password)
         token = Api::JsonWebToken.encode(id: user.id)
        else
            render json: { errors: ["Invalid email or password"]}  
        end 
    end
end
