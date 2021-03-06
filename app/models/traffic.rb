class Traffic < ApplicationRecord
  belongs_to :user
  validates :dating, presence: true
  validates :hno, presence: true

  def self.search(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Traffic.where(user_id: "#{search[:user_id]}").where(dating: search_time.in_time_zone.all_month)
  end

  def self.search_month(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Traffic.where(dating: search_time.in_time_zone.all_month)
  end
end
