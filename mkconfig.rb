print <<-EOS
style: "https://optgeo.github.io/shizen/style.json"
accessToken: pk.eyJ1IjoiaGZ1IiwiYSI6ImlRSGJVUTAifQ.rTx380smyvPc1gUfZv1cmw
showMarkers: false
theme: dark
title: Sierra
subtitle: 日本の主な山岳
byline: by the United Nations Vector Tile Toolkit community
footer: "source: https://www.gsi.go.jp/kihonjohochousa/kihonjohochousa41140.html"
chapters: [
EOS

count = 0
File.foreach('1003.tsv') {|l|
  count += 1
  (lat, lng, name) = l.strip.split("\t")
  print <<-EOS
{
  id: sierra#{count}
  alignment: #{count % 2 == 0 ? 'left' : 'right'}
  hidden: false
  title: "#{name.gsub('"', "'")}"
  location: {
    center: [
      #{lng}
      #{lat}
    ]
    zoom: 14
    pitch: 75
    bearing: #{rand * 360 - 180}
  }
  mapAnimation: flyTo
  rotateAnimation: false
  callback: ''
  onChapterEnter: [
  ]
  onChapterExit: [
  ]
}
  EOS
}

print <<-EOS
]
EOS
