class Topic < ActiveRecord::Base
  has_many :posts

  scope :ordered_by_reverse_created_at, -> { order(created_at: :DESC) }
end
