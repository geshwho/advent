#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

numbers = file.readlines.map(&:to_i).sort

a = 0
b = numbers.size - 1

while true
  if numbers[a] + numbers[b] == 2020
    break
  elsif numbers[a] + numbers[b] > 2020
    b -= 1
  else
    a += 1
  end
end

puts "I found #{numbers[a]} and #{numbers[b]}"
puts "Here's the product: #{numbers[a] * numbers[b]}"
