class RegularsController < ApplicationController

  def index
  end

  def new
    @regular = Regular.new
    @contracts = Contract.where(kind: "1").where(active: true)
  end

  def create
    @regular = Regular.new(regular_params)
    if params[:regular][:dating].present? && Closing.check(regular_params).present?
      redirect_to root_path, alert: '申請済のため入力できません'
    elsif @regular.save
      redirect_to root_path, notice: '調査費登録しました'
    else
      @contracts = Contract.where(kind: "1").where(active: true)
      render :new
    end
  end

  def show
    @regular = Regular.all
    @contracts = Contract.where(kind: "1")
  end

  def destroy
    regular = Regular.find(params[:id])
    regular.destroy
    redirect_to regular_path, notice: "選んだ調査費を削除しました"
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
  def regular_params
    params.require(:regular).permit(:dating, :hno, contract_ids: []).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end

  def search_action(params)
    @year = params["dating(1i)"]
    @month = params["dating(2i)"]
    @regulars = Regular.search(params)
    @contracts = Contract.where(kind: "1")
  end

end
