require 'spec_helper'

describe "FeatureToggleLoader" do
  it "should load toggle settings" do
    loader = FeatureToggles::Loader.new(:test)
    file_data = loader.load('feature_toggle_loader_test.yml')
    expect(file_data['a_feature']['enabled']).to eq true
  end

  it "should load toggle settings for specific environment" do
    loader = FeatureToggles::Loader.new(:production)
    file_data = loader.load('feature_toggle_loader_env_test.yml')
    expect(file_data['a_feature']['enabled']).to eq false
  end
end
