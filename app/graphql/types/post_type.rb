class Types::PostType < Types::BaseObject
  description "A blog post"
  field :id, ID, null: false
  field :title, String, null: false
end