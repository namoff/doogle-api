class CreateSubDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_definitions do |t|
      t.text :word_sub_definition
      t.references :definition, foreign_key: true

      t.timestamps
    end
  end
end
