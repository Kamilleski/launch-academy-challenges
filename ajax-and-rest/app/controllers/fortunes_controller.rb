class FortunesController < ApplicationController
  def index
    @fortunes = Fortune.order(created_at: :desc).limit(10)
  end

  def create
    @fortune = Fortune.new(fortune_params)
    if @fortune.save
      redirect_to :index, success: "Fortune created!"
    else
      render :index, alert: "There was a problem with your request!"
    end
  end

  private
  def fortune_params
    params.require(:fortune).permit(:content)
  end
end
