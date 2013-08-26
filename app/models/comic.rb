# == Schema Information
#
# Table name: comics
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  tags        :text
#  category    :text
#  created_at  :datetime
#  updated_at  :datetime
#  link        :string(255)
#  images      :string(255)
#  year        :string(255)
#  format      :string(255)
#  pictures    :string(255)
#  language    :string(255)
#  size        :string(255)
#

class Comic < ActiveRecord::Base

  attr_accessible :id, :title, :description, :tags, :category, :link, :image, :year, :format, :pictures, :language, :size, :remote_image_url
  mount_uploader :image, ImageUploader

  self.per_page = 15

end
