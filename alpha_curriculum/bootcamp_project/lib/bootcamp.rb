class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new {|hash, k| hash[k] = []}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(new_teacher)
    @teachers << new_teacher
  end

  def enroll(new_student)
    if @students.length < @student_capacity
      @students << new_student
      return true
    else
      return false
    end
  end

  def enrolled?(student_name)
    @students.include?(student_name)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student_name, grade)
    if @students.include?(student_name)
      @grades[student_name] << grade
      return true
    else
      return false
    end
  end

  def num_grades(student_name)
    @grades[student_name].length
  end

  def average_grade(student_name)
    if @students.include?(student_name)
      if num_grades(student_name) == 0
        return nil
      else
        @grades[student_name].reduce(:+) / num_grades(student_name)
      end
    else
      return nil
    end
  end
end
