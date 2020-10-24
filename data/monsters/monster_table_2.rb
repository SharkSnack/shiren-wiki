#!/usr/bin/env ruby
require 'open-uri'
require 'active_support'
require 'active_support/core_ext'

monsters_en = {
  # Mamel
  マムル: 'Mamel',
  あなぐらマムル: 'Pit Mamel',
  洞窟マムル: 'Cave Mamel',
  ギタンマムル: 'Gitan Mamel',
  闇マムル: 'Dark Mamel',
  闇あなぐらマムル: 'Dark Pit Mamel',
  闇洞窟マムル: 'Dark Cave Mamel',
  闇ギタンマムル: 'Dark Gitan Mamel',
  # Sproutant
  おばけカイワレ: 'Sproutant',
  カイワレ入道: 'Sproutyrant',
  カイワレ魔王: 'Sprouterror',
  カイワレ大魔王: 'Sproutitan',
  夜おばけカイワレ: 'Vile Sproutant',
  夜カイワレ入道: 'Vile Sproutyrant',
  夜カイワレ魔王: 'Vile Sprouterror',
  夜カイワレ大魔王: 'Vile Sproutitan',
  # Colum
  コロン: 'Colum',
  コロロン: 'Cololum',
  コロコロン: 'Colocolum',
  コロコロコロン: 'Colocolocolum',
  悪コロン: 'Bad Colum',
  悪コロロン: 'Bad Cololum',
  悪コロコロン: 'Bad Colocolum',
  悪コロコロコロン: 'Bad Colocolocolum',
  # Seedie
  タネッコ: 'Seedie',
  アズキッコ: 'Beanie',
  ナッツッコ: 'Nuttie',
  ダイズッコ: 'Grainie',
  ダークタネッコ: 'Hateful Seedie',
  ダークアズキッコ: 'Hateful Beanie',
  ダークナッツッコ: 'Hateful Nuttie',
  ダークダイズッコ: 'Hateful Grainie',
  # Chintala
  チンタラ: 'Chintala',
  中チンタラ: 'Mid Chintala',
  大チンタラ: 'Big Chintala',
  特大チンタラ: 'Huge Chintala',
  悪チンタラ: 'Evil Chintala',
  悪中チンタラ: 'Evil Mid Chintala',
  悪大チンタラ: 'Evil Big Chintala',
  悪特大チンタラ: 'Evil Huge Chintala',
  # Grass Boy
  草子どり: 'Grass Boy',
  草兄どり: 'Grass Bro',
  草親どり: 'Grass Guy',
  草老いどり: 'Grass Gramps',
  黒草子どり: 'Dark Grass Boy',
  黒草兄どり: 'Dark Grass Bro',
  黒草親どり: 'Dark Grass Guy',
  黒草老いどり: 'Dark Grass Gramps',
  # Pin Kid
  針子どり: 'Pin Kid',
  針兄どり: 'Pin Dude',
  針親どり: 'Pin Poppa',
  針老いどり: 'Pin Gramps',
  黒針子どり: 'Foul Pin Kid',
  黒針兄どり: 'Foul Pin Dude',
  黒針親どり: 'Foul Pin Poppa',
  黒針老いどり: 'Foul Pin Gramps',
  # Sweet Nut
  あまぐりん: 'Sweet Nut',
  しぶぐりん: 'Acrid Nut',
  からぐりん: 'Spicy Nut',
  にがぐりん: 'Bitter Nut',
  腐りあまぐりん: 'Putrid Sweet Nut',
  腐りしぶぐりん: 'Putrid Acrid Nut',
  腐りからぐりん: 'Putrid Spicy Nut',
  腐りにがぐりん: 'Putrid Bitter Nut',
  # Blade Bee
  コガタナバチ: 'Blade Bee',
  ワキザシバチ: 'Dagger Bee',
  カタナバチ: 'Katana Bee',
  ダイトウバチ: 'Zanbeeto',
  闇コガタナバチ: 'Dark Blade Bee',
  闇ワキザシバチ: 'Dark Dagger Bee',
  闇カタナバチ: 'Dark Katana Bee',
  闇ダイトウバチ: 'Dark Zanbeeto',
  # Nigiri Baby
  にぎり見習い: 'Nigiri Baby',
  にぎり変化: 'Nigiri Morph',
  にぎり親方: 'Nigiri Boss',
  にぎり元締: 'Nigiri King',
  腐りにぎり見習い: 'Foul Nigiri Baby',
  腐りにぎり変化: 'Foul Nigiri Morph',
  腐りにぎり親方: 'Foul Nigiri Boss',
  腐りにぎり元締: 'Foul Nigiri King',
  # Froggo
  ガマラ: 'Froggo',
  ガマグッチ: 'Froggucci',
  ガマゴン: 'Froggon',
  ガマドーン: 'Kleptoad',
  腹黒ガマラ: 'Snide Froggo',
  腹黒ガマグッチ: 'Snide Froggucci',
  腹黒ガマゴン: 'Snide Froggon',
  腹黒ガマドーン: 'Snide Kleptoad',
  # Karakuroid
  カラクロイド: 'Karakuroid',
  スチームロイド: 'Steamroid',
  エレキロイド: 'Electroid',
  バイオロイド: 'Cyberoid',
  闇カラクロイド: 'Dark Karakuroid',
  闇スチームロイド: 'Dark Steamroid',
  闇エレキロイド: 'Dark Electroid',
  闇バイオロイド: 'Dark Cyberoid',
  # Tiger Tosser
  タイガーウッホ: 'Tiger Tosser',
  タイガーウホホ: 'Tiger Hurler',
  タイガーウホーン: 'Tiger Chucker',
  タイガーウボッホ: 'Tiger Ace',
  ダークウッホ: 'Dark Tosser',
  ダークウホホ: 'Dark Hurler',
  ダークウホーン: 'Dark Chucker',
  ダークウボッホ: 'Dark Ace',
  # Curse Girl
  ノロージョ: 'Curse Girl',
  ノロージョの姉: 'Cursister',
  ノロージョの母: 'Curspinster',
  ノロージョの婆: 'Cursenior',
  闇ノロージョ: 'Foul Curse Girl',
  闇ノロージョの姉: 'Foul Cursister',
  闇ノロージョの母: 'Foul Curspinster',
  闇ノロージョの婆: 'Foul Cursenior',
  # Fearabbit
  フィアーラビ: 'Fearabbit',
  ホラーラビ: 'Scarabbit',
  ドレッドラビ: 'Horrabbit',
  テリブルラビ: 'Terrabbit',
  闇フィアーラビ: 'Dark Fearabbit',
  闇ホラーラビ: 'Dark Scarabbit',
  闇ドレッドラビ: 'Dark Horrabbit',
  闇テリブルラビ: 'Dark Terrabbit',
  # Gyaza
  ギャザー: 'Gyaza',
  キラーギャザー: 'Death Gyaza',
  ヘルギャザー: 'Hell Gyaza',
  フォールギャザー: 'Doom Gyaza',
  悪ギャザー: 'Evil Gyaza',
  悪キラーギャザー: 'Evil Death Gyaza',
  悪ヘルギャザー: 'Evil Hell Gyaza',
  悪フォールギャザー: 'Evil Doom Gyaza',
  # Pumphantasm
  パコレプキン: 'Pumphantasm',
  パコレプキーナ: 'Pumphantom',
  パコレプキング: 'Pumpanshee',
  パコレプゴッド: 'Pumptergeist',
  悪パコレプキン: 'Vile Pumphantasm',
  悪パコレプキーナ: 'Vile Pumphantom',
  悪パコレプキング: 'Vile Pumpanshee',
  悪パコレプゴッド: 'Vile Pumptergeist',
  # Floaty
  フワッティー: 'Floaty',
  フカッティー: 'Poofy',
  モコッティー: 'Jouncy',
  ポヨッティー: 'Bouncy',
  悪フワッティー: 'Evil Floaty',
  悪フカッティー: 'Evil Poofy',
  悪モコッティー: 'Evil Jouncy',
  悪ポヨッティー: 'Evil Bouncy',
  # N'dubba
  ンドゥバ: "N'dubba",
  ンドゥルー: "N'twyn",
  ンバマ: "N'mach",
  ンバルーン: "N'dup",
  闇ンドゥバ: "Dark N'dubba",
  闇ンドゥルー: "Dark N'twyn",
  闇ンバマ: "Dark N'mach",
  闇ンバルーン: "Dark N'dup",
  # Mixer
  マゼルン: 'Mixer',
  マゼモン: 'Mixermon',
  マゼゴン: 'Mixergon',
  マゼドン: 'Mixerdon',
  ダークマゼルン: 'Dark Mixer',
  ダークマゼモン: 'Dark Mixermon',
  ダークマゼゴン: 'Dark Mixergon',
  ダークマゼドン: 'Dark Mixerdon',
  # Scorpion
  毒サソリ: 'Scorpion',
  鬼サソリ: 'VeniScorp',
  しびれサソリ: 'StunScorp',
  劇毒サソリ: 'BlightScorp',
  ダーク毒サソリ: 'Dark Scorpion',
  ダーク鬼サソリ: 'Dark VeniScorp',
  ダークしびれサソリ: 'Dark StunScorp',
  ダーク劇毒サソリ: 'Dark BlightScorp',
  # Mutaikon
  おばけ大根: 'Mutaikon',
  めまわし大根: 'Dazikon',
  ねむり大根: 'Dozikon',
  みだれ大根: 'Mesmerikon',
  ダークおばけ大根: 'Dark Mutaikon',
  ダークめまわし大根: 'Dark Dazikon',
  ダークねむり大根: 'Dark Dozikon',
  ダークみだれ大根: 'Dark Mesmerikon',
  # Naptapir
  うたたねバク: 'Naptapir',
  いねむりバク: 'Snooztapir',
  じゅくすいバク: 'Doztapir',
  とうみんバク: 'Comatapir',
  闇うたたねバク: 'Dark Naptapir',
  闇いねむりバク: 'Dark Snooztapir',
  闇じゅくすいバク: 'Dark Doztapir',
  闇とうみんバク: 'Dark Comatapir',
  # Swordsman
  ケンゴウ: 'Swordsman',
  イアイ: 'Fencer',
  シハン: 'Sensei',
  タツジン: 'Swordmaster',
  悪ケンゴウ: 'Evil Swordsman',
  悪イアイ: 'Evil Fencer',
  悪シハン: 'Evil Sensei',
  悪タツジン: 'Evil Swordmaster',
  # Mudkin
  ミドロ: 'Mudkin',
  ゲドロ: 'Muddy',
  オドロ: 'Mudster',
  チドロ: 'Mudder',
  ブラックミドロ: 'Shady Mudkin',
  ブラックゲドロ: 'Shady Muddy',
  ブラックオドロ: 'Shady Mudster',
  ブラックチドロ: 'Shady Mudder',
  # Polygon Spinna
  まわるポリゴン: 'Polygon Spinna',
  おどるポリゴン: 'Polygon Shaka',
  うたうポリゴン: 'Polygon Singa',
  らんぶポリゴン: 'Polygon Stunna',
  悪まわるポリゴン: 'Evil PolySpinna',
  悪おどるポリゴン: 'Evil PolyShaka',
  悪うたうポリゴン: 'Evil PolySinga',
  悪らんぶポリゴン: 'Evil PolyStunna',
  # Metalhead
  アイアンヘッド: 'Metalhead',
  チェインヘッド: 'Ironhead',
  ギガヘッド: 'Steelhead',
  デスヘッド: 'Doomhead',
  闇アイアンヘッド: 'Dark Metalhead',
  闇チェインヘッド: 'Dark Ironhead',
  闇ギガヘッド: 'Dark Steelhead',
  闇デスヘッド: 'Dark Doomhead',
  # Cheer-Ham
  フレフレハムポン: 'Cheer-Ham',
  ガンバレハムポン: 'Go-Ham!',
  ファイトハムポン: 'Rally Ham',
  アゲアゲハムポン: 'Spirit Ham',
  悪フレフレハムポン: 'Mean Cheer-Ham',
  悪ガンバレハムポン: 'Mean Go-Ham!',
  悪ファイトハムポン: 'Mean Rally Ham',
  悪アゲアゲハムポン: 'Mean Spirit Ham',
  # Kid Squid
  イカキング: 'Kid Squid',
  イカだいおう: 'Squidfficial',
  イカエンペラー: 'King Squid',
  イカカイザー: 'Squidperor',
  闇イカキング: 'Evil Kid Squid',
  闇イカだいおう: 'Evil Squidfficial',
  闇イカエンペラー: 'Evil King Squid',
  闇イカカイザー: 'Evil Squidperor',
  # Foly
  フォーリー: 'Foly',
  ダークフォーリー: 'Dark Foly',
  # Bored Kappa
  ひまガッパ: 'Bored Kappa',
  いやすぎガッパ: 'Kappa Pest',
  たまらんガッパ: 'Vexing Kappa',
  おてあげガッパ: 'Kappa Troll',
  闇ひまガッパ: 'Dark Bored Kappa',
  闇いやすぎガッパ: 'Dark Kappa Pest',
  闇たまらんガッパ: 'Dark Vexing Kappa',
  闇おてあげガッパ: 'Dark Kappa Troll',
  # Hopodile
  ピョコダイル: 'Hopodile',
  ピョンダイル: 'Hipadile',
  ボヨンダイル: 'Oingodile',
  バイーンダイル: 'Boingodile',
  悪ピョコダイル: 'Evil Hopodile',
  悪ピョンダイル: 'Evil Hipadile',
  悪ボヨンダイル: 'Evil Oingodile',
  悪バイーンダイル: 'Evil Boingodile',
  # Flamebird
  フラッシュバード: 'Flamebird',
  グレアバード: 'Sparkbird',
  ツインクルバード: 'Flarebird',
  シャインバード: 'Blazebird',
  闇フラッシュバード: 'Dark Flamebird',
  闇グレアバード: 'Dark Sparkbird',
  闇ツインクルバード: 'Dark Flarebird',
  闇シャインバード: 'Dark Blazebird',
  # Yanpii
  ヤンぴー: 'Yanpii',
  親衛ヤンぴー: 'Sr. Yanpii',
  副総長ヤンぴー: 'Lt. Yanpii',
  総長ヤンぴー: 'Boss Yanpii',
  闇ヤンぴー: 'Sinful Yanpii',
  闇親衛ヤンぴー: 'Sinful Sr. Yanpii',
  闇副総長ヤンぴー: 'Sinful Lt. Yanpii',
  闇総長ヤンぴー: 'Sinful Boss Yanpii',
  # Scoopie
  スコッピー: 'Scoopie',
  シャベッピー: 'Spadie',
  クワッピー: 'Trowelie',
  ユンピー: 'Shovelie',
  悪スコッピー: 'Wicked Scoopie',
  悪シャベッピー: 'Wicked Spadie',
  悪クワッピー: 'Wicked Trowelie',
  悪ユンピー: 'Wicked Shovelie',
  # Zalokleft
  ぬすっトド: 'Zalokleft',
  みどりトド: 'Green Zalokleft',
  アイアントド: 'Iron Zalokleft',
  しょうめつトド: 'Zalokleftis King',
  腹黒ぬすっトド: 'Bad Zalokleft',
  腹黒みどりトド: 'Bad G. Zalokleft',
  腹黒アイアントド: 'Bad I. Zalokleft',
  腹黒しょうめつトド: 'Bad Zalokleft King',
  # Eligan
  エリガン: 'Eligan',
  エリガガン: 'Eligagan',
  エリガゴン: 'Eligagon',
  エリズガゴン: 'Elizgagon',
  ダークエリガン: 'Dark Eligan',
  ダークエリガガン: 'Dark Eligagan',
  ダークエリガゴン: 'Dark Eligagon',
  ダークエリズガゴン: 'Dark Elizgagon',
  # Gyadon
  ギャドン: 'Gyadon',
  ギャイラス: 'Gyairas',
  ギャンドラー: 'Gyandora',
  ギャンドロン: 'Gyandoron',
  暴れギャドン: 'Violent Gyadon',
  暴れギャイラス: 'Violent Gyairas',
  暴れギャンドラー: 'Violent Gyandora',
  暴れギャンドロン: 'Violent Gyandoron',
  # Gazer
  ゲイズ: 'Gazer',
  スーパーゲイズ: 'Super Gazer',
  ハイパーゲイズ: 'Hyper Gazer',
  ゲンナマゲイズ: 'Ultra Gazer',
  悪ゲイズ: 'Evil Gazer',
  悪スーパーゲイズ: 'Evil Super Gazer',
  悪ハイパーゲイズ: 'Evil Hyper Gazer',
  悪ゲンナマゲイズ: 'Evil Ultra Gazer',
  # Zapdon
  バリズドン: 'Zapdon',
  ゴロズドン: 'Huistdon',
  ビカズドン: 'Bunchukdon',
  ドドズドン: 'Zotdon',
  ダークバリズドン: 'Dark Zapdon',
  ダークゴロズドン: 'Dark Huistdon',
  ダークビカズドン: 'Dark Bunchukdon',
  ダークドドズドン: 'Dark Zotdon',
  # Dragon
  ドラゴン: 'Dragon',
  スカイドラゴン: 'Sky Dragon',
  アークドラゴン: 'Archdragon',
  アビスドラゴン: 'Abyssal Dragon',
  悪ドラゴン: 'Evil Dragon',
  悪スカイドラゴン: 'Evil Sky Dragon',
  悪アークドラゴン: 'Evil Archdragon',
  悪アビスドラゴン: 'Evil Abyss Dragon',
  # DJ Mage
  ガラ魔道士: 'DJ Mage',
  ガラ中流魔道士: 'MC Mage',
  ガラ上流魔道士: 'MC Wizard',
  ガラ貴族魔道士: 'MC Sorceror',
  黒ガラ魔道士: 'Dark DJ Mage',
  黒ガラ中流魔道士: 'Dark MC Mage',
  黒ガラ上流魔道士: 'Dark MC Wizard',
  黒ガラ貴族魔道士: 'Dark MC Sorceror',
  # Porky
  デブータ: 'Porky',
  デブーチョ: 'Porko',
  デブートン: 'Porkon',
  デブーゴン: 'Porgon',
  悪デブータ: 'Sinister Porky',
  悪デブーチョ: 'Sinister Porko',
  悪デブートン: 'Sinister Porkon',
  悪デブーゴン: 'Sinister Porgon',
  # Boy Cart
  ボウヤカート: 'Boy Cart',
  クロスカート: 'Cross Cart',
  吹き飛びカート: 'Strong Cart',
  貫通カート: 'Pierce Cart',
  闇ボウヤカート: 'Dark Boy Cart',
  闇クロスカート: 'Dark Cross Cart',
  闇吹き飛びカート: 'Dark Strong Cart',
  闇貫通カート: 'Dark Pierce Cart',
  # Pop Tank
  オヤジ戦車: 'Pop Tank',
  ガンコ戦車: 'Grampa Tank',
  ゴウジョウ戦車: 'Ornery Tank',
  イッテツ戦車: 'Cranky Tank',
  闇オヤジ戦車: 'Dark Pop Tank',
  闇ガンコ戦車: 'Dark Grampa Tank',
  闇ゴウジョウ戦車: 'Dark Ornery Tank',
  闇イッテツ戦車: 'Dark Cranky Tank',
  # Absorbiphant
  すいだすゾウ: 'Absorbiphant',
  とりこむゾウ: 'Digestiphant',
  くみこむゾウ: 'Spongiderm',
  ひきこむゾウ: 'Osmammoth',
  闇すいだすゾウ: 'Dark Absorbiphant',
  闇とりこむゾウ: 'Dark Digestiphant',
  闇くみこむゾウ: 'Dark Spongiderm',
  闇ひきこむゾウ: 'Dark Osmammoth',
  # Punisher
  処刑者: 'Punisher',
  断罪者: 'Debaser',
  破壊者: 'Ruiner',
  崩壊者: 'Despoiler',
  地獄の処刑者: "Hell's Punisher",
  地獄の断罪者: "Hell's Debaser",
  地獄の破壊者: "Hell's Ruiner",
  地獄の崩壊者: "Hell's Despoiler",
  # Firepuff
  ヒーポフ: 'Firepuff',
  ホノオポフ: 'Flamepuff',
  カエンポフ: 'Blazepuff',
  ゴオオポフ: 'Pyrepuff',
  悪ヒーポフ: 'Evil Firepuff',
  悪ホノオポフ: 'Evil Flamepuff',
  悪カエンポフ: 'Evil Blazepuff',
  悪ゴオオポフ: 'Evil Pyrepuff',
  # Crow Tengu
  カラス天狗: 'Crow Tengu',
  ハヤブサ天狗: 'Falcon Tengu',
  イヌワシ天狗: 'Eagle Tengu',
  ホウオウ天狗: 'Phoenix Tengu',
  黒カラス天狗: 'Bad Crow Tengu',
  黒ハヤブサ天狗: 'Bad Falcon Tengu',
  黒イヌワシ天狗: 'Bad Eagle Tengu',
  黒ホウオウ天狗: 'Bad Phoenix Tengu',
  # FO-Uβ
  'ＦＯ－Ｕβ': 'FO-Uβ',
  'ＦＯ－Ｕ': 'FO-U',
  'ＦＯ－ＵＺ': 'FO-UZ',
  'ＦＯ－ＵＺＺ': 'FO-UZZ',
  'εＦＯ－Ｕβ': 'εFO-Uβ',
  'εＦＯ－Ｕ': 'εFI-U',
  'εＦＯ－ＵＺ': 'εFO-UZ',
  'εＦＯ－ＵＺＺ': 'εFO-UZZ',
  # Myriman
  ケダマン: 'Myriman',
  ケダーク: 'Billman',
  ケダッチョ: 'Trillman',
  ケダケー: 'Googoman',
  ダークケダマン: 'Dark Myriman',
  ダークケダーク: 'Dark Billman',
  ダークケダッチョ: 'Dark Trillman',
  ダークケダケー: 'Dark Googoman',
  # Moseal
  もざらし: 'Moseal',
  ももざらし: 'Momoseal',
  もももざらし: 'Momomoseal',
  ももももざらし: 'Momomomoseal',
  闇もざらし: 'Bad Moseal',
  闇ももざらし: 'Bad Momoseal',
  闇もももざらし: 'Bad Momomoseal',
  闇ももももざらし: 'Bad Momomomoseal',
  # Kumonigiri
  おにぎりクマ: 'Kumonigiri',
  おにぎりアナグマ: 'Pandanigiri',
  おにぎりツキノワ: 'Onigirizzly',
  おにぎりヒグマ: 'Kodionigiri',
  闇おにぎりクマ: 'Dark Kumonigiri',
  闇おにぎりアナグマ: 'Dark Pandanigiri',
  闇おにぎりツキノワ: 'Dark Onigirizzly',
  闇おにぎりヒグマ: 'Dark Kodionigiri',
  # Shagga
  シャーガ: 'Shagga',
  ナシャーガ: 'Nashagga',
  ラシャーガ: 'Lashagga',
  バシャーガ: 'Bashagga',
  エビルシャーガ: 'Filthy Shagga',
  エビルナシャーガ: 'Filthy Nashagga',
  エビルラシャーガ: 'Filthy Lashagga',
  エビルバシャーガ: 'Filthy Bashagga',
  # Explochin
  ばくだんウニ: 'Explochin',
  ばくれつウニ: 'Concusschin',
  ふんかウニ: 'Fulminachin',
  だいふんかウニ: 'Detonachin',
  悪ばくだんウニ: 'Evil Explochin',
  悪ばくれつウニ: 'Evil Concusschin',
  悪ふんかウニ: 'Evil Fulminachin',
  悪だいふんかウニ: 'Evil Detonachin',
  # Chow
  タベラレルー: 'Chow',
  クダカレルー: 'Snacky',
  トカサレルー: 'Munchy',
  トリコマレルー: 'Mealy',
  欲タベラレルー: 'Plump Chow',
  欲クダカレルー: 'Plump Snacky',
  欲トカサレルー: 'Plump Munchy',
  欲トリコマレルー: 'Plump Mealy',
  # Field Knave
  畠荒らし: 'Field Knave',
  壺荒らし: 'Pot Knave',
  物荒らし: 'Item Knave',
  大物荒らし: 'Knave King',
  闇畠荒らし: 'Dark Field Knave',
  闇壺荒らし: 'Dark Pot Knave',
  闇物荒らし: 'Dark Item Knave',
  闇大物荒らし: 'Dark Knave King',
  # Maneater
  ひとくいデビル: 'Maneater',
  むらぐいデビル: 'Villeater',
  やまぐいデビル: 'Mounteater',
  しまぐいデビル: 'Isleater',
  闇ひとくいデビル: 'Dark Maneater',
  闇むらぐいデビル: 'Dark Villeater',
  闇やまぐいデビル: 'Dark Mounteater',
  闇しまぐいデビル: 'Dark Isleater'
}.with_indifferent_access

