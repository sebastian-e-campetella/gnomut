Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   post "/mutant", to: "magneto#mutant"
   get  "/stats", to:  "magneto#stats"
end
