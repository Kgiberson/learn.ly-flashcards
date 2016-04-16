class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user

  validates :total, numericality: { greater_than: 0 }
end
