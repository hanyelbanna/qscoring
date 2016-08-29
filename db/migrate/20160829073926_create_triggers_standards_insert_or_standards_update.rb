# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersStandardsInsertOrStandardsUpdate < ActiveRecord::Migration
  def up
    create_trigger("standards_before_insert_row_tr", :generated => true, :compatibility => 1).
        on("standards").
        before(:insert) do
      <<-SQL_ACTIONS

    IF (NEW.status != 4) THEN  
      
      NEW.score_for_avg := 0;
      
    ELSIF (NEW.status = 4) THEN  

      IF (NEW.score IS NULL) THEN
      
        NEW.score_for_avg := 0;
        
      ELSE
      
        NEW.score_for_avg := NEW.score;
      
      END IF;

    END IF;
      SQL_ACTIONS
    end

    create_trigger("standards_before_update_of_score_status_row_tr", :generated => true, :compatibility => 1).
        on("standards").
        before(:update).
        of(:score, :status) do
      <<-SQL_ACTIONS

    IF (NEW.status != 4) THEN  
      
      NEW.score_for_avg := 0;
      
    ELSIF (NEW.status = 4) THEN  

      IF (NEW.score IS NULL) THEN
      
        NEW.score_for_avg := 0;
        
      ELSE
      
        NEW.score_for_avg := NEW.score;
      
      END IF;

    END IF;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("standards_before_insert_row_tr", "standards", :generated => true)

    drop_trigger("standards_before_update_of_score_status_row_tr", "standards", :generated => true)
  end
end
