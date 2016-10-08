class TotalPledge < ApplicationRecord
  belongs_to :goal
  has_many :individual_pledges, dependent: :nullify
end
