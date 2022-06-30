class Blog < ApplicationRecord

  validates :is_active, inclusion: { in: [ true, false ] }
  validates :is_delete, inclusion: { in: [ true, false ] }
  validates :title , presence: true
  validates :body , presence: true 

end