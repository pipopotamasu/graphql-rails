class Types::CommentType < Types::BaseObject
  field :id, ID, null: false
  field :post_id, ID, null: false
  field :content, String, null: false
end
