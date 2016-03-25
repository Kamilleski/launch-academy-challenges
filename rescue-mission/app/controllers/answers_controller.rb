class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question)
    else
      flash[:error] = @answer.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
