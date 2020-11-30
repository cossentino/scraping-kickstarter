require 'nokogiri'
require 'pry'

def get_page
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
end

def create_project_hash

  project_hash = {}
  
  (0..5).each do |i|
    p_title = get_page.css('.project.grid_4')[i].css('strong')[0].text
    title = "#{p_title}".to_sym
    project_hash[title] = {}
    project_hash[title][:image_link] = get_page.css('#projects_list').css('.project.grid_4')[i].css('a')[0].css('img').attribute('src').value #this is a one key hash
    project_hash[title][:description] = get_page.css('.project.grid_4')[i].css('.bbcard_blurb')[0].text.to_s
    project_hash[title][:location] = get_page.css('.project.grid_4')[i].css('.project-meta').css('.location-name').text.to_s
    project_hash[title][:percent_funded] = get_page.css('.project.grid_4')[i].css('.first.funded').text.to_i

  end
  
  project_hash
  #binding.pry
  



end



#create_project_hash






