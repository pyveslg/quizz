class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :quizz_slug
      t.string :quizz_name
      t.string :path
      t.integer :score

      t.timestamps
    end
  end
end
