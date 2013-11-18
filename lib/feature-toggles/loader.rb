class FeatureToggles::Loader

  def initialize(env)
    @env = env
  end

  def load(file_name)
    @feature_toggle_data ||= begin
      file_path = Rails.root.join("config", file_name)
      toggle_settings = HashWithIndifferentAccess.new(YAML::load(File.open(file_path)))
      toggle_settings[@env]
    end
  end

end