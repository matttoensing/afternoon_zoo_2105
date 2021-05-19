
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
    total_weight = total_weight.inject(&:+)
    total_weight
  end

  def details
    details = Hash.new
    details["total_weight"] = total_weight_of_animals
    details["street_address"] = @street
    details
  end

  def animals_sorted_by_weight
    sorted = @inventory.sort_by { |animal| -animal.weight.gsub(/[pounds ]/, '').to_i }
  end

  def hash
    @inventory = @inventory.sort_by! {|dish| dish.kind }
    animal_hash = Hash.new {|hash, key| hash[key] = []}
    @inventory.each do |animal|
      animal_hash[animal.kind[0]] << animal
    end
    animal_hash
  end

end
