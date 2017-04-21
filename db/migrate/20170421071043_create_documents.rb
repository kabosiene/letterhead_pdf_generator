class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :client
      t.text :body_text
      t.date :file_date

      t.timestamps
    end
  end
end
