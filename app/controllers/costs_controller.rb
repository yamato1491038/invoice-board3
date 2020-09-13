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
  def cost_params
    params.require(:cost).permit(:dating, :hno, :parking, :fee, :content).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end

  def search_action(params)
    @year = params["dating(1i)"]
    @month = params["dating(2i)"]
    @costs = Cost.search(search_params)
  end
end
