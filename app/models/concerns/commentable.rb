module Commentable
  extend ActiveSupport::Concern

  included do
    belongs_to :blog
    scope :active_comments, -> { where(is_delete: false) }
    validates :comment_title, presence: true

    def comments_blog
      object.blog
    end
  end
end