class Api::TweetsController < ApplicationController

    before_action :set_tweet, only: %i[ show edit update destroy ]
    before_action :set_default_format 
    # include TweetsConcerns


    def index
        @tweets = Tweet.all
   
    end

    def show 
    end

    def new
        @tweet = Tweet.new
        render json: :new, status: :created, location: @tweet 
    end
    
    def edit 

    end

    def create
        @tweet = Tweet.new(tweet_params)
    
        respond_to do |format| 
            if @tweet.save 
                format.html { redirect_to tweets_url(@tweet), notice: "Tweet was successfully created." }
                format.json { render :show, status: :created, location: @tweet }
            else 
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @tweet.errors, status: :unprocessable_entity }
            end
        end
    end

    def update 
        respond_to do |format|
            if @tweet.update(tweet_params)
              format.html { redirect_to tweets_url(@tweet), notice: "Tweet was successfully updated." }
              format.json { render :show, status: :ok, location: @tweet }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @tweet.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit 
    end

    
    private

    def set_tweet 
        @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:body, :user_id, :retweet_id, :quotes_id, :parent_tweet_id)
    end

 # JSON Format by default
    def set_default_format 
        request.format = :json unless params[:format]
    end
end
