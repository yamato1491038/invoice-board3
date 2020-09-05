class Persuation < ApplicationRecord
  belongs_to :user
  has_many :contracts, through: :persuation_contracts
  has_many :persuation_contracts
end
