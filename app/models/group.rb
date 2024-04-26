class Group < ApplicationRecord
  before_create :generate_uuid

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :statuses
  accepts_nested_attributes_for :statuses

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
