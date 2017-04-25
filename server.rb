require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/static_assets'
require_relative 'departments'
#require 'bundler'

#Bundler.require

# Class for controlling the Academy website
class AcademyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::StaticAssets
  end

  department_directory = Utilities::Department.load_departments()
  images = Utilities::PhotoAttribution.load_photos()
  images.default = images['arched_windows.jpg']
  
  get '/index' do
    @title = 'Academy of Scholars and Fools'
    @image = images['wizards.png']
    erb :index
  end

  get '/academics/?:subpath' do |subpath|
    case
    when department_directory.has_key?(subpath)
      dept = department_directory[subpath]
      @title = dept.pretty_name
      @image = images[dept.image]     
      erb :"/academics/#{dept.page_name}"
    when subpath === nil, subpath === 'index'
      @title = 'Academics at ASF'
      @image = images['girl_with_book.jpg']
      @department_directory = department_directory
      erb :'academics/index'
    else
      print '<p> dept </p>'
    end
  end

  get '/admissions/?:subpath' do |subpath|
    @title = 'Admissions & Aid'
    @department_directory = department_directory
    @image = images['hands_and_map.jpg']
    case subpath
    when nil, 'index'
      erb :'admissions/index'
    end
  end
  
  get '/student-life/?:subpath' do |subpath|
    @title = 'Life at ASF'
    @image = images['walking_in_forest.jpg']
    case subpath
    when nil, 'index'
      erb :'admissions/index'
    end
  end

  not_found do
    @title = 'Not found'
    @image = images['smoke_and_fire.jpg']
    erb "404: Page not found."
  end
end
