Rails.application.routes.draw do

  resources :roles
  get 'home/timetable'

  resources :rights do
    collection do
      post 'add_roles'
    end
  end

  resources :curriculums do
    collection do
      get :get_requested
      post :approve_requested
      post :disapprove_requested
      post :approve_all_requests
    end
  end

  resources :lessonplans do
    collection do
      get :get_requested
      post :approve_requested
      post :disapprove_requested
      post :approve_all_requests
    end
  end

  resources :portions do
    collection do
      get :get_requested
      post :approve_requested
      post :disapprove_requested
      post :approve_all_requests
    end
  end

  resources :feebreakdowns
  resources :examcalenders do
    collection do
      get 'examdetail'
      get 'quizdetail'
      get 'examdata'
      get 'quizdata'

    end
  end
  resources :calenders do
    collection do
      get "calenderdetail"
      get "calenderdata"
    end
  end
  resources :purchases do
    member do
      put "approve"
      put "disapprove"
    end
    collection do
      post "invoicing"
    end

  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
       post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]
  resources :periods do
    collection do
      get 'make_daily_schedule'
      post 'save_daily_schedule'
    end
  end
  resources :time_tables do
    collection do
      get 'show_daily_schedule'
    end
  end
  resources :invoices do
    collection do
      get "items_data"
      post "invoicing"
      get "student_data"
    end
  end

  resources :packages do
    collection do
      get "items_data"
    end
  end

  resources :items do
    collection do
      get 'add_stock'
      get 'adding_stock'
      get 'get_item'
    end
  end

  resources :shopcategories
  resources :transportfeerecords do
    collection do
      get 'fee_data'
    end
  end
  resources :year_plans do
    member do
      get 'show_schedule'
      get 'weekly_schedule'
      get 'show_weekly_schedule'
      post 'update_weekly_schedule'
      delete 'delete_weekly_schedule'
    end
    collection do
      get :get_requested
      post :approve_requested
      post :disapprove_requested
      post :approve_all_requests
    end
    resources :weeks do
      collection do
        get 'schedule_weeks', :as => :schedule_weeks
        post 'add_schedule_weeks', :as => :add_schedule_weeks

      end
    end
  end

  resources :fees do
    collection do
      get "fee_data"
      get 'fee_defaulter'
      get 'challan'
      get 'student_list'
      get 'buy_books'
      get 'books_invoice'
      get 'student_fee'
    end
  end
  resources :bus_allotments do
    collection do
      get "stops_data"
      get "transports_data"
    end
  end
  resources :stops

  resources :marks
  resources :marksheets do
    member do
      get "upload"
    end
    collection do
      post "uploading"
      get "classresult"
      get "get_class_result"
      get "result_card"
      get "subject_result"
      get "get_subject_result"
      get "result"
    end
  end
  resources :exams
  resources :student_holidays
  resources :transports
  resources :routes
  resources :stops
  resources :vehicles

  resources :weekends do
    collection do
      post 'add_weekends'
    end
  end


  resources :subjects
  resources :grades do
    member do
      get 'all_student'
    end
  end
  resources :batches
  resources :leaves do
    member do
      post 'approve_leave'
    end
  end
  resources :positions
  resources :departments
  resources :categories

  get 'emergencies/new'

  get 'emergencies/index'

  get 'emergencies/show'

  resources :parents do
    collection do
      get "parents_data"
    end
    member do
      get "edit_parent"
    end
  end
  devise_for :users
  resources :users do
    collection do
      post 'add_user'
    end
    member do
      get 'password'
      get 'enable'
    end
  end

  get 'home/index'

  resources :bridges do
    member do
        get 'class_subject'
    end
    collection do
      get 'newassign'
      post 'assigned'
      post 'new'
      post 'assign_teacher'
      get 'teacher_subject'

    end
  end
  resources :employees do
    collection do
      get 'mark_attendance_calendar'
      post 'mark_attendance'
      post 'save_attendances'
      get 'monthly_attendance_report'
      get 'get_monthly_attendance_report_result'
    end
  end
  # get 'home/index'
  resources :emergencies
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :students do
    member do
      post "assignParent"
      get "edit_student"
      get "give_discount"
    end
    collection do
      get "detail"
      get 'detail_by_rollnumber'
      get 'mark_attendance_calendar'
      post 'mark_attendance'
      post 'save_attendances'
      get 'monthly_attendance_report'
      get 'get_monthly_attendance_report_result'
    end
  end
  resources :documents do
    member do
      post "addPreviousInfo"
    end
    collection do
      post "upload"
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
