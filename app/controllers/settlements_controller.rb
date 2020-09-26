class SettlementsController < ApplicationController
  before_action :user_admin, only: [:create, :show, :destroy]

  def create
    Settlement.create(settlement_params)
    redirect_to "/breakdowns/:id", notice: '決済しました'
  end

  def show
  end

  def destroy
  end

  private

  def settlement_params
    params.permit(:dating, :user_id, :settler)
  end

  def user_admin
    unless current_user.admin?
      redirect_to root_path, alert: "管理の権限がありません"
    end
  end
end
