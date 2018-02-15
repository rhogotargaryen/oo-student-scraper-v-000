require 'open-uri'
require 'pry'
require 'nokogiri'
  class Scraper

    def self.scrape_index_page(index_url)
      doc = Nokogiri::HTML(open(index_url))
      student_hashes = []
      stu = {}
      studs_links = doc.css(".student-card a")
      studs_links.each do |stud_link|
        stu[:name] = stud_link.css("h4").text
        stu[:profile_url] = stud_link.attr("href")
        stu[:loaction] = stud_link.css("p").text
        student_hashes << stu
      end
      student_hashes

      binding.pry

    end

    #def self.index_to_param(index_url)
    #  doc = Nokogiri::HTML(open(index_url))
    #  studs_divs = doc.css(".student-card a h4")
    #  studs_names = []
    #  studs_divs.each do |stud_div|
    #    studs_names << stud_div.text
    #  end
    #  studs_param = []
    #  studs_names.each do |name|
    #    name.gsub!(" ", "-")
    #    name = "#{name}.html"
    #    studs_param << name.downcase
    #  end
    #  studs_param
    #end
    #def self.scrape_index_page(index_url)
    #  studs_param = index_to_param(index_url)
    #  students_hashes = []
    #  studs_param.each do |param|
    #    binding.pry
    #    doc = Nokogiri::HTML(open("./fixtures/student-site/students/#{param}"))
    #    stu = {}
    #    stu[:profile_url] = param
    #    stu[:name] = param.gsub("-", " ").gsub(".html", "").split.map(&:capitalize).join(' ')
    #    stu[:location] = doc.css(".vitals-text-container h2").text
    #    students_hashes << stu
    #    binding.pry
    #  end
    #  students_hashes
    #end
    def self.scrape_profile_page(profile_url)
    end
  end
