class HomeController < ApplicationController
  def index
  end
  
  def show
    user = User.find params[:id]
    @tweets = Tweet.where uid_id: user.uid if user
    if params[:keyword] && @tweets
      @tweets = @tweets.tagged_with(params[:keyword])
    end
  end
end
