require 'rails_helper'
describe Traffic do
  describe '#create' do
    it "is invalid without a dating" do
      traffic = build(:traffic, dating: nil)
      traffic.valid?
      expect(traffic.errors[:dating]).to include("を入力してください")
    end

    it "is invalid without a hno" do
      traffic = build(:traffic, hno: nil)
      traffic.valid?
      expect(traffic.errors[:hno]).to include("を入力してください")
    end
  end
end