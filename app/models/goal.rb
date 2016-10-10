class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :beneficiary
  has_many :pledges, dependent: :nullify
  def pledges_total
    pledges.sum(:amount)
  end


end
