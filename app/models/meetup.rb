class Meetup < ApplicationRecord
  validates_presence_of :title, :date, :address

  belongs_to :user
  has_many :comments, -> { order(:created_at => :asc) }, dependent: :destroy
end
