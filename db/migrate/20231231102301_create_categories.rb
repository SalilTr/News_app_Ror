class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.text :name
      t.references :news_article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
