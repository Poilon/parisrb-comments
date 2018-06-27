class Talk < ApplicationRecord

  has_many :tag_talks
  has_many :tags, through: :tag_talks
  has_many :comments
  belongs_to :speaker
end
