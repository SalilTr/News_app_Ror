require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get news_article:references" do
    get categories_news_article:references_url
    assert_response :success
  end
end
