#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

map = file.readlines

right = 1
down = 1
x = 0
y = 0
trees = 0

while y < map.size
  trees += 1 if map[y][x] == '#'
  y += down
  x = (x + right) % (map[0].size - 1)
end

puts "I hit #{trees} trees along the way"
