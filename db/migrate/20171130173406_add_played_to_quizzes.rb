class AddPlayedToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :played, :boolean
  end
end
