class Question < ActiveRecord::Base
  scope :ordered_by_reverse_created_at, -> { order(created_at: :DESC) }
end
