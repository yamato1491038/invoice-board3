class Contract < ApplicationRecord
  has_many :regular_contracts,dependent: :destroy
  has_many :regulars, through: :regular_contracts,dependent: :destroy
  has_many :persuation_contracts, dependent: :destroy
  has_many :persuation, through: :persuation_contracts, dependent: :destroy
  
end
