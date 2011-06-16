class Lender < ActiveRecord::Base

  WAITING = "waiting"
  RECEIVED = "received"
  LOANED_OUT = "loaned_out"
  OVER_DUE = "over_due"
end
