ActiveAdmin.register NewsArticle do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :sub_topic, :content, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :sub_topic, :content, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
ActiveAdmin.register NewsArticle do
  permit_params :title, :sub_topic, :content, :user_id, :category_id

  filter :category.name

  index do
    selectable_column
    id_column
    column :title
    column :sub_topic
    column :content
    column 'User Email' do |news_article|
      news_article.user.email if news_article.user
    end
    column 'Category' do |news_article|
      news_article.category.name if news_article.category
    end
    actions
  end

  form do |f|
    f.inputs 'News Article Details' do
      f.input :title
      f.input :sub_topic
      f.input :content
      f.input :user, as: :select, collection: User.all.map { |u| [u.email, u.id] }
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
    end
    f.actions
  end
end


