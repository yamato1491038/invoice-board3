class Persuation < ApplicationRecord
  belongs_to :user
  has_many :persuation_contracts, dependent: :destroy
  has_many :contracts, through: :persuation_contracts, dependent: :destroy

  def self.search(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Persuation.where(user_id: "#{search[:user_id]}").where(dating: search_time.in_time_zone.all_month)
  end
end
