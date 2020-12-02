#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

count = file.readlines.select do |line|
  first, password = line.split(':').map(&:strip)
  first, char = first.split(' ').map(&:strip)
  min, max = first.split('-').map(&:to_i)

  (password[min - 1] == char) ^ (password[max - 1] == char)
end.size

puts "I found #{count} valid passwords"
