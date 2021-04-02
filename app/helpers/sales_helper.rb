module SalesHelper 
 def active_sales? 
  Sale.active.any?
 end 
end 