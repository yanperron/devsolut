class Agency < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :quotes
end
