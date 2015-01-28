class WelcomeController < ApplicationController
  def index
    @issues = Issue.fetch(4)
    render layout: 'welcome'
  end

  def about
    @issues = Issue.fetch(4)
    render layout: 'application'
  end
end
