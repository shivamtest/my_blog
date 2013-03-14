class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
