# == Schema Information
#
# Table name: comics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  link        :string(255)
#  year        :string(255)
#  format      :string(255)
#  pictures    :string(255)
#  language    :string(255)
#  size        :string(255)
#  tags        :string(255)      default([])
#  category    :string(255)      default([])
#  images      :string(255)      default([])
#  created_at  :datetime
#  updated_at  :datetime
#  main_image  :string(255)
#

class Comic < ActiveRecord::Base

  mount_uploader :main_image, ImageUploader

  attr_accessible :id, :title, :description, :tags, :category, :link, :images, :year, :format, :pictures, :language, :size, :remote_main_image_url, :main_image

  self.per_page = 15

end
