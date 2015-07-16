class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  #The two scopes that work every time:
  default_scope { order('created_at DESC') }
  # default_scope { order('title') }

  #Sanjay's suggestion:
  #scope :ordered_by_title, -> { order(title: :asc) }
  #produces an alphabetically random order leading me to believe they are ordered by "created_at ASC"

  #Ryan's suggestion:
  #scope :order_by_title, -> { order('title') }
  #produces an alphabetically random order leading me to believe they are ordered by created_at ASC.

  #Reed's suggestion:
  # scope :ordered_by_title, -> { unscoped.order(title: :asc) }
  #produces an alphabetically random order leading me to believe they are ordered by created_at ASC.

end

