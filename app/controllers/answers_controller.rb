class AnswersController < ApplicationController
  before_action :find_question
  before_action :find_answer, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.user_id = current_user.id

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body_text)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
