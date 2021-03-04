class Post < ApplicationRecord
       validates :content, presence: true,
                     :length => {:maximum => 200}

       validates :image_url, presence: true

       belongs_to :user

       scope :browser, -> (date1, date2) {where(created_at: date1.to_date.beginning_of_day..date2.to_date.end_of_day) unless date1.nil? || date2.nil?}

       scope :posts_for_me, -> (user) {where(user_id: ((user.friends.map{|f| f.friend_id}) << user.id)) }
end
