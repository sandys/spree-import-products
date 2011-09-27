
Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "product_import_management",
#                     :insert_bottom => "[data-hook='admin-tabs']",
                     :insert_bottom => "div#admin-menu ul",
                     :text => "<%= tab(:product_imports) %>",
                     :disabled => false)
