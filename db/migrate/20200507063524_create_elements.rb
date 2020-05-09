
class CreateElements < ActiveRecord::Migration[6.0]
  def change
  	create_table :elements do |t|
      t.text :text
      #t.boolean :important

      t.timestamps
    end
  end
end

