#http://www.stubbleblog.com/index.php/2011/04/writing-rails-engines-getting-started/

module ImportProducts 
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../..", __FILE__)

      def copy_config_files
        resource_file =  File.join("config",'resque.yml')
        say_status("copying", "#{resource_file} --->>  config/#{File.basename(resource_file)}", :green)
        copy_file resource_file, "config/#{File.basename(resource_file)}"
      end

      #def add_migrations
      #  run 'rake railties:install:migrations FROM=import_products'
      #  # run 'rake railties:install:migrations FROM=spree_reivews'
      #end
      
      #def run_migrations
      #   res = ask "Would you like to run the migrations now? [Y/n]"
      #   if res == "" || res.downcase == "y"
      #     run 'rake db:migrate'
      #   else
      #     puts "Skiping rake db:migrate, don't forget to run it!"
      #   end
      #end

    end
  end
end
