class Admin::ProductImportsController < Admin::BaseController

  #Sorry for not using resource_controller railsdog - I wanted to, but then... I did it this way.
  #Verbosity is nice?
  #Feel free to refactor and submit a pull request.

  def index
    redirect_to :action => :new
  end

  def new
    @product_import = ProductImport.new
  end


  def create
    @product_import = ProductImport.create(params[:product_import])
    
    if  ImportProducts::Engine.config.spree_import_products_backend == :resque
      Resque.enqueue  ImportProducts::ImportJobResque, @product_import.id, @current_user.id
    elsif ImportProducts::Engine.config.spree_import_products_backend == :delayed_job 
      Delayed::Job.enqueue ImportProducts::ImportJob.new(@product_import, @current_user)
    else 
      raise "No configured backend"
    end
    flash[:notice] = t('product_import_processing')
    redirect_to admin_product_imports_path
  end
end
