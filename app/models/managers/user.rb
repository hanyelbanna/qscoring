class Managers::User < ApplicationRecord

  has_many :standards
  has_many :standard_validators, class_name: "Managers::Standard", foreign_key: "validator_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :mobile

  def self.text_search(query)
    if query.present?
      where("first_name @@ :q or last_name @@ :q", q: query)
    else
      all
    end
  end

  def full_name
  	"#{first_name} #{last_name}"
  end

  def self.options
    where(type: nil).order(first_name: :asc)
  end

  def self.options_with_validators
    where("type IS NULL OR type = 'Managers::Validator'").order(first_name: :asc)
  end

end
