class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # First describe the field signature:
  field :post, PostType, null: true do
    description "Find a post by ID"
    argument :id, ID, required: true
  end

  # Then provide an implementation:
  def post(id:)
    Post.find(id)
  end
end
