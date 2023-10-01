class HomeController < ApplicationController
 def index
  student = current_student
  if student_signed_in? && current_student.theses.present?
   redirect_to student_path(id: student.theses.last.id)
  elsif student_signed_in? && current_student.theses.empty?
   redirect_to students_new_thesis_path
  elsif professor_signed_in?
   redirect_to professors_index_path
  else
    # for the users that aren't sign in
  end
  end
end
