class Zoo
  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @employees = []
    @cages = [].tap do |cages|
      10.times do
        cages << Cage.new
      end
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    if @opening_date <= date && @closing_date >= date
      true
    else
      false
    end
  end

  def add_animal(animal)
    empty_cage = @cages.find { |cage| cage.empty? }
    if !empty_cage.nil?
      empty_cage.animal = animal
    else
      "Your zoo is already at capacity!"
    end
  end

  def visit
    message_from_zoo = ""
    @employees.each do |employee|
      message_from_zoo << employee.greet + "\n"
    end

    @cages.each do |cage|
      if !cage.animal.nil?
        message_from_zoo << cage.animal.speak + "\n" if !cage.empty?
      end
    end
    message_from_zoo
  end
end
