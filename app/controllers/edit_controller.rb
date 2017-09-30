class EditController < ApplicationController
  before_action :authenticate_user!

  def show
    searchCondition = Searchcondition.where(uid_id: current_user.uid).first
    @keyword = searchCondition.keyword if searchCondition
    @tweets = Tweet.where(uid_id: current_user.uid)
    if params[:tag] && @tweets
      @tweets = @tweets.tagged_with params[:tag]
    end
  end

  def add_tag
    if params[:commit] == 'タグを消す'
      tweet = Tweet.find(params[:id])
      tweet.tag_list.remove(params[:append_tag])
      tweet.save
    else
      tweet = Tweet.find(params[:id])
      tweet.tag_list.add(params[:append_tag])
      tweet.save
    end
    redirect_to edit_path
  end
end
