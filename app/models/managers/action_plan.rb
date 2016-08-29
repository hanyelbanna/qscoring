class Managers::ActionPlan < ApplicationRecord

	def self.text_search(query)
    if query.present?
      where("name @@ :q or description @@ :q", q: query)
    else
      all
    end
  end

  def self.options
    order(name: :asc)
  end

  scope :by_not_closed, -> { where(closed: 0) }
  
end
