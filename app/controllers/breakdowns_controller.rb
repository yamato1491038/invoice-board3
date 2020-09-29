class BreakdownsController < ApplicationController
  before_action :user_admin, only: [:show, :check]

  def index
  end

  def show
  end

  def search
    search_action(search_params)
  end

  def check
    if params[:user_id].present?
      @name = User.find(params[:user_id]).name
      search_action(params)
    else
      redirect_to breakdown_path(:id), alert: "ユーザーの選択がありません"
    end
  end

  def report
    @users = User.where(admin: false)
    @year = params["dating(1i)"]
    @month = params["dating(2i)"]

    @regulars = Regular.search_month(params)
    @persuations = Persuation.search_month(params)

    @contracts1 = Contract.where(kind: "1")
    @contracts2 = Contract.where(kind: "2")

    @traffics = Traffic.search_month(params)
    @costs = Cost.search_month(params)
  end

  private

  def search_action(params)
    @year = params["dating(1i)"]
    @month = params["dating(2i)"]

    @regulars = Regular.search(params)
    @persuations = Persuation.search(params)
    traffics = Traffic.search(params)
    costs = Cost.search(params)
    @contracts1 = Contract.where(kind: "1")
    @contracts2 = Contract.where(kind: "2")

    @amount_distance = 0
    @amount_fee = 0
    traffics.each do |traffic|
      @amount_distance += traffic.distance * 30 if traffic.distance?
      @amount_fee += traffic.fee if traffic.fee?
    end

    @amount_parking = 0
    @amount_fee2 = 0
    costs.each do |cost|
      @amount_parking += cost.parking if cost.parking?
      @amount_fee2 += cost.fee if cost.fee?
    end

    @userid = params[:user_id]
    @settlement2 = Settlement.search(params).where(settler: 2)
    @settlement3 = Settlement.search(params).where(settler: 3)
    @settlement4 = Settlement.search(params).where(settler: 4)

    @closing = Closing.search(params)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end

  def user_admin
    unless current_user.admin?
      redirect_to root_path, alert: "管理の権限がありません"
    end
  end

end
