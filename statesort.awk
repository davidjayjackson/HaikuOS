BEGIN {FS=","; PROCINFO["sorted_in"] = "@ind_str_asc"}
{
  # Skip the first row (header)
  if (NR == 1) {
    next
  }
  
  # Count the number of orders for each state
  orders_by_state[$11]++
  
  # Calculate the total sales for each state
  total_sales_by_state[$11] += $18
}

END {
  # Print the header
  print "State,Number of Orders,Total Sales"
  
  # Loop through the sorted array to print the state, number of orders, and total sales
  for (state in orders_by_state) {
    print state "," orders_by_state[state] "," total_sales_by_state[state]
  }
}
