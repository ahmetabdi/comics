require 'nokogiri'
require 'open-uri'
require 'ap'

ENV["RAILS_ENV"] ||= 'development'
require File.expand_path("../../../config/environment", __FILE__)

namespace :scrape do
  task :comics do
    p 'Scraping comicsall.org'

    Comic.delete_all

    567.downto(1).each do |i|

    doc = Nokogiri::HTML(open("http://comicsall.org/page/#{i}/"))

      doc.css('.story > .sfoot > .radius2 > .argmore').each do |link|

        comics = Nokogiri::HTML(open(link.search('a').map { |a| a['href'] }.first))

        de = comics.at_xpath('//*[@id="dle-content"]/div[1]/div[1]').to_s

        content = de.slice(0..(de.index('DOWNLOAD'))).split("\r\n").last(2).first.gsub(/<\/?[^>]*>/, "")

        te = comics.xpath('//*[@id="dle-content"]/div[1]/div[1]/table//text()').to_s

        te.slice(0..(te.index('if(!window.iknopo'))).split("\r\n").last(7).first(6).each_with_index do |content, index|
          case index
          when 0
            #category
            @category = content.squeeze(' ').strip.delete('.').split(":")[1]
          when 1
            #year
            @year     = content.squeeze(' ').strip.delete('.').split(":")[1]
          when 2
            #format
            @format   = content.squeeze(' ').strip.delete('.').split(":")[1]
          when 3
            #pictures
            @pictures = content.squeeze(' ').strip.delete('.').split(":")[1]
          when 4
            #language
            @language = content.squeeze(' ').strip.delete('.').split(":")[1]
          when 5
            #size
            @size = content.squeeze(' ').strip.delete('.').split(":")[1]
          else
            puts "error"
          end
        end

        #header
        title = comics.at_css('.stheading').content
        #download link
        link = comics.at_xpath('//*[@id="dle-content"]/div[1]/div[1]/center/table').search('a').map { |a| a['href'] }.first
        #tags
        tags = comics.at_xpath('//*[@id="dle-content"]/div[1]/div[4]').content
        #images
        images = []
        main_image = ""
        comics.at_xpath('//*[@id="dle-content"]/div[1]').search('img').map {|a| a['src'] }.each_with_index do |image, index|
          if index == 0
            main_image << image
          else
            images << image
          end
        end

        #If the comic exists skip it
        if Comic.find_by_title(title)
          puts "Skipping: #{title}"
          next
        else
          puts "Creating: #{title}"
          co = Comic.new(title: title, link: link, images: images, description: content, tags: tags, category: @category, year: @year, format: @format, pictures: @pictures, language: @language, size: @size)

          co.remote_main_image_url = main_image

          co.save!
        end
      end
    end
  end
end