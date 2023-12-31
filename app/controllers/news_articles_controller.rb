# app/controllers/news_articles_controller.rb
class NewsArticlesController < ApplicationController
    before_action :set_news_article, only: [:show, :edit, :update, :destroy]
    before_action :authorize_editor, only: [:edit, :update]
    before_action :authorize_user, only: [:new, :create]
  
    def index
      @news_articles = NewsArticle.all
    end
  
    def show
    end
  
    def new
      @news_article = NewsArticle.new
    end
  
    def create
      @news_article = NewsArticle.new(news_article_params)
  
      if @news_article.save
        redirect_to @news_article, notice: 'News Article was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @news_article.update(news_article_params)
        redirect_to @news_article, notice: 'News Article was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      if @news_article.destroy
        redirect_to news_articles_path, notice: 'News Article was successfully destroyed.'
      else
        render :index, status: :unprocessable_entity
      end
    end
  
    private
  
    def authorize_editor
      unless current_user&.has_role?(:editor)
        flash[:alert] = "You are not authorized to edit this news article."
        redirect_to news_articles_path
      end
    end
    def authorize_user
        unless current_user&.has_role?(:admin) || current_user&.has_role?(:editor)
          flash[:alert] = "You are not authorized to create this news article."
          redirect_to news_articles_path
        end
      end
      
    def set_news_article
      @news_article = NewsArticle.find(params[:id])
    end
  
    def news_article_params
      params.require(:news_article).permit(:title, :sub_topic, :content, :user_id, :category_attributes => [:name,:id], images: [])
    end
  end
  