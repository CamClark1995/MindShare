class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.current
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to(:root, notice: "Congratulations, you have posted a new 'tweet'!")
    else
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end
