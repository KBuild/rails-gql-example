module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: true

    argument :title, String, required: true
    argument :body, String, required: true

    def resolve(**argv)
      post = Post.find_or_initialize_by(argv)
      post.save!
      { post: post }
    end
  end
end
