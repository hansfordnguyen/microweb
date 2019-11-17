require 'application_controller'

class HomeController < ApplicationController
  def index
    render :index # TODO: Place your code here
  end

  def about
    render :about
  end

  def page_not_found
    render :page_not_found
  end
end
