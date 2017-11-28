class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)

    if @question.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
