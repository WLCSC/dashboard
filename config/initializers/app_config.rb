raw_config = File.read("#{Rails.root}/config/app_config.yml")
APP_CONFIG = YAML.load(raw_config)['dashboard'].symbolize_keys
