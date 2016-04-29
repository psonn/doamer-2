class ErrorsController < ApplicationController
#  def not_found
#  	render(:status => 404)
#  end

#  def internal_server_error
#  	render(:status => 500)
#  end

  def show
  	status_code = params[:code] || 500
    render status_code, status: status_code
  end
end
