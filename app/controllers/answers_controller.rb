class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_question, only: %i[index create]
  before_action :set_answer, only: %i[show destroy]
  before_action :set_answer, only: [:show, :upvote]
  skip_before_action :verify_authenticity_token, only: [:upvote]


  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @answer
  end

  def destroy
    @answer.destroy
    head :no_content
  end

  def index
    answers = @question.answers.order(upvotes: :desc)
    render json: answers  # Render JSON response, not HTML
  end

  def upvote
    @answer.increment!(:upvotes)  # Increment the upvotes count
    render json: @answer  # Return the updated answer in the response
  end


  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
