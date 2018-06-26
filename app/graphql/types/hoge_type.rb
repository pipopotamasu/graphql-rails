class Types::HogeType < Types::BaseObject
  field :hoge, String, null: false,
    description: "An example field added by the generator"
  def hoge
    "hoge"
  end
end