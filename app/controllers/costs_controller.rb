class CostsController < ApplicationController

  def new
    @cost = Cost.new
  end

  def create
    @cost = Cost.new(cost_params)
    if @cost.save
      redirect_to root_path, notice: '諸経費登録しました'
    else
      render :new
    end
  end

  def show
    @cost = Cost.all
  end

  def destroy
    cost = Cost.find(params[:id])
    cost.destroy
    redirect_to root_path, notice: "選んだ諸経費を削除しました"
  end

  def search
    @costs = Cost.search(search_params)
  end

  private
  def cost_params
    params.require(:cost).permit(:dating, :hno, :parking, :fee, :content).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end
end
