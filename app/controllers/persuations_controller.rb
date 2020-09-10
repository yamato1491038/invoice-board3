class PersuationsController < ApplicationController

  def new
    @persuation = Persuation.new
    @contracts = Contract.where(kind: "2").where(active: true)
  end

  def create
    @persuation = Persuation.new(persuation_params)
    if @persuation.save
      redirect_to root_path, notice: '調査費登録しました'
    else
      render :new
    end
  end

  def show
    @persuation = Persuation.all
  end

  def destroy
    persuation = Persuation.find(params[:id])
    persuation.destroy
    redirect_to root_path, notice: "選んだ説得費を削除しました"
  end

  def search
    @persuations = Persuation.search(search_params)
    @contracts = Contract.where(kind: "2")
  end

  private
  def persuation_params
    params.require(:persuation).permit(:dating, :hno, contract_ids: []).merge(user_id: current_user.id)
  end

  def search_params
    params.merge(user_id: current_user.id)
  end
end
