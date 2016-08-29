class Managers::Frequency < ApplicationRecord

	has_many :standards

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
	
end
