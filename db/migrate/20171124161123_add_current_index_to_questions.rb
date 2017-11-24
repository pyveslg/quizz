class AddCurrentIndexToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :current_index, :integer
  end
end
