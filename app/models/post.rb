class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  
  has_one :summary
  
  after_create :ensure_summary

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def ensure_summary
    # cut title and body to only 10 characters to make it a "summary"
    self.create_summary(short_title: self.title[0..10], short_body: self.body[0..10])
  end
end
