# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :switch_admin_to_user_and_back, except: [:index, :new, :show, :edit, :update, :create, :destroy] do
  collection do 
    post :swith_admine_user
  end
end

