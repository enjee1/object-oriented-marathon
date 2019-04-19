# require_relative "cage"

class Zoo
  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @cages = []
    @employees = []
    build_cages
  end

  def build_cages
    10.times do
      @cages << Cage.new
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
    open_cage_index = @cages.index { |cage| cage.animal.nil? }
    if !open_cage_index.nil?
      @cages[open_cage_index].animal = animal
    else
      "Your zoo is already at capacity!"
    end
  end

  def visit
    message_from_zoo = ""
    @cages.each do |cage|
      if !cage.animal.nil?
        message_from_zoo += "#{cage.animal.speak}\n"
      end
    end
    @employees.each do |employee|
      message_from_zoo += "#{employee.greet}\n"
    end 
    message_from_zoo
  end
end
