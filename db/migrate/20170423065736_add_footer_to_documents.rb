class AddFooterToDocuments < ActiveRecord::Migration[5.0]
  def change
     add_column :documents, :footer, :text
  end
end
