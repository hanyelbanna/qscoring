class Managers::Validator < Managers::User

	has_many :standards

  def full_name
  	"#{first_name} #{last_name}"
  end

  def self.options
    order(first_name: :asc)
  end
	
end