monster_classes = {
  # highlight_blue_4 (farming)
  'Mixer': 'highlight_blue_4',
  'Mixermon': 'highlight_blue_4',
  'Mixergon': 'highlight_blue_4',
  'Mixerdon': 'highlight_blue_4',
  'Zalokleft': 'highlight_blue_4',
  'Green Zalokleft': 'highlight_blue_4',
  'Iron Zalokleft': 'highlight_blue_4',
  'Zalokleftis King': 'highlight_blue_4',
  'Grass Boy': 'highlight_blue_4',
  'Grass Bro': 'highlight_blue_4',
  'Grass Guy': 'highlight_blue_4',
  'Grass Gramps': 'highlight_blue_4',
  'Chow': 'highlight_blue_4',
  'Snacky': 'highlight_blue_4',
  'Munchy': 'highlight_blue_4',
  'Mealy': 'highlight_blue_4',
  'FO-Uβ': 'highlight_blue_4',
  'FO-U': 'highlight_blue_4',
  'FO-UZ': 'highlight_blue_4',
  'FO-UZZ': 'highlight_blue_4',
  'εFO-Uβ': 'highlight_blue_4',
  'εFI-U': 'highlight_blue_4',
  'εFO-UZ': 'highlight_blue_4',
  'εFO-UZZ': 'highlight_blue_4',
  'Plump Chow': 'highlight_blue_4',
  'Plump Snacky': 'highlight_blue_4',
  'Plump Munchy': 'highlight_blue_4',
  'Plump Mealy': 'highlight_blue_4',
  'Dark Mixer': 'highlight_blue_4',
  'Dark Mixermon': 'highlight_blue_4',
  'Dark Mixergon': 'highlight_blue_4',
  'Dark Mixerdon': 'highlight_blue_4',
  'Bad Zalokleft': 'highlight_blue_4',
  'Bad G. Zalokleft': 'highlight_blue_4',
  'Bad I. Zalokleft': 'highlight_blue_4',
  'Bad Zalokleft King': 'highlight_blue_4',
  'Dark Grass Boy': 'highlight_blue_4',
  'Dark Grass Bro': 'highlight_blue_4',
  'Dark Grass Guy': 'highlight_blue_4',
  'Dark Grass Gramps': 'highlight_blue_4',
  # highlight_green (situational farming)
  'Pit Mamel': 'highlight_green',
  'Froggo': 'highlight_green',
  'Froggucci': 'highlight_green',
  'Froggon': 'highlight_green',
  'Kleptoad': 'highlight_green',
  'Strong Cart': 'highlight_green',
  'Cross Cart': 'highlight_green',
  'Boy Cart': 'highlight_green',
  'Field Knave': 'highlight_green',
  'Snide Froggo': 'highlight_green',
  'Snide Froggucci': 'highlight_green',
  'Snide Froggon': 'highlight_green',
  'Snide Kleptoad': 'highlight_green',
  # highlight_yellow_4 (food source)
  'Kid Squid': 'highlight_yellow_4',
  'Squidfficial': 'highlight_yellow_4',
  'King Squid': 'highlight_yellow_4',
  'Squidperor': 'highlight_yellow_4',
  'Kumonigiri': 'highlight_yellow_4',
  'Pandanigiri': 'highlight_yellow_4',
  'Onigirizzly': 'highlight_yellow_4',
  'Kodionigiri': 'highlight_yellow_4',
  'Firepuff': 'highlight_yellow_4',
  'Mutaikon': 'highlight_yellow_4',
  'Evil Kid Squid': 'highlight_yellow_4',
  'Evil Squidfficial': 'highlight_yellow_4',
  'Evil Squid King': 'highlight_yellow_4',
  'Evil Squidperor': 'highlight_yellow_4',
  'Dark Kumonigiri': 'highlight_yellow_4',
  'Dark Pandanigiri': 'highlight_yellow_4',
  'Dark Onigirizzly': 'highlight_yellow_4',
  'Dark Kodionigiri': 'highlight_yellow_4',
  'Foul Nigiri Baby': 'highlight_yellow_4',
  # highlight_orange_3 (destroys items)
  'Curse Girl': 'highlight_orange_3',
  'Cursister': 'highlight_orange_3',
  'Curspinster': 'highlight_orange_3',
  'Cursenior': 'highlight_orange_3',
  'Swordsman': 'highlight_orange_3',
  'Fencer': 'highlight_orange_3',
  'Sensei': 'highlight_orange_3',
  'Swordmaster': 'highlight_orange_3',
  'Scoopie': 'highlight_orange_3',
  'Spadie': 'highlight_orange_3',
  'Trowelie': 'highlight_orange_3',
  'Shovelie': 'highlight_orange_3',
  'Gazer': 'highlight_orange_3',
  'Super Gazer': 'highlight_orange_3',
  'Hyper Gazer': 'highlight_orange_3',
  'Nigiri Morph': 'highlight_orange_3',
  'Gyadon': 'highlight_orange_3',
  'Gyairas': 'highlight_orange_3',
  'Gyandora': 'highlight_orange_3',
  'Gyandoron': 'highlight_orange_3',
  'Pot Knave': 'highlight_orange_3',
  'Item Knave': 'highlight_orange_3',
  'Knave King': 'highlight_orange_3',
  'Mudkin': 'highlight_orange_3',
  'Muddy': 'highlight_orange_3',
  'Mudster': 'highlight_orange_3',
  'Mudder': 'highlight_orange_3',
  'Violent Gyadon': 'highlight_orange_3',
  'Violent Gyairas': 'highlight_orange_3',
  'Violent Gyandora': 'highlight_orange_3',
  'Violent Gyandoron': 'highlight_orange_3',
  'Dark Field Knave': 'highlight_orange_3',
  'Dark Pot Knave': 'highlight_orange_3',
  'Dark Item Knave': 'highlight_orange_3',
  'Dark Knave King': 'highlight_orange_3',
  'Shady Mudkin': 'highlight_orange_3',
  'Shady Muddy': 'highlight_orange_3',
  'Shady Mudster': 'highlight_orange_3',
  'Shady Mudder': 'highlight_orange_3',
  'Wicked Scoopie': 'highlight_orange_3',
  'Wicked Spadie': 'highlight_orange_3',
  'Wicked Trowelie': 'highlight_orange_3',
  'Wicked Shovelie': 'highlight_orange_3',
  'Evil Gazer': 'highlight_orange_3',
  'Evil Super Gazer': 'highlight_orange_3',
  'Evil Hyper Gazer': 'highlight_orange_3',
  'Foul Curse Girl': 'highlight_orange_3',
  'Foul Cursister': 'highlight_orange_3',
  'Foul Curspinster': 'highlight_orange_3',
  'Foul Cursenior': 'highlight_orange_3',
  'Evil Swordsman': 'highlight_orange_3',
  'Evil Fencer': 'highlight_orange_3',
  'Evil Sensei': 'highlight_orange_3',
  'Evil Swordmaster': 'highlight_orange_3',
  # highlight_orange_4 (dangerous)
  'Myriman': 'highlight_orange_4',
  'Billman': 'highlight_orange_4',
  'Trillman': 'highlight_orange_4',
  'Googoman': 'highlight_orange_4',
  'Foly': 'highlight_orange_4',
  'Grampa Tank': 'highlight_orange_4',
  'Absorbiphant': 'highlight_orange_4',
  'Hipadile': 'highlight_orange_4',
  'Scarabbit': 'highlight_orange_4',
  'Digestiphant': 'highlight_orange_4',
  'Kappa Pest': 'highlight_orange_4',
  'MC Mage': 'highlight_orange_4',
  "N'twyn": 'highlight_orange_4',
  'Porko': 'highlight_orange_4',
  'Sky Dragon': 'highlight_orange_4',
  'Nashagga': 'highlight_orange_4',
  'Nigiri Boss': 'highlight_orange_4',
  'Oingodile': 'highlight_orange_4',
  'Porkon': 'highlight_orange_4',
  "N'mach": 'highlight_orange_4',
  'Jouncy': 'highlight_orange_4',
  'Vexing Kappa': 'highlight_orange_4',
  'Pierce Cart': 'highlight_orange_4',
  'Spongiderm': 'highlight_orange_4',
  'Lashagga': 'highlight_orange_4',
  'Bashagga': 'highlight_orange_4',
  'Flarebird': 'highlight_orange_4',
  'Bouncy': 'highlight_orange_4',
  "N'dup": 'highlight_orange_4',
  'Kappa Troll': 'highlight_orange_4',
  'Boingodile': 'highlight_orange_4',
  'Gitan Mamel': 'highlight_orange_4',
  'Osmammoth': 'highlight_orange_4',
  'Blazebird': 'highlight_orange_4',
  'Nigiri King': 'highlight_orange_4',
  'Filthy Shagga': 'highlight_orange_4',
  'Filthy Nashagga': 'highlight_orange_4',
  'Filthy Lashagga': 'highlight_orange_4',
  'Filthy Bashagga': 'highlight_orange_4',
  "Dark N'dubba": 'highlight_orange_4',
  "Dark N'twyn": 'highlight_orange_4',
  "Dark N'mach": 'highlight_orange_4',
  "Dark N'dup": 'highlight_orange_4',
  'Dark MC Mage': 'highlight_orange_4',
  'Dark Absorbiphant': 'highlight_orange_4',
  'Dark Digestiphant': 'highlight_orange_4',
  'Dark Spongiderm': 'highlight_orange_4',
  'Dark Osmammoth': 'highlight_orange_4',
  'Dark Fearabbit': 'highlight_orange_4',
  'Dark Scarabbit': 'highlight_orange_4',
  'Dark Kappa Pest': 'highlight_orange_4',
  'Dark Vexing Kappa': 'highlight_orange_4',
  'Dark Kappa Troll': 'highlight_orange_4',
  'Evil Explochin': 'highlight_orange_4',
  'Evil Concusschin': 'highlight_orange_4',
  'Evil Fulminachin': 'highlight_orange_4',
  'Evil Detonachin': 'highlight_orange_4',
  'Vile Pumphantasm': 'highlight_orange_4',
  'Vile Pumphantom': 'highlight_orange_4',
  'Vile Pumpanshee': 'highlight_orange_4',
  'Vile Pumptergeist': 'highlight_orange_4',
  'Evil Sky Dragon': 'highlight_orange_4',
  'Sinister Porko': 'highlight_orange_4',
  'Sinister Porkon': 'highlight_orange_4',
  'Sinister Porgon': 'highlight_orange_4',
  'Dark Grampa Tank': 'highlight_orange_4',
  'Dark Flarebird': 'highlight_orange_4',
  'Dark Blazebird': 'highlight_orange_4',
  'Dark Strong Cart': 'highlight_orange_4',
  'Dark Pierce Cart': 'highlight_orange_4',
  'Foul Nigiri Boss': 'highlight_orange_4',
  'Foul Nigiri King': 'highlight_orange_4',
  'Dark Gitan Mamel': 'highlight_orange_4',
  # highlight_pink_2 (avoid)
  'MC Wizard': 'highlight_pink_2',
  'Ornery Tank': 'highlight_pink_2',
  'MC Sorceror': 'highlight_pink_2',
  'Horrabbit': 'highlight_pink_2',
  'Dozikon': 'highlight_pink_2',
  'Archdragon': 'highlight_pink_2',
  'Porgon': 'highlight_pink_2',
  'Terrabbit': 'highlight_pink_2',
  'Ultra Gazer': 'highlight_pink_2',
  'Mesmerikon': 'highlight_pink_2',
  'Cranky Tank': 'highlight_pink_2',
  'Abyssal Dragon': 'highlight_pink_2',
  'Dark MC Wizard': 'highlight_pink_2',
  'Dark MC Sorceror': 'highlight_pink_2',
  'Dark Horrabbit': 'highlight_pink_2',
  'Dark Terrabbit': 'highlight_pink_2',
  'Evil Archdragon': 'highlight_pink_2',
  'Evil Abyss Dragon': 'highlight_pink_2',
  'Dark Cranky Tank': 'highlight_pink_2',
  'Dark Ornery Tank': 'highlight_pink_2',
  'Dark Dozikon': 'highlight_pink_2',
  'Dark Mesmerikon': 'highlight_pink_2',
  'Evil Ultra Gazer': 'highlight_pink_2'
}.with_indifferent_access

