class CreateInvoiceLines < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_lines do |t|
      t.integer :pd_file_id
      t.text :content

      t.timestamps
    end
  end
end
