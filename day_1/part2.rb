#!/usr/bin/env ruby

require 'pry'

filename = ARGV.first
file = File.open(filename)

numbers = file.readlines.map(&:to_i).sort

b = numbers.size - 1
c = 0
a = c + 1

puts a, b, c

while true
  if a >= b
    c += 1
    a = c + 1
    b = numbers.size - 1
  elsif numbers[a] + numbers[b] + numbers[c] == 2020
    break
  elsif numbers[a] + numbers[b] + numbers[c] > 2020
    b -= 1
  else
    a += 1
  end
end

puts "I found #{numbers[a]} and #{numbers[b]} and #{numbers[c]}"
puts "Here's the product: #{numbers[a] * numbers[b] * numbers[c]}"
