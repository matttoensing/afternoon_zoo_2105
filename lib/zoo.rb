
class Zoo
  attr_reader :name, :street, :city, :state,         :zip_code, :inventory

  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end

  def animal_count
    @inventory.length
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animals_older_than(age)
    animal_age = []
    @inventory.each do |animal|
      animal_age << animal if age < (animal.age.gsub(/[weeks ]/, '').to_i)
    end
    animal_age
  end

  def total_weight_of_animals
    total_weight = []
    @inventory.each do |animal|
      total_weight << animal.weight.gsub(/[pounds ]/, '').to_i
    end
    total_weight.inject(&:+)
  end
end
