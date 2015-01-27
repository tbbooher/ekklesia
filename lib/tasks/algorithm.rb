def set_stance_values_for_bills
  Bill.all.each do |bill|
    yea_total = bill.breakdowns.r_yea + bill.breakdowns.d_yea
    nay_total = bill.breakdowns.r_nay + bill.breakdowns.d_nay
    if bill.breakdowns.r_yea > bill.breakdowns.d_yea
      yea_ratio = ((bill.breakdowns.d_yea / yea_total) * 100).round
      yea_stance = 100 - yea_ratio
    else
      yea_ratio = ((bill.breakdowns.r_yea / yea_total) * 100).round
      yea_stance = 0 + yea_ratio
    end
    if bill.breakdowns.r_nay > bill.breakdowns.d_nay
      nay_ratio = ((bill.breakdowns.d_nay / nay_total) * 100).round
      nay_stance = 100 - nay_ratio
    else
      nay_ratio = ((bill.breakdowns.r_nay / nay_total) * 100).round
      nay_stance = 0 + nay_ratio
    end
    p bill.update(yea_stance: yea_stance, nay_stance: nay_stance)
  end
end