class AddPdftypeToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :show_pdf_type, :string
  end
end
