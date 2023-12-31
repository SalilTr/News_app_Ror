class CreateNewsArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.string :sub_topic
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
