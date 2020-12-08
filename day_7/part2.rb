#!/usr/bin/env ruby

filename = ARGV.first
file = File.open(filename)

edges = file.readlines.map(&:strip)

mapping = {}
Ending = Struct.new(:count, :color)

edges.each do |edge|
  start, endings = edge.split('bags contain').map(&:strip)
  endings = endings.gsub('.', '').split(',').map(&:strip).map { |x| x == 'no other bags' ? [] : x }
  endings.map! do |e|
    unless e.empty?
      count = e.scan(/\d+/).join('').to_i
      Ending.new(count, e.gsub(/\d/, '').gsub(/bag(s)?/, '').strip)
    end
  end
  mapping[start] = endings
end

def count(mapping, start)
  mapping[start].sum { |e| e.nil? ? 0 : e.count + e.count * count(mapping, e.color) }
end

puts count(mapping, 'shiny gold')
