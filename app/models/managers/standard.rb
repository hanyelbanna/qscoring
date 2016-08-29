class Managers::Standard < ApplicationRecord
  belongs_to :chapter, required: true
  belongs_to :department
  belongs_to :user, required: true
  belongs_to :validator, required: true
  belongs_to :frequency, required: true

  has_many :history_scores

  enum status: { newscore: 0, scored: 1, refused: 2, rescored: 3, approved: 4 }

  validates :name, presence: true
  validates :score, presence: true, unless: "status == 'newscore'"
  validates :score, inclusion: { in: [nil, 0, 2], :message => "%{value} is not a valid score for Bold Standard" }, if: "bold == true"
  validates :validator_note, presence: true, if: "status == 'refused'"



  scope :by_chapter, ->(chapter) { where("chapter_id = ?", chapter) }
  scope :by_department, ->(department) { where("department_id = ?", department) }
  scope :by_user, ->(loged_user) { where("user_id = ?", loged_user) }
  scope :by_user_validator, ->(loged_user) { where("validator_id = ?", loged_user) }
  scope :by_scorer, -> { where("status = 0 OR status = 2") }
  scope :by_validator, -> { where("status = 1 OR status = 3") }
  scope :by_score_status, ->(score_status) { where("status = ?", score_status) }

  scope :score_average, -> { average("COALESCE(score_for_avg,0)") / 2.0 * 100 if average(:score_for_avg).present? }

  scope :by_not_scored, -> { where(status: 0) }
  scope :by_not_validated, -> { where(status: 1) }
  scope :by_refused, -> { where(status: 2) }
  scope :by_re_scored, -> { where(status: 3) }
  scope :by_approved, -> { where(status: 4) }

  scope :by_full_score, -> { where(score_for_avg: 2) }
  scope :by_improvable, -> { where(score_for_avg: 1) }
  scope :by_faild_score, -> { where(score_for_avg: 0) }

  scope :by_bold, -> { where("standards.bold = true") }
  scope :by_fall_bold, -> { where("standards.bold = true AND score_for_avg < 2") }

  scope :chapters_group_average_id, -> { joins(:chapter).where(status: 4).order("chapters.id").group("chapters.id").average(:score_for_avg) }
  scope :departments_group_average_id, -> { joins(:department).where(status: 4).order("departments.id").group("departments.id").average(:score_for_avg) }

  scope :chapters_group_average, -> { joins(:chapter).where(status: 4).order("chapters.id").group("chapters.id, chapters.name").average(:score_for_avg) }
  scope :departments_group_average, -> { joins(:department).where(status: 4).order("departments.id").group("departments.id, departments.name").average(:score_for_avg) }


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




  trigger.before(:insert) do

  <<-SQL

    IF (NEW.status != 4) THEN  
      
      NEW.score_for_avg := 0;
      
    ELSIF (NEW.status = 4) THEN  

      IF (NEW.score IS NULL) THEN
      
        NEW.score_for_avg := 0;
        
      ELSE
      
        NEW.score_for_avg := NEW.score;
      
      END IF;

    END IF;

  SQL

  end


  trigger.before(:update).of(:score, :status) do

  <<-SQL

    IF (NEW.status != 4) THEN  
      
      NEW.score_for_avg := 0;
      
    ELSIF (NEW.status = 4) THEN  

      IF (NEW.score IS NULL) THEN
      
        NEW.score_for_avg := 0;
        
      ELSE
      
        NEW.score_for_avg := NEW.score;
      
      END IF;

    END IF;

  SQL

  end




end
