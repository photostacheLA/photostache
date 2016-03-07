class AddWebPageViewableToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :web_page_viewable, :boolean, default: false; 
  end
end
