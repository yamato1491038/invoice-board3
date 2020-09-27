class ClosingsController < ApplicationController

  def create
    Closing.create(closing_params)
    redirect_to root_path, notice: '締め申請しました'
  end

  def show
  end

  def destroy
    closings = Closing.where(user_id: params[:user_id]).where(dating: params[:dating])
    closings.destroy_all
    settlements = Settlement.where(user_id: params[:user_id]).where(dating: params[:dating])
    settlements.destroy_all
    redirect_to settlements_path, notice: "締めを削除しました"
  end

  private

  def closing_params
    params.permit(:dating, :user_id)
  end

  def user_admin
    unless current_user.admin?
      redirect_to root_path, alert: "管理の権限がありません"
    end
  end
end

