module Commentable
  extend ActiveSupport::Concern

  included do
    belongs_to :blog
    scope :active_comments, -> { where(is_delete: false) }
  end
end