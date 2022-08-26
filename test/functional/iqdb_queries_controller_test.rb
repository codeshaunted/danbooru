require 'test_helper'

class IqdbQueriesControllerTest < ActionDispatch::IntegrationTest
  context "The iqdb controller" do
    setup do
      @user = create(:user)
      @post = as(@user) { create(:post) }
    end

    context "show action" do
      context "with a url parameter" do
        should "render a response" do
          @url = "https://google.com"
          @matches = [{ post_id: @post.id, score: 95.0 }]
          mock_iqdb_matches(@matches)

          get_auth iqdb_queries_path, @user, as: :javascript, params: { url: @url }

          assert_response :success
          assert_select("#post_#{@post.id}")
        end
      end

      context "with a post_id parameter" do
        should "render a response" do
          @matches = [{ post_id: @post.id, score: 95.0 }]
          mock_iqdb_matches(@matches)

          # Make the call to `@post.file(:preview)` work.
          Post.any_instance.stubs(:file).returns(File.open("test/files/test.jpg"))

          get_auth iqdb_queries_path, @user, params: { post_id: @post.id }

          assert_response :success
          assert_select("#post_#{@post.id}")
        end
      end

      context "with a file parameter" do
        should "render a response" do
          @matches = [{ post_id: @post.id, score: 95.0 }]
          mock_iqdb_matches(@matches)

          file = Rack::Test::UploadedFile.new("test/files/test.jpg")
          post_auth iqdb_queries_path(format: :json), @user, params: { search: { file: file }}

          assert_response :success
          assert_equal([{ post_id: @post.id, score: 95.0, post: as(@user) { @post.as_json } }.with_indifferent_access], response.parsed_body)
        end
      end
    end
  end
end
