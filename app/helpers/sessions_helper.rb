# frozen_string_literal: true

# SessionsHelper
module SessionsHelper
  def logged_in?
    !(current_student.nil? || current_mentor.nil?)
  end
end
