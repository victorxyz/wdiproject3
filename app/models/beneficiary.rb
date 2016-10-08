class Beneficiary < ApplicationRecord
  has_many :goals, dependent: :nullify
end
