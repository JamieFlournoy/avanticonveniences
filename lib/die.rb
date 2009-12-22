class Die
  def Die.roll(sides)
    (rand * sides).to_i + 1
  end
end
