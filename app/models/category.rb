class Category < ApplicationRecord
  belongs_to :news_article
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "news_article_id", "updated_at"]
  end
end
