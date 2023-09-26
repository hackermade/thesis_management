# app/controllers/students/theses_controller.rb
class Students::ThesesController < ApplicationController
  before_action :authenticate_student!

  # Action to display a student's thesis
  def show
    @thesis = current_student.theses.find(params[:id])

    # Check if grades and meeting dates are pending
    @thesis.grades_pending = @thesis.grades_data.blank?
    @thesis.meeting_date_pending = @thesis.meeting_dates_data.blank?
  end

  # Action to display the form for submitting a new thesis
  def new
    @thesis = current_student.theses.build
  end

  # Action to handle the creation of a new thesis
  def create
    @thesis = current_student.theses.build(thesis_params)
    if @thesis.save
      flash[:success] = 'Thesis submitted successfully.'
      redirect_to students_thesis_path(@thesis)
    else
      render 'new'
    end
  end

  private

  # Strong parameters for thesis submission
  def thesis_params
    params.require(:thesis).permit(:title, :start_date, :implementation_languages, :technologies, :file)
  end
end
