class Managers::HistoryTrendChapter < ApplicationRecord

  belongs_to :chapter, required: true

  scope :by_chapter, ->(chapter) { where(chapter_id: chapter) }
  
end
