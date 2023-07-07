class CreateInputs < ActiveRecord::Migration[7.0]
  def change
    create_table :inputs do |t|
      t.string :file_type
      t.string :flashcard_type
      t.string :data
      t.string :language
      t.string :language_level
      t.string :story_length
      t.string :topic

      t.timestamps
    end
  end
end
