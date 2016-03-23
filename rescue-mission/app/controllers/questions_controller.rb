class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @submitter = User.where(id: @question.user_id).first.name
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @error = true
    @question = Question.new(question_params)
    if @question.save
      @error = false
      render :show
    else
      flash[:error] = "Invalid form submission"
      render :new
    end
  end

  def edit

  end

  def updated

  end

  def desetroy

  end

  private

  def question_params
    params.require(:question).permit(
    :title,
    :description,
    :user_id
    )
  end
end
