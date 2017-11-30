class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find_by("quizz_slug = '#{params[:quizz_slug]}'")
    @questions = @quiz.questions
    @questions_ids = @questions.pluck(:id)
  end

end
