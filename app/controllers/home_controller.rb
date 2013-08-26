class HomeController < ApplicationController
  def index
    @comics ||= Comic.all.paginate(:page => params[:page])
  end
end
