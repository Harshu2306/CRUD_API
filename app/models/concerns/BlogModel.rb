module BlogModel
  extend ActiveSupport::Concern

  included do
    require 'date'
    require 'active_support/core_ext'
    #has_one_attached :image
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
    has_one :like , as: :likeable
    validates :is_active, inclusion: { in: [ true, false ] }
    validates :is_delete, inclusion: { in: [ true, false ] }
    validates :title , presence: true, uniqueness: true, allow_blank: true
    validates :body , presence: true, allow_blank: true 
    scope :active_post, -> { where(is_delete: false) }
    scope :proper_date, -> { where("published_date < ?", Date.today)}
    #validates :image ,size: { less_than:5.megabytes , message: 'is too large' } , dimension: {  width: { max: 1200 }, height: { max: 650 } , message: 'is not given between dimension' } , content_type: [:png, :jpg, :jpeg]

    #def image_url
      #Rails.application.routes.url_helpers.url_for(image) if image.attached?
    #end
    def blog_comments
      self.active_comments
    end
  end
end