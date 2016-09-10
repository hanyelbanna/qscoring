module Managers
class ManagerDashboardsController < ApplicationController

  layout "manager"

  def index
  end

  def details


    @chapters = Managers::Chapter.order(id: :asc)
    @departments = Managers::Department.order(id: :asc)

    
    if params[:chapter].present? && params[:select].present?
      if params[:select] == 'BOLD'
        bychapter('by_bold')
      elsif params[:select] == 'Fall BOLD'
        bychapter('by_fall_bold')
      elsif params[:select] == 'Not Scored'
        bychapter('by_not_scored')
      elsif params[:select] == 'Not Validated'
        bychapter('by_not_validated')
      elsif params[:select] == 'Refused'
        bychapter('by_refused')
      elsif params[:select] == 'Rescored'
        bychapter('by_re_scored')
      elsif params[:select] == 'Approved'
        bychapter('by_approved')
      elsif params[:select] == 'Faild'
        bychapter('by_faild_score')
      elsif params[:select] == 'Improvable'
        bychapter('by_improvable')
      elsif params[:select] == 'Full'
        bychapter('by_full_score')
      end

    elsif params[:chapter].present?
      bychapter_noselect
    
    elsif params[:department].present? && params[:select].present?
      if params[:select] == 'BOLD'
        bydepartment('by_bold')
      elsif params[:select] == 'Fall BOLD'
        bydepartment('by_fall_bold')
      elsif params[:select] == 'Not Scored'
        bydepartment('by_not_scored')
      elsif params[:select] == 'Not Validated'
        bydepartment('by_not_validated')
      elsif params[:select] == 'Refused'
        bydepartment('by_refused')
      elsif params[:select] == 'Rescored'
        bydepartment('by_re_scored')
      elsif params[:select] == 'Approved'
        bydepartment('by_approved')
      elsif params[:select] == 'Faild'
        bydepartment('by_faild_score')
      elsif params[:select] == 'Improvable'
        bydepartment('by_improvable')
      elsif params[:select] == 'Full'
        bydepartment('by_full_score')
      end
    elsif params[:department].present? 
      bydepartment_noselect

    elsif params[:select].present?
      if params[:select] == 'BOLD'
        byselect('by_bold')
      elsif params[:select] == 'Fall BOLD'
        byselect('by_fall_bold')
      elsif params[:select] == 'Not Scored'
        byselect('by_not_scored')
      elsif params[:select] == 'Not Validated'
        byselect('by_not_validated')
      elsif params[:select] == 'Refused'
        byselect('by_refused')
      elsif params[:select] == 'Rescored'
        byselect('by_re_scored')
      elsif params[:select] == 'Approved'
        byselect('by_approved')
      elsif params[:select] == 'Faild'
        byselect('by_faild_score')
      elsif params[:select] == 'Improvable'
        byselect('by_improvable')
      elsif params[:select] == 'Full'
        byselect('by_full_score')
      end
    else
      byall
    end

  end


  def counts
  end

  def score_pie
  end

  def status_pie
  end

  def history_line
  end


  def history_scores
    @history_scores = Managers::HistoryScore.where( standard_id: params[:standard_id] ).order(created_at: :desc).page(params[:page]).per_page(10)
  end


  private
    # For All Details
    def bychapter(select_param)
      @standards = Managers::Standard.text_search(params[:query]).by_chapter(params[:chapter]).send(select_param).order(:name).page(params[:page]).per_page(10)
    end

    def bychapter_noselect
      @standards = Managers::Standard.text_search(params[:query]).by_chapter(params[:chapter]).order(:name).page(params[:page]).per_page(10)
    end

    def bydepartment(select_param)
      @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).send(select_param).order(:name).page(params[:page]).per_page(10)
    end

    def bydepartment_noselect
      @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).order(:name).page(params[:page]).per_page(10)
    end

    def byselect(select_param)
      @standards = Managers::Standard.text_search(params[:query]).send(select_param).order(:name).page(params[:page]).per_page(10)
    end

    def byall
      @standards = Managers::Standard.text_search(params[:query]).order(:name).page(params[:page]).per_page(10)
    end


end
end