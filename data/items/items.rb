#!/usr/bin/env ruby
require 'open-uri'
require 'active_support'
require 'active_support/core_ext'

weapon_en = {
  ただの棒: 'Ordinary Stick',
  銅の刃: 'Tin Blade',
  カタナ: 'Katana'
}.with_indifferent_access

other_en = {
  # Torches
  松明: 'Torch',
  良い松明: 'Fine Torch',
  すごい松明: 'Super Torch',
  # Catstones
  レッドキャット: 'Red Cat',
  オレンジキャット: 'Orange Cat',
  イエローキャット: 'Yellow Cat',
  グリーンキャット: 'Green Cat',
  ブルーキャット: 'Blue Cat',
  インディゴキャット: 'Indigo Cat',
  パープルキャット: 'Purple Cat',
  # Other
  ギタン: 'Gitan'
}.with_indifferent_access

food_en = {
  # Onigiri
  おにぎり: 'Onigiri',
  大きいおにぎり: 'Large Onigiri',
  巨大なおにぎり: 'Huge Onigiri',
  くさったおにぎり: 'Rotten Onigiri',
  特製おにぎり: 'Special Onigiri',
  巨犬なおにぎり: 'Dog Onigiri',
  # Peaches
  かたい仙桃: 'Hard Peach',
  普通の仙桃: 'Peach',
  やわらかな仙桃: 'Juicy Peach',
  くさった仙桃: 'Rotten Peach'
}.with_indifferent_access

headers_en = {
  落昼: 'F', # Floor
  店夜: 'S', # Shop
  変化: 'P', # Presto
  トド: 'Z', # Zalokleft
  ﾄﾘｺﾏ: 'M', # Mealy
  高級: 'E'  # Elite
}.with_indifferent_access

def parse_range word
  has_slash = word =~ /\//

  result = ''
  if word == '-'
    result = ''
  elsif word == '1-99'
    result = 'X'
  elsif !has_slash
    result = word
  elsif has_slash
    result = 'X'
  end
end

filenames = ['weapon', 'shield', 'bracelet', 'scroll', 'grass',
  'projectile', 'staff', 'pot', 'talisman', 'food', 'torch', 'other']

html = []
th = ['Name', 'F', 'S', 'P', 'Z', 'M', 'E']
items = {
  'Weapon' => {}
}
weapon_en_array = weapon_en.to_a
file = File.read("destiny/weapon")
file.each_line do |line|
  words = line.scan(/(\S+)/)
  id = weapon_en_array.index {|key, | key == words[0][0]} || -1

  items['Weapon'][id] = {}
  items['Weapon'][id]['Name'] = weapon_en[words[0][0]] || 'MISSING_NAME'
  items['Weapon'][id]['F'] = parse_range(words[1][0])
  items['Weapon'][id]['S'] = parse_range(words[2][0])
  items['Weapon'][id]['P'] = parse_range(words[3][0])
  items['Weapon'][id]['Z'] = parse_range(words[4][0])
  items['Weapon'][id]['M'] = parse_range(words[5][0])
  items['Weapon'][id]['E'] = parse_range(words[6][0])

end

items['Weapon'].each do |entries|
  item_index = entries[0]
  item = entries[1]

  puts "<tr>
    <td>#{item['Name']}</td>
    <td>#{item['F']}</td>
    <td>#{item['S']}</td>
    <td>#{item['P']}</td>
    <td>#{item['Z']}</td>
    <td>#{item['M']}</td>
    <td>#{item['E']}</td>
  </tr>"
end








