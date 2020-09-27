class Closing < ApplicationRecord
  belongs_to :user
  validates :dating, presence: true

  def self.search(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Closing.where(user_id: "#{search[:user_id]}").where(dating: search_time.in_time_zone.all_month)
  end

  def self.search_month(search)
    search_time = "#{search["dating(1i)"]}-#{search["dating(2i)"]}-01"
    Closing.where(dating: search_time.in_time_zone.all_month)
  end

  def self.check(params)
    Closing.where(user_id: params[:user_id]).where(dating: params[:dating].in_time_zone.all_month)
  end

end
