require_relative "./employee.rb"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(employee_name, title)
    if !valid_title?(title)
      raise "Not valid title"
    end
    @employees << Employee.new(employee_name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    if self.funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise "Does not have sufficient fund"
    end
  end

  def payday
    @employees.each do |employee|
      pay_employee(employee)
    end
  end

  def average_salary
    total = employees.reduce(0) do |sum, employee|
      sum += @salaries[employee.title]
    end

    return total / employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each do |k, v|
      if !self.salaries.has_key?(k)
        @salaries[k] = v
      end
    end
    @employees += other_startup.employees
    other_startup.close
  end

end
