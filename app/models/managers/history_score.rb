class Managers::HistoryScore < ApplicationRecord

  belongs_to :standard, required: true
  belongs_to :user, required: true
  belongs_to :validator, required: true

  enum status: { newscore: 0, scored: 1, refused: 2, rescored: 3, approved: 4 }

end
