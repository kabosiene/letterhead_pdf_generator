class AddColumnsToPdfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :pd_files, :file_date, :date
    add_column :pd_files, :file_heading, :string
    add_column :pd_files, :client_field, :string
    add_column :pd_files, :client_name, :string
    add_column :pd_files, :body_text, :text
    add_column :pd_files, :footer, :text
    add_column :pd_files, :side_text, :string

  end
end
