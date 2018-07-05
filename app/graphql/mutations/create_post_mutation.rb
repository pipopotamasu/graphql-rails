class Mutations::CreatePostMutation < Mutations::BaseMutation
  null true
  argument :title, String, required: true
  field :post, Types::PostType, null: false

  def resolve(title:)
    {
      post: Post.create(title: title),
    }
  end
end
