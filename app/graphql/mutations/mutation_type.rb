class Mutations::MutationType < Types::BaseObject
  field :create_post_mutation, mutation: Mutations::CreatePostMutation
end
