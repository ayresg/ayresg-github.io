module Utilities
  class Department
    attr_reader :pretty_name, :page_name, :image
    def initialize(params)
      @page_name,
      @pretty_name,
      @image = params
    end
    
    def self.load_departments
      department_directory = {}
      File.open('dept_list.txt').each_line do |line|
        data = line.chomp.split(' | ')
        department_directory.store(data.first, Department.new(data))
      end
      department_directory
    end
  end

  class PhotoAttribution
    @@license_links = {
      'CC0' => 'https://creativecommons.org/publicdomain/zero/1.0/',
      'CC BY-SA 2.0' => 'https://creativecommons.org/licenses/by-sa/2.0/'
      }
    @@license_links.default = 'http://wikipedia.com/rickroll'
    
    attr_reader :file_name, :author, :author_page, :source, :license, :title
    def initialize(params)
      @file_name,
      @author,
      @author_page,
      @source,
      @license,
      @title = params.map {|x| x.chomp}
    end
    
    def inspect
      "#{@file_name} by #{author}"
    end

    def attribution
      @title? title = @title : title = 'Photo'
      "<a href='#{@source}'>#{title}</a> by 
      <a href='#{@author_page}'>#{@author}</a> licensed under 
      <a href='#{@@license_links[@license]}'>#{@license}</a>"
    end
    
    def self.load_photos
      images = {}
      File.open('image_attributions.txt').each_line do |line|
        image_data = line.chomp.split('	')
        images.store(image_data.first, PhotoAttribution.new(image_data))
      end
      images
    end
  end
end