#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

answers = file.readlines.map(&:strip)

blanks = answers.each_index.select { |index| answers[index] == '' }

n = 0
count = 0

while n <= blanks.size
  start = n.zero? ? 0 : blanks[n - 1] + 1
  finish = n == blanks.size ? answers.size - 1 : blanks[n] - 1
  answer = answers[start..finish]
  n += 1

  count += answer.join.chomp.chars.uniq.size
end

puts count
