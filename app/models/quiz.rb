class Quiz < ApplicationRecord
  has_many :questions
  validates :quizz_slug, presence: true, uniqueness: true

end
