class Regular < ApplicationRecord
  belongs_to :user
  has_many :regular_contracts, dependent: :destroy
  has_many :contracts, through: :regular_contracts, dependent: :destroy
  validates :dating, presence: true
  validates :hno, presence: true
  validates :contract_ids, presence: true

  def self.search(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Regular.where(user_id: "#{search[:user_id]}").where(dating: search_time.in_time_zone.all_month)
  end

  def self.search_month(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Regular.where(dating: search_time.in_time_zone.all_month)
  end
  
end
