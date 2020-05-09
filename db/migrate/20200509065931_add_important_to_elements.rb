class AddImportantToElements < ActiveRecord::Migration[6.0]
  def change
    add_column :elements, :important, :boolean
  end
end
