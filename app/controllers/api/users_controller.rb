class Api::UsersController < Api::BaseController
  before_action :set_user, only: %i[ show update ]


  # GET /users/1 or /users/1.json
  def show
    @followers_count = @user.followers.count
    @followings_count = @user.followings.count
    @user_tweets = @user.tweets
    .includes(tweet: [:author, :likes, :qoutes, :retweets, :parent_tweet])
    @tweets_and_replies = @user.tweets_and_replies
    .includes(tweet: [:author, :likes, :qoutes, :retweets, :parent_tweet])
  end

 
  # PATCH/PUT /users/1 or /users/1.json
  # {
  #   user: {
  #     name: "sasasas",
  #     lastname: "sasasas",
  #     username: "sasasas",
  #     email: "sasasas",
  #     passwo: "sasasas"
  #   }
  # }

  # GET /users/:id => UsersController#show

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :lastname, :username, :email)
    end
end
