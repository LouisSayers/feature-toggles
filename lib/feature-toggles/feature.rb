class FeatureToggles::Feature

  def self.is_enabled?(feature_name)
    feature_toggle_data[feature_name][:enabled]
  end

  private
  def self.default_feature_toggles_file_name
    'feature_toggles.yml'
  end

  def self.feature_toggle_data
    @loader ||= FeatureToggles::Loader.new(Rails.env)
    @feature_toggle_data ||= @loader.load(default_feature_toggles_file_name)
  end

end