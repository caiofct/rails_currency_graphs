Rails.application.routes.draw do
  get 'graphics/index'

  get 'graphics/chart'

  root 'graphics#index'
end
