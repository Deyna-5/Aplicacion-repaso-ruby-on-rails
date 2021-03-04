class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :friends

  validates :name, presence: true

  def all_friends
    User.where(id: self.friends.map{|f| f.friend_id})
  end
end
