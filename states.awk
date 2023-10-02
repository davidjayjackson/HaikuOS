
BEGIN{FS=","}
{
  # Skip the first row
  if (NR == 1) {
    next
  }
  
  # Increment the count variable for each line.
  count++

  # Add the value of field $18 to the total_sales variable.
  total_sales += $18

  # Initialize the min and max variables to the value of
  # the first row encountered after skipping the first row.
  if (count == 1) {
    min = $18
    max = $18
  }

  # Update the min and max variables if the current row is
  # less than or greater than the current min and max values.
  if ($18 < min) {
    min = $18
  }
  if ($18 > max) {
    max = $18
  }
}

END {
  # Print state name
    print "State Name: ", $11
  # Print the number of rows.
  print "Number of orders:", count
  
  # Print the average sales.
  print "Avg Sales:", total_sales/count
  
  # Print the total sales.
  print "Total sales:", total_sales

  # Print the min and max sales.
  print "Min sales:", min
  print "Max sales:", max
}
