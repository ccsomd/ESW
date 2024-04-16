require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  context "validations" do
    before { create(:user) }

    context "presence" do
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :name }
      it { should validate_presence_of :email }
      it { should validate_presence_of :provider }
      it { should validate_presence_of :uid }
      it { should validate_presence_of :badge }
      it { should validate_presence_of :roles }
    end

    context "uniqueness" do
      it { should validate_uniqueness_of :uid }
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
      it { should validate_uniqueness_of :badge }
    end
  end
end
