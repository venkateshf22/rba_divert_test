Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index", as: :root_path

  get "menus/edit/:id" => "menu#edit"
  post "menus/edit/:id" => "menu#update"

  get "cart" => "cart#show", as: :cart_path
  get "cart/add/:menu_id" => "cart#create"
  get "cart/remove/:id" => "cart#delete"
  post "checkout" => "cart#checkout"
  get "orders/:id" => "cart#show_order", as: :order_path

end
