class Courses
  attr_reader :course_name, :department, :credits
  attr_accessor :students

  def initialize(course_name, department, credits)
    @course_name = course_name
    @department = department
    @credits = credits
    @students = []
  end

  def student
    names = []
    students.each { |student| names << student.name }
    names * ", "
  end

  def add_student(student)
    unless students.include?(student)
      students << student
      student.enroll(self)
    end
  end

end

class Student
  attr_accessor :courses
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    unless courses.include?(course)
      courses << course
      course.add_student(self)
    end
  end

  def course_load
    course_hash = Hash.new(0)
    courses.each do |course|
      # if course_hash.include?(course.department)
        course_hash[course.department] += course.credits
      # else
        # course_hash[course.department] = course.credits
      # end
    end

    course_hash
  end

end
