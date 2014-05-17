class StylesheetsController < ApplicationController
  
  layout nil
  caches_page :rcss
  
  def rcss
    if file_name = params[:file_name]
      render "#{file_name}.rcss", :content_type => 'text/css'
    else
      render :nothing => true, :status => 404
    end
  end

end
