#rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'

resque_config = YAML.load_file(::Rails.root.to_s + '/config/resque.yml')
#resque_config = File.join(File.dirname(__FILE__), "../config/resque.yml")
Resque.redis = resque_config[rails_env]
