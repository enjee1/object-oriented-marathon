class Cage
  attr_accessor :animal

  def initialzie
    @animal = animal
  end

  def empty?
    if @animal == nil
      true
    else
      false
    end
  end

end
