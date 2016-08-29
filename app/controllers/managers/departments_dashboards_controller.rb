module Managers
class DepartmentsDashboardsController < ApplicationController

  layout "manager"

  def index
    @departments = Managers::Department.departments_by_std
  end

  def department_dashboard
    params[:department] ||= 1
  end

  def details
    
    params[:department] ||= 1

    @departments = Managers::Department.order(id: :asc)


    if params[:department].present? && params[:select].present?
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



  private
    # For All Details
    def bydepartment(select_param)
      @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).send(select_param).order(:name).page(params[:page]).per_page(10)
    end

    def bydepartment_noselect
      @standards = Managers::Standard.text_search(params[:query]).by_department(params[:department]).order(:name).page(params[:page]).per_page(10)
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