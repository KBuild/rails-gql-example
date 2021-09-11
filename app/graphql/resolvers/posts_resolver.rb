
class Resolvers::PostsResolver < GraphQL::Schema::Resolver

  type [Types::PostType], null: false

  argument :id, ID, required: false

  def resolve
    Post.all
  end
end