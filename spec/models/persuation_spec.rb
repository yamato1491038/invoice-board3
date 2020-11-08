require 'rails_helper'
describe Persuation do
  describe '#create' do
    it "is invalid without a dating" do
      persuation = build(:persuation, dating: nil)
      persuation.valid?
      expect(persuation.errors[:dating]).to include("を入力してください")
    end

    it "is invalid without a hno" do
      persuation = build(:persuation, hno: nil)
      persuation.valid?
      expect(persuation.errors[:hno]).to include("を入力してください")
    end
  end
end