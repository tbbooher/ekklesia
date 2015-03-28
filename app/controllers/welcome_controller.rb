class WelcomeController < ApplicationController

  def index
    @bills = Bill.get_10
    render layout: 'welcome'
  end

end
