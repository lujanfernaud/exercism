class School
  def initialize
    @students = Hash.new([])
  end

  def add(name, grade)
    (@students[grade] += [name]).sort!
  end

  def students(grade)
    @students[grade]
  end

  def students_by_grade
    @students.sort.map(&by_grade)
  end

  private

  def by_grade
    proc { |grade, students| { grade: grade, students: students } }
  end
end

module BookKeeping
  VERSION = 3
end
