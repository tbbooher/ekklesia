class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:id])
    @stances = Stance.where(issue_id: @issue.id)
    @legislators = Legislator.filter_legislators_by_vote_count(@issue.id)
  end
end