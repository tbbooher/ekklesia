module Algorithm

  def self.legislator_voting_tendency_algorithm
    Issue.all.each do |issue|
      Legislator.all.each do |legislator|
        p legislator.bills.where(issue_id: issue.id)
      end
    end
  end

end

