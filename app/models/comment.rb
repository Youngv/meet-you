class Comment < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :meetup, counter_cache: true
end
