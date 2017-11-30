class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @previous_id = @question.previous_id

  end

  def update
    @question = Question.find(params[:id])
    user_answer = question_params.values[0].to_i
    if @question.answer == user_answer
      @quiz = @question.quiz
      if @quiz.score.nil?
        @quiz.score = 1
      else
        @quiz.score += 1
      end
      @quiz.save
    end
    @next_id = @question.next_id
    if @next_id.nil?
      redirect_to quiz_path(@quiz)
    else
      redirect_to question_path(@next_id)
    end

  end


private
  def question_params
    params.require(:question).permit(:current_index)
  end

end
