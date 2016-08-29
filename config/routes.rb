Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static#homepage"

  devise_for :users, class_name: "Managers::User"

  namespace :scorers do
    resources :score_standards, only: [:index, :edit, :update]
    resources :scorer_tasks, only: [:index, :edit, :update]
  end

  namespace :validators do
    resources :validate_standards, only: [:index, :edit, :update]
    resources :validator_tasks, only: [:index, :edit, :update]
  end

  namespace :managers do
    resources :tasks
    resources :action_plans
    resources :history_trend_departments
    resources :history_trend_chapters
    resources :history_scores
    resources :departments
    resources :standards
    resources :frequencies
    resources :chapters
    resources :users
    resources :validators
    resources :managers

    resources :manager_dashboards, only: [:index] do  
      collection do
        get 'counts'
        get 'score_pie'
        get 'status_pie'
        get 'history_line'
        get 'details'
        get 'history_scores'
      end
    end

    resources :chapters_dashboards, only: [:index] do
      collection do
        get 'chapter_dashboard'
        get 'counts'
        get 'score_pie'
        get 'status_pie'
        get 'history_line'
        get 'details'
      end
    end

    resources :departments_dashboards, only: [:index] do
      collection do
        get 'department_dashboard'
        get 'counts'
        get 'score_pie'
        get 'status_pie'
        get 'history_line'
        get 'details'
      end
    end

  end


end
