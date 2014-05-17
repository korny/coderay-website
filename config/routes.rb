Coderay::Application.routes.draw do
  resources :rays do
    member do
      get :expand
    end
  end
  
  # legacy ray URLs
  match "/rays/show/:id" => "rays#show"
  
  answer_to_curl = /\Acurl\b/
  def answer_to_curl.matches? request
    request.headers['HTTP_USER_AGENT'][self]
  end
  root :constraints => answer_to_curl, :to => proc { |env| [200, {}, [File.read(Rails.root + 'public' + 'coderay-benchmark')]] }
  
  get 'download', :to => "download#index"
  get 'download/source'
  
  root :to => 'main#index'
end
