class CreateQuizSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_sessions do |t|
      t.references :quiz, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
