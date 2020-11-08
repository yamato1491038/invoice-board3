require 'rails_helper'
describe Regular do
  describe '#create' do
    it "is invalid without a name" do
      regular = build(:regular, dating: nil)
      regular.valid?
      expect(regular.errors[:dating]).to include("を入力してください")
    end

    it "is invalid without a email" do
      regular = build(:regular, hno: nil)
      regular.valid?
      expect(regular.errors[:hno]).to include("を入力してください")
    end
  end
end