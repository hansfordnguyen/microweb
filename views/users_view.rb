require_relative 'application_view'

class UsersView < ApplicationView
  def index
    header
    body do
      line('Users:')
      @locals[:users].each do |user|
        line("[#{user['id']}] - #{user['name']} - #{user['email']}")
      end
    end
    footer
  end
end
