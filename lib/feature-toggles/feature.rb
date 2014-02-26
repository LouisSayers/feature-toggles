class FeatureToggles::Feature

  def self.is_enabled?(feature_name, user_type=nil)
    if user_type && has_user_specific_permission?(feature_name, user_type)
      enabled_for_user?(feature_name, user_type)
    else
      enabled_generally?(feature_name)
    end
  end

  private

  def self.enabled_generally?(feature_name)
    !!feature_permissions(feature_name)[:enabled]
  end

  def self.has_user_specific_permission?(feature_name, user_type)
    feature_permissions(feature_name).key?(user_type)
  end

  def self.enabled_for_user?(feature_name, user_type)
    !!Hash(feature_permissions(feature_name)[user_type])[:enabled]
  end

  def self.feature_permissions(feature_name)
    Hash(feature_toggle_data[feature_name])
  end


  def self.default_feature_toggles_file_name
    'feature_toggles.yml'
  end

  def self.feature_toggle_data
    @loader ||= FeatureToggles::Loader.new(Rails.env)
    @feature_toggle_data ||= @loader.load(default_feature_toggles_file_name)
  end

end
