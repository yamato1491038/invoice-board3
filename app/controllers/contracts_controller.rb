class ContractsController < ApplicationController
  before_action :user_admin

  def index
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to root_path, notice: '契約登録しました'
    else
      render :new
    end
  end

  def show
    @contracts = Contract.all
  end

  def update
    @contract = Contract.find(params[:id])
    if @contract.update(update_params)
      redirect_to contract_path, notice: '契約の表示を更新しました'
    else
      render :show
    end
  end

  def destroy
    contract = Contract.find(params[:id])
    if contract.destroy
      redirect_to contract_path, notice: "選んだ契約を削除しました"
    else
      redirect_to contract_path, alert: "使用中のため削除できません"
    end
  end

  def search
    @contracts = Contract.search(search_params)
  end

  private
  def contract_params
    params.require(:contract).permit(:name, :money, :kind, :active)
  end

  def update_params
    params.require(:contract).permit(:active)
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
