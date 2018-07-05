class Mutations::MutationType < Types::BaseObject
  field :create_post_mutation, mutation: Mutations::CreatePostMutation
  field :create_comment_mutation, mutation: Mutations::CreateCommentMutation
end
