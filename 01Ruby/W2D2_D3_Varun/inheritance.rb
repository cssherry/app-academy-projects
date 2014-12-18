class Employee

  @@employee_list = []

  attr_reader :name, :title, :salary, :boss, :employee_list

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @@employee_list << self
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee

  attr_reader :all_employees

  def initialize(name, title, salary, boss = nil)
    super
    @all_employees = employee_list_generator
  end

  def employee_list_generator
    employees = @@employee_list.select { |employee| employee.boss == name }
    # employees.collect { |employee| employee.name}
  end

  def bonus(multiplier)
    sum = 0
    @all_employees.each do |employee|
      sum += employee.bonus(multiplier)
      sum += employee.salary * multiplier if employee.class == Manager
    end
    sum
  end
end

# e2= Employee.new("Jeff", "TA", 50_000, "Ned")
# e3= Employee.new("Shawna", "TA", 50_000, "Ned")
david = Employee.new("David", "TA", 10_000, "Darren")
shawna= Employee.new("Shawna", "TA", 12_000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78_000, "Ned")
ned = Manager.new("Ned", "Founder", 1_000_000)

p darren.bonus(4) # => 500_000
p ned.bonus(5)
