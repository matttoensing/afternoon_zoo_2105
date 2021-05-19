class Animal
  attr_reader :kind, :weight, :age

  def initialize(kind, weight, age)
    @kind = kind
    @weight = "#{weight} pounds"
    @age = "#{age} weeks"
  end

  def age_in_days
     @age = age.gsub(/[weeks ]/, '').to_i
     @age * 7
  end

  def feed!(amount)
    @weight = weight.gsub(/[pounds ]/, '').to_i
    @weight = @weight + amount
    @weight = "#{@weight} pounds"
  end
end
