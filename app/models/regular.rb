class Regular < ApplicationRecord
  belongs_to :user
  has_many :contracts, through: :regular_contracts
  has_many :regular_contracts
end
