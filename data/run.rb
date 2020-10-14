#!/usr/bin/env ruby
require 'open-uri'
require 'active_support'
require 'active_support/core_ext'

headers = {
  キャラ: 'NPC',
  階: 'Floors',
  HP: 'HP',
  攻撃: 'Atk',
  防御: 'Def',
  経験値: 'Exp',
  熟練値: 'Skill',
  武器: 'weapon',
  落昼: 'F',
  店夜: 'S',
  変化: 'P',
  トド: 'Z',
  ﾄﾘｺﾏ: 'M',
  高級: 'E',
  救助: 'R',
  強さ: 'Power',
  '＋限界': 'Max',
  成長熟練値: 'Skill',
  買値: 'Buy',
  売値: 'Sell',
  印数: 'Slots',
  印: 'Rune',
  松明: 'Torch',
  盾: 'Shield',
  腕輪: 'Bracelet',
  '矢・石': 'Projectile',
  'おにぎり・仙桃': 'Food',
  草: 'Grass',
  巻物: 'Scroll',
  杖: 'Staff',
  札: 'Talisman',
  壺: 'Pot',
  その他: 'Other',
  ワナ: 'Trap'
}.with_indifferent_access

npcs = {
  タグ屋: 'Tagger',
  小次郎太さま: 'Kojirouta',
  ゲンさん: 'Gen',
  タオ: 'Tao',
  おコン: 'Okon',
  コハル: 'Koharu',
  ガチャガッチャン: 'Gachagacha',
  初級マスター: 'Apprentice',
  中級マスター: 'Tradesman',
  '娘(1)': 'Upgrader',
  かじ職人: 'Blacksmith 1',
  かじ営業: 'Blacksmith 2',
  行商人: 'Peddler',
  チロロ: 'Chiroro',
  メッキー: 'Mekky',
  '爺(2)': 'Researcher',
  若者: 'Connoisseur',
  '娘(2)': 'Lost Soul',
  男: 'Gambler',
  鑑定士: 'Appraiser' 
}.with_indifferent_access

items = {

}

def npc_table lines, npcs, columns
  html = []
  regex = /(\S+)/
  count = 0

  html.push('<tr>')

  while count < lines.length
    row = []
    lines[count].scan(regex) do |line|
      row.push("<td>#{npcs[line[0]] || line[0]}</td>")
    end
    count = count + 1
    html.push(row.slice(0, 2))
  end

  html.push('</tr>')
  html = html.join("\n")

  html
end

# --- main ---
html = []
file = File.read('01_npc')
line_count = `wc -l 01_npc`.strip.split(' ')[0].to_i
start_new_column = (line_count.to_f / 2).ceil
columns = 1
count = 0

columns = (line_count.to_f / 2).ceil == 10 ? columns + 1 : columns
html.push('<table class="npc_table"><tr>')

i = 0
while i < columns
  i += 1
  html.push('<th>NPC</th><th>Floors</th>')
end
html.push('</tr>')

File.foreach('01_npc').each_slice(2) do |lines|
  html.push(npc_table(lines, npcs, columns))
end

puts html.join("\n")
