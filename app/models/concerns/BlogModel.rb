module BlogModel
  extend ActiveSupport::Concern

  included do
    has_many :comments
    validates :is_active, inclusion: { in: [ true, false ] }
    validates :is_delete, inclusion: { in: [ true, false ] }
    validates :title , presence: true
    validates :body , presence: true 
    scope :active_post, -> { where(is_delete: false) }
  end
end