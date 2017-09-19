class Searchcondition < ApplicationRecord

  def self.update_keyword(uid, keyword)
    condition = find_or_create_by!(uid_id: uid) do |newdata|
      newdata.uid_id = uid
    end

    condition.keyword = keyword
    condition.save!

  end

end
