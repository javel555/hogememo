class EditController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweets = Tweet.where(uid_id: current_user.uid)
  end
end
