class TweetsController < ApplicationController
    before_action :set_tweet, only: [:update, :like, :retweet]
    
    def index
        @tweet = Tweet.all
   
    end

    def new
        @tweet = Tweet.new
    end
    

    def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = 1

    if @tweet.save
        render json: @tweet, status: :created 
        else
           render json: @tweet.errors
        end
    end

    def update 

        if @tweet.update(tweet_params)

            render json: @tweet, status: 200
        else
            render json: @tweet.errors
        end
    end

    def like 

        @like = Like.new(user_id: 1, tweet_id:@tweet.id)

        if @like.save 

            render json:  @like, status: :created

        else 

            render json:  @like.errors

        end
    end

    def unlike 
        @like = Like.find_by(tweet_id:@tweet)
        if @like 
            @like.destroy
            render json:  @like, status: :deleted
        else
            render json:  { message: "Error"}
        end
    end

    def retweet
        @origin_tweet = Tweet.find(params[:id])
        

         @retweet = Tweet.new(body: "", user_id: 1, retweet_id: @origin_tweet.id)

            if @retweet.save 

              render json:  {message: 'Created'}

            else 
                render json:  {message: 'Created'}
            end
       
    end

    def quote 
        @tweet_origin = Tweet.find(params[:id])

        @quote = Tweet.new(body: params[:body], user_id: 1, retweet_id: @tweet_origin.id)

        if @quote.save 

            render json:  {message: 'Created'}

          else 
              render json:  {message: 'Created'}
          end
    end

    def reply 

        @parent_tweet= Tweet.find(params[:id])

        @reply = Tweet.new(user_id: 1, retweet_id: @parent_tweet.id)

        if @reply.save 

            render json:  {message: 'Created'}

          else 
              render json:  {message: 'error'}
          end
    end

    def bookmark 
        @tweet = Tweet.find(params[:id])

        @new_bookmark = Bookmark.new( user_id:1, tweet_id:@tweet.id)

        if @new_bookmark.save 
            render json:  {message: 'Marked'}
        else
            render json:  {message: 'error'}
        end
    end

    def stats 
        @tweet = Tweet.find(params[:id])
        # @bookmark = Bookmark.find(params[:id])
        # @like = Like.find(params[:id])

        starts = {
            quotes: @tweet.quote_id,
            retweet: @tweet.retweet_id,
            replies: @tweet.parent_tweet_id,
            # bookmarks: @bookmark.bookmarks,
            # likes: @like.like
        }

        render json: starts, status: :ok
    end

    
    private

    def set_tweet 
        @tweet = Tweet.find(params[:id])

    end

    def tweet_params
        params.permit(:body, :user_id)
    end
 
    
end
