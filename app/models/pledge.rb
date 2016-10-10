class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  validates :amount, presence: true
  validate :pledges_total
  private
  def pledges_total
    @diff = goal.target_amount - goal.pledges_total
    if @diff < self.amount
      self.errors.add(:amount, "Do not pledge more than #{@diff}")
    end
  end
end
