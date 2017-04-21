class AddSignatureToPdFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :pd_files, :signature, :text
  end
end
