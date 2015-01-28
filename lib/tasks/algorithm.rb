def set_stance_values_for_bills
  Bill.all.each do |bill|
    if bill.breakdowns.count == 1
      r_yea = bill.breakdowns.first.r_yea
      d_yea = bill.breakdowns.first.d_yea
      r_nay = bill.breakdowns.first.r_nay
      d_nay = bill.breakdowns.first.d_nay
      yea_total = r_yea + d_yea
      nay_total = r_nay + d_nay
      yea_stance = 50
      nay_stance = 50
      if nay_total != 0
        if r_yea > d_yea
          yea_ratio = ((d_yea / yea_total) * 100) #.round
          yea_stance = 100 - yea_ratio
        else
           yea_ratio = ((r_yea / yea_total) * 100) #.round
           yea_stance = 0 + yea_ratio
        end
        if r_nay > d_nay
           nay_ratio = ((d_nay / nay_total) * 100) #.round
           nay_stance = 100 - nay_ratio
        else
           nay_ratio = ((r_nay / nay_total) * 100) #.round
           nay_stance = 0 + nay_ratio
        end
      end
      bill.update(yea_stance: yea_stance, nay_stance: nay_stance)
    end
  end
end


def calculate_issue_score(l_id, i_id)
  total_score = 0
  legislator_votes = BillVote.where(issue_id: i_id, legislator_id: l_id).each do |bill_vote|
   yv = bill_vote.bill.yea_stance
   nv = bill_vote.bill.nay_stance
    if bill_vote.result == "Yea"
      total_score += yv
    else
      total_score += nv
    end
  end
  return 0 if legislator_votes.count == 0
  return (total_score / legislator_votes.count) #.round
end

def set_issue_score_for_legislators
  Issue.all.each do |issue|
    Legislator.all.each do |legislator|
      p LegislatorIssue.create(legislator_id: legislator.id, issue_id: issue.id, issue_score: calculate_issue_score(legislator.id, issue.id))
    end
  end
end

set_stance_values_for_bills
set_issue_score_for_legislators

