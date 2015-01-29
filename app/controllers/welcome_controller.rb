class WelcomeController < ApplicationController
  def index
    @issues = Issue.all
    render layout: 'welcome'
  end

  def about
    @issues = Issue.all
    render layout: 'application'
  end
end
