require 'rails_helper'
describe Cost do
  describe '#create' do
    it "is invalid without a dating" do
      cost = build(:cost, dating: nil)
      cost.valid?
      expect(cost.errors[:dating]).to include("を入力してください")
    end

    it "is invalid without a hno" do
      cost = build(:cost, hno: nil)
      cost.valid?
      expect(cost.errors[:hno]).to include("を入力してください")
    end
  end
end