class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :regulars
  has_many :persuations
  has_many :traffics
  has_many :costs
  validates :name, presence: true, uniqueness: true

end
