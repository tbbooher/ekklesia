class IssuesController < ApplicationController
  def index
    @legislators = Legislator.all
    @issues = Issue.all
  end
end