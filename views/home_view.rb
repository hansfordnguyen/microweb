require_relative 'application_view'

class HomeView < ApplicationView
  def index
    header
    body do
      line('Welcome to MICROWEB')
    end
    footer
  end

  def about
    header
    body do
      line('Web Browser Simulator Version 0.1')
      line('Contact Support: hansfordnguyen@hotmail.com')
    end
    footer
  end

  def page_not_found
    header
    body do
      line('404')
      line('PAGE NOT FOUND!')
    end
    footer
  end
end
