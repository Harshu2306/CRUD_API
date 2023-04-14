module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`

    field :blog, [Types::BlogType], null: false do
      argument :id, ID, required: true 
    end

    def blog(id:)
      Blog.find(id)
    end

    field :blogs, [Types::BlogType], null: false
    def blogs
      Blog.all
    end

    field :comments, [Types::CommentType], null: false

    def comments
      Comment.all
    end
  end
end
