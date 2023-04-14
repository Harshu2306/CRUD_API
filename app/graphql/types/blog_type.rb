# frozen_string_literal: true

module Types
  class BlogType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :view_count, Integer
    field :published_date, GraphQL::Types::ISO8601DateTime
    field :is_active, Boolean
    field :is_delete, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :blog_count, Integer
    field :like_count, Integer
    field :comments, [Types::CommentType], null: false
  end
end
