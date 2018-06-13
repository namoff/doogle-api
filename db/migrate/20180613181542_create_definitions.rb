class CreateDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :definitions do |t|
      t.text :word_definition
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
