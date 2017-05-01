# models/image.rb
class Image < ActiveRecord::Base
  @@license_links = {
      'CC0' => 'https://creativecommons.org/publicdomain/zero/1.0/',
      'CC BY-SA 2.0' => 'https://creativecommons.org/licenses/by-sa/2.0/'
      }
  def attribution
#    title = name? name : 'Photo'
    name ||= 'Photo'
    "<a href='#{image_address}'>#{name}</a> by 
    <a href='#{author_address}'>#{author_name}</a> licensed under 
    <a href='#{@@license_links[license]}'>#{license}</a>"
  end
end