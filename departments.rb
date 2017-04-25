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
      'CCO' => 'https://creativecommons.org/publicdomain/zero/1.0/',
      'CC BY-SA 2.0' => 'https://creativecommons.org/licenses/by-sa/2.0/'
      }
    @@license_links.default = 'http://wikipedia.com/rickroll'
    
    attr_reader :filename, :author, :author_page, :source, :license, :title
    def initialize(params)
      @filename,
      @author,
      @author_page,
      @source,
      @license,
      @title = params
    end
    
    def inspect
      "#{@filename} by #{author}"
    end

    def attribution
      @title? title = "\#{@title}" : title = 'Photo'
      "<a href='#{@source}'>#{title}</a> by 
      <a href='#{@author_page}'>#{@author}</a> licensed under 
      <a href='#{@@license_links[@license]}'>#{@license}</a>"
    end
    
    def self.load_photos
      images = {}
      File.open('image_attributions.txt').each_line do |line|
        next if line.equal?("*")
        image_data = line.split(' | ')
        images.store(image_data.first.chomp, PhotoAttribution.new(image_data))
      end
      images
    end
  end
end