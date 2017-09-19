class SearchController < ApplicationController

  require 'rake'

  def update
    
    Searchcondition.update_keyword current_user.uid, params[:keyword]

    # クライアント準備
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    end

    # TODO 検索条件をDBから取得
    conditions = Searchcondition.all
    conditions.each do |condition|
      tweets = client.search(condition.keyword, {
        lang: "ja",
        result_type: "recent",
        count: "100"
      })

      tweets.each do |tweet|
        Tweet.add condition.uid_id, tweet
      end

    end

    redirect_to edit_path

  end

end
