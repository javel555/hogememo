class Tweet < ApplicationRecord

  # add def post.tag_list
  acts_as_taggable

  def self.add(uid_id, tweet)
    find_or_create_by(uid_id: uid_id, uuid: tweet.id) do |new|
      new.uid_id = uid_id
      new.uuid = tweet.id
      new.nickname = tweet.user.name
      new.text = tweet.text
    end
  end

  def add_tag(tag)
    self.tag_list.add tag
    self.save!
  end

  def delete_tag(tag)
    self.tag_list.remove(tag)
    self.save!
  end

end
