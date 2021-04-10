while gets
  next unless /<a href=\"https:\/\/maps.gsi.go.jp\/#15\/(.*)\/(.*)\" target=\"_blank\">(.*)<\/a>/.match $_
  print [$1, $2, $3.sub('/common', 'https://www.gsi.go.jp/common')]
    .join("\t"), "\n"
end

