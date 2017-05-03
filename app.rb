require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/static_assets'
require 'sinatra/multi_route'
require './config/environments' #database configuration
current_dir = Dir.pwd           #models
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/', '/index' do
  @title = 'Academy of Scholars and Fools'
  @image = Image.find_by_file_name('old_books.jpg')
  erb :index
end

# Academics, departments, etc
get '/academics/?' do
  @title = 'Academics at ASF'
    @image = Image.find_by_file_name('girl_with_book.jpg')
    erb :'academics'
end


get '/academics/:dept' do |dept|
    @dept = Department.find_by_page_address(dept)
  if @dept
    @image = Image.find_by_file_name(@dept.header_image_name)
    erb :"/academics/#{@dept.page_address}"
  else
    halt 404, "That's not a department here."
  end
end

# Admissions and aid
get '/admissions/?' do
  @title = 'Admissions & Aid'
  @image = Image.find_by_file_name('hands_and_map.jpg')
  erb :'admissions'
end

get '/student-life/?', '/studentlife/?', '/student_life/?' do
  @title = 'Life at ASF'
  @image = Image.find_by_file_name('walking_in_forest.jpg')
  erb :'student_life'
end

get '/course_testing' do
  @title = 'Testing'
  erb :course_testing
end

post '/course_testing' do
  @title = 'Testing'
  course = Course.create(name: params[:name], number: params[:number], description: params[:description])
  codes = ""
  params[:departments].each do |dept|
    real_dept = Department.find_by_abbrev(dept)
    real_dept.courses << course
    codes << "#{real_dept.abbrev} #{params[:number]}, "
  end
  erb "New course: #{params[:name]} (#{codes})"
end

not_found do
  @title = 'Not found'
  @image = Image.find_by_file_name('smoke_and_fire.jpg')
  erb "404: Page not found."
end
