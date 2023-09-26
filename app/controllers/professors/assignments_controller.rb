# app/controllers/professors/assignments_controller.rb
class Professors::AssignmentsController < ApplicationController
  before_action :authenticate_professor!

  def index
    @theses = Thesis.all
  end

  def show
    @thesis = Thesis.find(params[:id])
  end

  def assign_to_review
    thesis = Thesis.find(params[:id])
    if thesis.update(professor: current_professor)
      flash[:success] = 'Thesis assigned for review.'
      redirect_to professors_assignment_path(thesis)
    else
      flash[:error] = 'Unable to assign thesis for review.'
      redirect_to professors_assignments_path
    end
  end
end
