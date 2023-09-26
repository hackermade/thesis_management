# app/controllers/professors/reviews_controller.rb
class Professors::ReviewsController < ApplicationController
  before_action :authenticate_professor!

  def show
    @thesis = Thesis.find(params[:id])
  end

  def update
    @thesis = Thesis.find(params[:id])
    if @thesis.update(thesis_params)
      flash[:success] = 'Thesis review updated.'
      redirect_to professors_review_path(@thesis)
    else
      render 'show'
    end
  end

  private

  def thesis_params
    params.require(:thesis).permit(:grade, :meeting_date)
  end
end
