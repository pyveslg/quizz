class Question < ApplicationRecord
  belongs_to :quiz

  def next_id
    self.class.where('id > ? and quiz_id = ?', self.id, self.quiz_id).pluck(:id).first
  end

  def previous_id
    self.class.where('id < ? and quiz_id = ?', self.id, self.quiz_id).pluck(:id).last
  end
end

