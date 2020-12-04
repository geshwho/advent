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

ECL = %w(amb blu brn gry grn hzl oth)

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
    valid = case key
    when 'ecl'
      ECL.include?(val)
    when 'pid'
      val.match /\A[0-9]{9}\Z/
    when 'eyr'
      val.to_i.between?(2020, 2030)
    when 'hcl'
      val.match /\A#[0-9a-f]{6}\Z/
    when 'byr'
      val.to_i.between?(1920, 2002)
    when 'iyr'
      val.to_i.between?(2010, 2020)
    when 'hgt'
      if val[-2..-1] == 'cm'
        val[0..-2].to_i.between?(150, 193)
      elsif val[-2..-1] == 'in'
        val[0..-2].to_i.between?(59, 76)
      end
    end
    keys << key if valid
  end
  if REQUIRED_KEYS - keys == []
    count += 1 
    puts "Valid PP"
    puts passport
    puts ''
  end
end

puts "I found #{count} valid passports"
