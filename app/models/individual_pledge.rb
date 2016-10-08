class IndividualPledge < ApplicationRecord
  belongs_to :user
  belongs_to :total_pledge
end
