class Group < ApplicationRecord
    before_create :generate_uuid

    private

    def generate_uuid
        self.uuid = SecureRandom.uuid
    end

    has_many :group_users
    has_many :users, through: :group_users
    has_one :status, dependent: :destroy
    has_many :group_users, dependent: :destroy
    
    accepts_nested_attributes_for :status

end
  