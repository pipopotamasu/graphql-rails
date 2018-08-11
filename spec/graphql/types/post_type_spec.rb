require 'rails_helper'

RSpec.describe GraphqlRailsSchema do
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

  context "without comments" do
    it 'fetch correct data' do
      expect(result['data']['post']['id']).to eq post.id.to_s
      expect(result['data']['post']['title']).to eq post.title
      expect(result['data']['post']['comments']).to eq []
    end
  end

  context "with comments" do
    let!(:comment) { create(:comment, post: post) }

    it 'fetch correct data' do
      expect(result['data']['post']['id']).to eq post.id.to_s
      expect(result['data']['post']['title']).to eq post.title
      expect(result['data']['post']['comments'][0]['id']).to eq comment.id.to_s
      expect(result['data']['post']['comments'][0]['postId']).to eq post.id.to_s
      expect(result['data']['post']['comments'][0]['content']).to eq comment.content
    end
  end
end