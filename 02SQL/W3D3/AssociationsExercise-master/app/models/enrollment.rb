class Enrollment < ActiveRecord::Base
  belongs_to(
    :course,
    class_name: "Course",
    foreign_key: :course_id,
    primary_key: :id
  )

  belongs_to(
    :student,
    class_name: "User",
    foreign_key: :student_id,
    primary_key: :id
  )
end
