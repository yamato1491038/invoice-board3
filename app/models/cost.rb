class Cost < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :dating, presence: true
  validates :hno, presence: true

  def self.search(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Cost.where(user_id: "#{search[:user_id]}").where(dating: search_time.in_time_zone.all_month)
  end

  def self.search_month(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Cost.where(dating: search_time.in_time_zone.all_month)
  end
end
