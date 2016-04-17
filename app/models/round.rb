class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  has_many :cards, through: :decks

  validates :total, numericality: { greater_than: 0 }
end
