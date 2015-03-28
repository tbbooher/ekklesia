class WelcomeController < ApplicationController

  def index
    @bills = Bill.last(10)
    render layout: 'welcome'
  end

end
