#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

map = file.readlines

slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2],
]

product = 1

slopes.each do |slope|
  x = 0
  y = 0
  right = slope.first
  down = slope.last
  trees = 0

  while y < map.size
    trees += 1 if map[y][x] == '#'
    y += down
    x = (x + right) % (map[0].size - 1)
  end
  puts "For Right #{right}, Down #{down}, I hit #{trees} trees"
  product = trees * product
end

puts "The total product is #{product}"
