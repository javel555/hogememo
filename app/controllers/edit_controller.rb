class EditController < ApplicationController
  before_action :authenticate_user!

  def index
    logger.debug current_user.inspect
    logger.debug user_session.inspect
  end
end
