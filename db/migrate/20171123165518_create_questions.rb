class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :prop1
      t.string :prop2
      t.string :prop3
      t.integer :answer
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
