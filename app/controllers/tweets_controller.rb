class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
    render :index, notice: "Something"
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweetass/new
  def new
    @options = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"].map do |day|
      [day, day]
    end
    @tweet = Tweet.new(user: current_user)
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create

    if params[:tweet]
      @tweet = Tweet.new(tweet_params)
  
      respond_to do |format|
        if @tweet.save
          format.html { redirect_to tweets_path, notice: "Tweet was successfully created." }
          format.json { render :show, status: :created, location: @tweet }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tweet.errors, status: :unprocessable_entity }
        end
      end
    else
      @options = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"].map do |day|
        [day, day]
      end
      @name = params[:name]
      @number = params[:number]
      @selected_day = params[:selected_day]
      render :new
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:user_id, :body, :type, :parent_tweet_id)
    end
end
