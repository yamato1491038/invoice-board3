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
    redirect_to root_path, notice: "選んだ交通費を削除しました"
  end

  def search
    @traffics = Traffic.search(search_params)
  end

  private
  def traffic_params
    params.require(:traffic).permit(:dating, :hno, :field, :distance, :fee, :content).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end
end
