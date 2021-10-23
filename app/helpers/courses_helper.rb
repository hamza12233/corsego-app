module CoursesHelper
  def enrollment_button(course)
    if current_user
      if course.user == current_user
        link_to course_path(course) do
          "You created this course " +
          number_to_currency(course.price)
        end
      elsif course.enrollments.where(user: current_user).any?
        link_to "You bought this course keep learning", course_path(course)
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: 'btn btn-success'
      else
        link_to "Free", new_course_enrollment_path(course), class: 'btn btn-success'
      end
      #logic to buy
    else
      link_to "Check price", new_course_enrollment_path(course), class: "btn btn-md btn-success"
    end
  end

end
