require 'spec_helper'

describe 'FeatureToggles' do
  #uses feature_toggles.yml file by default

  it "should tell us if a feature is enabled / disabled" do
    cool_feature_enabled = FeatureToggles::Feature.is_enabled?(:my_cool_feature)
    another_feature_enabled = FeatureToggles::Feature.is_enabled?(:another_feature)

    expect(cool_feature_enabled).to eq false
    expect(another_feature_enabled).to eq true
  end

end