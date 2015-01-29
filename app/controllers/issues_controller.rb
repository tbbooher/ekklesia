class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:id])
    @legislators = Legislator.filter_legislators_by_vote_count(@issue.id)
  end
end