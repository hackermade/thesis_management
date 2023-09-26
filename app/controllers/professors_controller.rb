# app/controllers/professors_controller.rb
class ProfessorsController < ApplicationController
  before_action :authenticate_professor!

  def index
    # Professor-specific logic to list theses for grading
    @theses = Thesis.order(created_at: :asc)
  end

  def show
    # Professor-specific logic to view a thesis for grading
    @thesis = Thesis.find(params[:id])
  end

  def edit
    @thesis = Thesis.find(params[:id])
    if @thesis.professor != current_professor
      redirect_to professors_theses_path, alert: 'You are not authorized to edit this thesis.'
    end
  end

  def update_thesis
    @thesis = Thesis.find(params[:id])
    if @thesis.update(thesis_params)
      redirect_to professors_show_path(id: @thesis.id), notice: 'Thesis grades and meeting date updated.'
    else
      render 'edit'
    end
  end


    def update
    @professor = current_professor
    if @professor.update(professor_params)
      redirect_to professors_path, notice: 'Professor profile updated successfully.'
    else
      render 'edit'
    end
  end


def assign_thesis
  @thesis = Thesis.find(params[:id])
  @thesis.professor = current_professor
  if @thesis.save
    redirect_to professors_show_path(id: @thesis.id), notice: 'Thesis assigned successfully.'
  else
    redirect_to professors_index_path, alert: 'Failed to assign thesis.'
  end
end


  private

  def thesis_params
    params.require(:thesis).permit(:grades, :meeting_date)
  end
end
