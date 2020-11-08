require 'rails_helper'
describe Regular do
  describe '#create' do
    it "is invalid without a name" do
      user = build(:regular, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:regular, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end


  end
end