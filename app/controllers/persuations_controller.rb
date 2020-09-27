class PersuationsController < ApplicationController

  def new
    @persuation = Persuation.new
    @contracts = Contract.where(kind: "2").where(active: true)
  end

  def create
    @persuation = Persuation.new(persuation_params)
    if params[:persuation][:dating].present? && Closing.check(persuation_params).present?
      redirect_to root_path, alert: '申請済のため入力できません'
    elsif @persuation.save
      redirect_to root_path, notice: '調査費登録しました'
    else
      @contracts = Contract.where(kind: "2").where(active: true)
      render :new
    end
  end

  def show
    @persuation = Persuation.all
  end

  def destroy
    persuation = Persuation.find(params[:id])
    persuation.destroy
    redirect_to persuation_path, notice: "選んだ説得費を削除しました"
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
  def persuation_params
    params.require(:persuation).permit(:dating, :hno, contract_ids: []).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end

  def search_action(params)
    @year = params["dating(1i)"]
    @month = params["dating(2i)"]
    @persuations = Persuation.search(params)
    @contracts = Contract.where(kind: "2")
  end
end
