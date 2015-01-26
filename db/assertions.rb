a = User.first
a.donations
a.donations.first.legislator
a.donations.first.stance
a.upvotes
a.stances
a.stances.first.position
a.stances.first.position.issue
a.stances.first.legislator_stances
a.stances.first.legislators


a.stances.first.legislators.first.legislator_issues
a.stances.first.legislators.first.issues
a.stances.first.legislators.first.bills
a.stances.first.legislators.first.bill_votes
a.stances.first.legislators.first.bill_votes.first.bill
a.stances.first.legislators.first.bill_votes.first.bill.issue