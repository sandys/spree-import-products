
module ImportProducts
  class ImportJobResque
      @queue = :import_job_resque

      def self.perform(product_import_id, user_id)
        begin
          product_import = ProductImport.find(product_import_id)
          results = product_import.import_data!
          #a= "ABALONE-01"
          #p = Product.find(:first, :conditions => ["#{Product.connection.quote_column_name("permalink")} = ?", a])          
          #puts ("Finished!!!!!!! => #{p}")
          #UserMailer.product_import_results(User.find(user_id)).deliver
        rescue Exception => exp
          puts "NOT Finished!!!!!!! #{exp.message}"
          #UserMailer.product_import_results(User.find(user_id), exp.message).deliver
        end
      end
    end
end
