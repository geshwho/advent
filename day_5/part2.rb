#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

seats = file.readlines.map(&:strip)

def get_it(seat)
  row, col = seat.split(/(?<=^.{7})/)
  row = row.gsub('F', '0').gsub('B', '1').to_i(2)
  col = col.gsub('L', '0').gsub('R', '1').to_i(2)
  seat_id = 8 * row + col
end

seats.map! do |seat|
  get_it(seat)
end.sort!

min = seats.min
max = seats.max

all = (min..max).to_a
puts all - seats


