class QuestionsController < ApplicationController
  # Skip CSRF verification for the upvote action
  skip_before_action :verify_authenticity_token, only: [:upvote]
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_question, only: %i[show upvote]

  def upvote
    @question.increment!(:upvotes)
    render json: @question
  end

  def index
    questions = Question.all.order(upvotes: :desc)
    render json: questions
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
