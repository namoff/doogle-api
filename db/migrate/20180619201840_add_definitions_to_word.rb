class AddDefinitionsToWord < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :definitions, :text
  end
end
