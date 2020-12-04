#!/usr/bin/env ruby

REQUIRED_KEYS = [
  'ecl',
  'pid',
  'eyr',
  'hcl',
  'byr',
  'iyr',
  'hgt',
]

filename = ARGV.first
file = File.open(filename)

passports = file.readlines.map(&:strip)

blanks = passports.each_index.select { |index| passports[index] == '' }

n = 0
count = 0

while n <= blanks.size
  start = n.zero? ? 0 : blanks[n - 1] + 1
  finish = n == blanks.size ? passports.size - 1 : blanks[n] - 1
  passport = passports[start..finish]
  n += 1
  keys = []
  passport.join(' ').split(' ').each do |keyval|
    key, val = keyval.split(':')
    keys << key
  end
  count += 1 if REQUIRED_KEYS - keys == []
end

puts "I found #{count} valid passports"
