require 'spree_core'
#require 'import_products_hooks'
require 'delayed_job'
require 'resque'

module ImportProducts
  class Engine < Rails::Engine
    engine_name 'import_products'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      UserMailer.send(:include, ImportProducts::UserMailerExt)

    end

    config.to_prepare &method(:activate).to_proc
  end
end
