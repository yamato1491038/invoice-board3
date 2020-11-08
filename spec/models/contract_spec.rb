require 'rails_helper'
describe Contract do
  describe '#create' do
    it "is invalid without a name" do
      contract = build(:contract, name: "")
      contract.valid?
      expect(contract.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a money" do
      contract = build(:contract, money: nil)
      contract.valid?
      expect(contract.errors[:money]).to include("を入力してください")
    end
  end
end