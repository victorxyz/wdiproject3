class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :beneficiary
  has_one :user_task
  has_one :total_pledge
end
