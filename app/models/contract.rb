class Contract < ApplicationRecord
  has_many :regular_contracts
  has_many :regulars, through: :regular_contracts
  has_many :persuation_contracts
  has_many :persuation, through: :persuation_contracts
  
end
