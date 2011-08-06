require 'rubygems'
require 'mechanize'
a=Mechanize.new.get("http://kbodata.news.naver.com/m_rank/rank_team.asp")
8.times do |i|
	teamname = a.search("//tbody/tr/td/a")[i].text
	rank = [$1,$2,$3]  if a.search("//tbody/tr/td")[9+i*10].text =~ /^(\d+)승 (\d+)패 (\d+)무$/
	data = ["#{i+1}위", teamname] + rank
	puts data.join(' - ')
end
