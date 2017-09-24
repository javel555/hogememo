class EditController < ApplicationController
  before_action :authenticate_user!

  def show
    @keyword = Searchcondition.where(uid_id: current_user.uid).first.keyword
    @tweets = Tweet.where(uid_id: current_user.uid)
  end

  def add_tag
    tweet = Tweet.find(params[:id])
    tweet.tag_list.add(params[:append_tag])
    tweet.save
    redirect_to edit_path
  end
end
