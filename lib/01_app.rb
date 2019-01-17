require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'restclient'

#    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
#    puts page  

course = []
name = []
page_url = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open(page_url))

select_name = page.xpath('//*[@class="text-left col-symbol"]').each do |select_name|
name << select_name.text
end

select_course = page.xpath('//*[@class="no-wrap text-right"]/a[@class="price"]').each do |select_course|
course << select_course.text
end

def hash_name_course(name, course)
    arrlist = []
    n = 0
    (course.length).times do 
    arrlist << Hash[name[n], course[n]]
    n += 1
    end
    puts arrlist
end

hash_name_course(name, course)





