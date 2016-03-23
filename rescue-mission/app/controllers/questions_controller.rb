class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @submitter = User.where(id: @question.user_id).first.name
    if @question.answers.nil?
      @message = "No answers for this question yet! Do you have one?"
    else
      @message = ""
      @answers = @question.answers
    end
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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)

    if @question.save
     redirect_to @question
    else
     flash[:error] = "Recheck your update..."
     redirect_to edit_question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
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
