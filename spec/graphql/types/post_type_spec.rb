require 'rails_helper'

RSpec.describe GraphqlRailsSchema, type: :request do
  # You can override `context` or `variables` in
  # more specific scopes
  let(:context) { {} }
  let(:variables) { {} }
  # Call `result` to execute the query
  let(:result) {
    res = GraphqlRailsSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  }

  let!(:post) { create(:post) }

  # provide a query string for `result`
  let(:query_string) { "{ post(id: #{post.id}) { id, title, comments { id, postId, content } } }" }

  context "without comment" do
    it 'fetch correct data' do
      result_post = result['data']['post']
      expect(result_post['id']).to eq post.id.to_s
      expect(result_post['title']).to eq post.title
      expect(result_post['comments']).to eq []
    end
  end

  context "with comment" do
    let!(:comment) { create(:comment, post: post) }

    it 'fetch correct data' do
      result_post = result['data']['post']
      result_comment = result['data']['post']['comments'][0]
      expect(result_post['id']).to eq post.id.to_s
      expect(result_post['title']).to eq post.title
      expect(result_comment['id']).to eq comment.id.to_s
      expect(result_comment['postId']).to eq post.id.to_s
      expect(result_comment['content']).to eq comment.content
    end
  end
end