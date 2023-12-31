class NewsArticle < ApplicationRecord
  belongs_to :user
  has_one :category
  has_many_attached :images
  def self.ransackable_associations(auth_object = nil)
    ["category", "images_attachments", "images_blobs", "user"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "sub_topic", "title", "updated_at", "user_id"]
  end
end
