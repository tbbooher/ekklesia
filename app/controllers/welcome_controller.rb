class WelcomeController < ApplicationController
  def index
    @issues = Issue.all
    render layout: 'welcome'
  end
end
