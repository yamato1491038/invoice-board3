class TrafficsController < ApplicationController

  def new
    @traffic = Traffic.new
  end

  def create
    @traffic = Traffic.new(traffic_params)
    if @traffic.save
      redirect_to root_path, notice: '交通費登録しました'
    else
      render :new
    end
  end

  def show
    @traffic = Traffic.all
  end

  def destroy
    traffic = Traffic.find(params[:id])
    traffic.destroy
    redirect_to traffic_path, notice: "選んだ交通費を削除しました"
  end

  def search
    search_action(params)
  end

  def check
    if params[:user_id].present?
      @name = User.find(params[:user_id]).name
      search_action(params)
    else
      redirect_to breakdown_path(:id), alert: "ユーザーの選択がありません"
    end
  end

  private
  def traffic_params
    params.require(:traffic).permit(:dating, :hno, :field, :distance, :fee, :content).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end

  def search_action(params)
    @year = params["dating(1i)"]
    @month = params["dating(2i)"]
    @traffics = Traffic.search(search_params)
  end
end
