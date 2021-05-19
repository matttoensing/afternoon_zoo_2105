require 'rspec'
require './lib/animal'

RSpec.describe Animal do
  it 'exists' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal).to be_a(Animal)
  end

  it 'has a kind' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.kind).to eq("Sea Otter")
  end

  it 'has a weight' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.weight).to eq("10 pounds")
  end

  it 'has an age' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.age).to eq("25 weeks")
  end

  it 'has an age in days' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal.age_in_days).to eq(175)
  end

  it "can gain weight" do
    animal = Animal.new("Sea Otter", 10, 25)
    animal.feed!(2)

    expect(animal.weight).to eq("12 pounds")
    animal.feed!(1)

    expect(animal.weight).to eq("13 pounds")
  end
end
