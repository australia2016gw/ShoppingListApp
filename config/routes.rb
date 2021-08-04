Rails.application.routes.draw do
  get 'hello' => 'shop_lists#index'
  
  # 今回はindex、show、new、create、destroyしか使用しないので、onlyでシンボルの配列を指定している。
  resources 'shop_lists', only: %i[index show new create destroy]
  
  root 'shop_lists#index'
end