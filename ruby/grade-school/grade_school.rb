class School
  def initialize
    @students = []
  end

  def students(grade_number)
    store(grade_number)
    grade.fetch(:students, [])
  end

  def students_by_grade
    @students.sort_by { |group| group[:grade] }
  end

  def add(name, grade_number)
    store(grade_number)
    add_name_to_grade(name)
  end

  private

  def store(grade_number)
    @grade = grade_number
  end

  def grade
    @students.select { |group| group[:grade] == @grade }.first || {}
  end

  def add_name_to_grade(name)
    add_empty_grade unless grade_exists?
    (grade[:students] << name).sort!
  end

  def add_empty_grade
    @students << { grade: @grade, students: [] }
  end

  def grade_exists?
    return false unless grade

    !grade.empty?
  end
end

module BookKeeping
  VERSION = 3
end
