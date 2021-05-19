require './lib/animal'
require './lib/zoo'


RSpec.describe Zoo do
  before :each do
    @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    @animal_1 = Animal.new("Sea Otter", 10, 25)
    @animal_2 = Animal.new("Red Panda", 5, 70)
    @animal_3 = Animal.new("Capybara", 100, 150)
    @animal_4 = Animal.new("Dolphin", 150, 200)
    @animal_5 = Animal.new("Dog", 65, 200)
  end
  it 'exists' do
    expect(@zoo).to be_an_instance_of(Zoo)
  end

  it 'has a name' do
    expect(@zoo.name).to eq("Bronx Zoo")
  end

  it 'has a street' do
    expect(@zoo.street).to eq("2300 Southern Blvd")
  end

  it 'is located in a city' do
    expect(@zoo.city).to eq("Bronx")
  end

  it 'is in a city' do
    expect(@zoo.state).to eq("NY")
  end

  it 'has a zip code' do
    expect(@zoo.zip_code).to eq("10460")
  end

  it 'has an empty inventory by default' do
    expect(@zoo.inventory).to eq([])
  end

  it 'has not yet added animals' do
    expect(@zoo.animal_count).to eq(0)
  end

  it 'can add animals to inventory' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)

    expect(@zoo.inventory).to eq([@animal_1, @animal_2])
    expect(@zoo.animal_count).to eq(2)
  end

  # iteration 3

  it 'has animals in inventory' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.inventory).to eq([@animal_1, @animal_2, @animal_3, @animal_4])
  end

  it 'can tell age of animals' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.animals_older_than(250)).to eq([])
  end

  it 'can put animals in age category' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.animals_older_than(100)).to eq([@animal_3, @animal_4])
    expect(@zoo.animals_older_than(10)).to eq([@animal_1, @animal_2, @animal_3, @animal_4])
  end

  it 'can measure weight of all animals' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.total_weight_of_animals).to eq(265)
  end

  it 'has details' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.details).to eq({"total_weight" => 265, "street_address" => "2300 Southern Blvd"})
  end

  # iteration 4

  it 'can sort animals by weight' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.animals_sorted_by_weight).to eq([@animal_4, @animal_3, @animal_1, @animal_2])
  end

  it '' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)
    @zoo.add_animal(@animal_5)

    expect(@zoo.hash).to eq({
    "C" => [@animal_3],
    "D" => [@animal_5, @animal_4],
    "R" => [@animal_2],
    "S" => [@animal_1]
    })
  end

end
