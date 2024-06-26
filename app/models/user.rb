class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 255 }
  
  has_many :statuses
  has_many :groups, through: :statuses
  has_many :group_users
  has_many :groups, through: :group_users
end
