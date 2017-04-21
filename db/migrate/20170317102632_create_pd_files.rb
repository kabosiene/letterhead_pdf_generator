class CreatePdFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :pd_files do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
