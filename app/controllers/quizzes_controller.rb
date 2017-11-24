class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
    @questions.each_with_index do |question, index|
      question.current_index = index + 1
      question.save
    end
    redirect_to question_path(@questions.first)
  end

end
