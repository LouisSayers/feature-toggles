require 'spec_helper'

describe 'FeatureToggles' do
  #uses feature_toggles.yml file by default

  it "should tell us if a feature is enabled / disabled" do
    cool_feature_enabled = FeatureToggles::Feature.is_enabled?(:my_cool_feature)
    another_feature_enabled = FeatureToggles::Feature.is_enabled?(:another_feature)

    expect(cool_feature_enabled).to eq false
    expect(another_feature_enabled).to eq true
  end


  context "when a feature is enabled for only one user type" do
    it "should check to see if the specific user type has that feature enabled" do
      no_user_type_enabled = FeatureToggles::Feature.is_enabled?(:admin_only_feature)
      user_enabled = FeatureToggles::Feature.is_enabled?(:admin_only_feature, :user)
      admin_enabled = FeatureToggles::Feature.is_enabled?(:admin_only_feature, :admin)
      expect(no_user_type_enabled).to be_false
      expect(user_enabled).to be_false
      expect(admin_enabled).to be_true
    end
  end

  context "when a feature is disabled only for one user type" do
    it "should check to see if only the specific user type has that feature disnabled" do
      no_user_type_enabled = FeatureToggles::Feature.is_enabled?(:all_but_user_feature)
      user_enabled = FeatureToggles::Feature.is_enabled?(:all_but_user_feature, :user)
      admin_enabled = FeatureToggles::Feature.is_enabled?(:all_but_user_feature, :admin)
      expect(no_user_type_enabled).to be_true
      expect(user_enabled).to be_false
      expect(admin_enabled).to be_true
    end
  end
end
