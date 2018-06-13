class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word_name
      t.string :word_class

      t.timestamps
    end
  end
end
