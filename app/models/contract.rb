class Contract < ApplicationRecord
  has_many :regular_contracts, dependent: :restrict_with_error
  has_many :regulars, through: :regular_contracts, dependent: :restrict_with_error
  has_many :persuation_contracts, dependent: :restrict_with_error
  has_many :persuation, through: :persuation_contracts, dependent: :restrict_with_error
  
  validates :name, presence: true
  validates :money, presence: true
  validates :kind, presence: true
end