def find_monster_index(floors, monsters, monster_name)
  result = nil
  monsters.each_with_index do |val, index|
    result = monsters[index].find_index(monster_name)
    if result != nil
      break
    end
  end
  result
end

floors = 100
column_count = 11
time_of_day = 'Day'
day_or_night_class = 'highlight_yellow'
file = File.read('manor_monsters_day')
monsters = []

# generate number of floors + floor number
floors.times do |index|
  monsters[index] = []
  column_count.times { monsters[index].push('') }
end

# add monster cells
file.each_line do |line|
  words = line.scan(/(\S+)/)
  monster_name = monsters_en[words[0][0]]
  floor_range = words[1][0]

  # if single floor (- and / are not present)
  if !floor_range.match?(/[-|\/]/)
    floor = floor_range.to_i
    m = find_monster_index(floors, monsters, monster_name)
    if m.blank?
      i = monsters[floor].find_index('')
      monsters[floor][i] = monster_name
    else
      if monsters[floor][m] == ''
        monsters[floor][m] = monster_name
      else
        i = monsters[floor].find_index('')
        monsters[floor][i] = monster_name
      end
    end
  # if multiple ranges (/ is present)
  elsif floor_range.match?(/[\/]/)
    ranges = floor_range.split('/')

    ranges.each do |r|
      # if single floor (- is not present)
      if !r.match?(/[-]/)
        floor = r.to_i
        m = find_monster_index(floors, monsters, monster_name)
        if m.blank?
          i = monsters[floor].find_index('')
          monsters[floor][i] = monster_name
        else
          if monsters[floor][m] == ''
            monsters[floor][m] = monster_name
          else
            i = monsters[floor].find_index('')
            monsters[floor][i] = monster_name
          end
        end
      # it's a floor range (- is present)
      else
        range = r.split('-')
        start_floor = range[0].to_i
        end_floor = range[1].to_i

        (start_floor..end_floor).each do |i|
          m = find_monster_index(floors, monsters, monster_name)
          if m.blank?
            k = monsters[i].find_index('')
            monsters[i][k] = monster_name
          else
            if monsters[i][m] == ''
              monsters[i][m] = monster_name
            else
              k = monsters[i].find_index('')
              monsters[i][k] = monster_name
            end
          end
        end
      end
    end
  # should be just one range
  else
    range = floor_range.split('-')
    start_floor = range[0].to_i
    end_floor = range[1].to_i

    (start_floor..end_floor).each do |i|
      m = find_monster_index(floors, monsters, monster_name)
      if m.blank?
        k = monsters[i].find_index('')
        monsters[i][k] = monster_name
      else
        if monsters[i][m] == ''
          monsters[i][m] = monster_name
        else
          k = monsters[i].find_index('')
          monsters[i][k] = monster_name
        end
      end
    end

  end
    

end

html = ["          <table class=\"monster_table_3\">
            <tr>
              <th colspan=\"#{column_count + 1}\">#{time_of_day} (Semi-Sorted)</th>
            </tr>"]

monsters.each_with_index { |val, index|
  html.push('            <tr>')
  html.push("              <td>#{index}</td>")
  monsters[index].each do |m|
    html.push("              <td class=\"#{monster_classes[m] || day_or_night_class}\">#{m}</td>")
  end
  html.push('            </tr>')
}

html.push('          </table>')

File.write('output.html', html.join("\n"))









