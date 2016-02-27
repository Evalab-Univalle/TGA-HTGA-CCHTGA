


Given(/^as a test function the sum of squares of z$/) do
  @htga = HTGA.new
  @htga.selected_func = lambda do |x|
    x.inject(0){ |sum, x| sum + x**2 }
  end
end

Given(/^the chromosome x being$/) do |table|
  table = table.raw
  @chromosome_x = Chromosome.new
  table[0].each do |item|
    @chromosome_x << item.to_i
  end
end

Given(/^the chromosome y being$/) do |table|
  table = table.raw
  @chromosome_y = Chromosome.new
  table[0].each do |item|
    @chromosome_y << item.to_i
  end
end

=begin
Given(/^the selected Taguchi array is L(\d+)$/) do |arg1|
  @htga.taguchi_array = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 1, 1, 1],
    [0, 1, 1, 0, 0, 1, 1],
    [0, 1, 1, 1, 1, 0, 0],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 1, 0, 1, 0],
    [1, 1, 0, 0, 1, 1, 0],
    [1, 1, 0, 1, 0, 0, 1]
  ]
end
=end
Then(/^the optimal chromosome should be$/) do |table|
  table = table.raw
  expected_chromosome = Chromosome.new
  table[0].each do |item|
    expected_chromosome << item.to_i
  end
  calculated_chromosome = @htga.generate_optimal_chromosome @chromosome_x, @chromosome_y
  expect(calculated_chromosome).to eq(expected_chromosome)
end
