#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

edges = file.readlines.map(&:strip)

mapping = {}
Ending = Struct.new(:count, :color)

edges.each do |edge|
  start, endings = edge.split('bags contain').map(&:strip)
  endings = endings.gsub('.', '').split(',').map(&:strip).map { |x| x == 'no other bags' ? nil : x }
  endings.map! do |e|
    unless e.nil?
      count = e.scan(/\d+/).join('').to_i
      Ending.new(count, e.gsub(/\d/, '').gsub(/bag(s)?/, '').strip)
    end
  end
  mapping[start] = endings
end

def contains(mapping, start)
  return false if start.nil?

  mapping[start].any? { |e| e&.color == 'shiny gold' || contains(mapping, e&.color) }
end

count = 0

mapping.each do |start, ending|
  if contains(mapping, start)
    count += 1
  end
end

puts count
