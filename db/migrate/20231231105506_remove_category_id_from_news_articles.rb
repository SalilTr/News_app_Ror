class RemoveCategoryIdFromNewsArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :news_articles, :category_id, :integer
  end
end
