# app/controllers/students_controller.rb
class StudentsController < ApplicationController
  before_action :authenticate_student!

  def show
    # Student-specific logic to display student profile or other relevant information
    @student = current_student
    @thesis = Thesis.find(params[:id])
  end

  def new_thesis
    @thesis = current_student.theses.build
  end

  def create_thesis
    @thesis = current_student.theses.build(thesis_params)
    if @thesis.save
      flash[:success] = 'Thesis submitted successfully.'
      redirect_to student_path(id: @thesis)
    else
      render 'new_thesis'
    end
  end

  private

  def thesis_params
    params.require(:thesis).permit(:title, :start_date, :implementation_languages, :technologies, :file)
  end
end
