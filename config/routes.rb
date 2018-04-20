Rails.application.routes.draw do

  get 'questions/add_option'
  post 'users/update_roles/:id' => 'users#update_roles'
  patch 'users/update_roles/:id' => 'users#update_roles'

  #get 'papers/:id/tests/new' => 'tests/new'
  devise_for :users, :controllers =>{registrations: 'registrations'}

  get 'users/manage_roles'
  get 'tests/start_test'
  get 'tests/welcome'
  post 'tests/process_welcome' => 'tests#process_welcome'

  #match  'papers/:paper_id/tests/start_test' ,to: 'tests/start_test', via: [:get]
  resources 'papers'   do
    #resources 'tests', only: [:start_test]
    #get 'tests/start_test'
    resources 'tests', except: [:edit, :update, :destroy]
    #get 'new_paper_test_path'
  end
  get 'papers/index'
  get 'papers/new'

  resources 'tests'
  get 'tests/new'
  get 'tests/index'

  resources 'responses'
  get 'responses/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'roles'
  get 'roles/index'

  resources 'users'
  get 'users/index'
  get 'users/new'


  resources 'questions' do
    resources 'options'
    get 'options/new'
  end

  get 'questions/new'
  get 'options/new'
end