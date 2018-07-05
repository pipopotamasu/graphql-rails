class Mutations::CreateCommentMutation < Mutations::BaseMutation
  null true
  argument :content, String, required: true
  argument :post_id, ID, required: true

  field :comment, Types::CommentType, null: false

  def resolve(content:, post_id:)
    comment = Post.find(post_id).comments.create(content: content)
    {
      comment: comment
    }
  end
end
