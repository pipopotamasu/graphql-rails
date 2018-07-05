class GraphqlRailsSchema < GraphQL::Schema
  mutation(Mutations::MutationType)
  #query(Types::QueryType)
end
