class Managers::Department < ApplicationRecord

	has_many :standards
	has_many :history_trend_departments

	validates_presence_of :name

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

  scope :departments_by_std, -> { joins(:standards).group("departments.id").order("departments.id") }

end