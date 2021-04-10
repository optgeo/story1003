desc 'host the site'
task :host do
  sh 'budo -d docs'
end

desc 'build config.js from config.conf'
task :config do
  sh "ruby mkconfig.rb > config.conf"
  w = File.open('docs/config.js', 'w')
  w.print "var config = #{`parse-hocon config.conf`}"
  w.close
end

desc 'scrape'
task :scrape do
  sh [
    "curl",
    "https://www.gsi.go.jp/kihonjohochousa/kihonjohochousa41140.html",
    "| ruby filter.rb",
    "> 1003.tsv"
  ].join(' ')
end

