class QuizSessionsController < ApplicationController
  def create
    @session = QuizSession.new(session_params)
    @session.save
    redirect_to question_path(@session.quiz.questions.first)
  end

  private

  def session_params
    params.require(:quiz_session).permit(:quiz_id)
  end
end
