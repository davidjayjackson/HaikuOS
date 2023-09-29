BEGIN{FS=","}
{
  # Increment the count variable for each line.
  count++

  # Add the value of field $17 to the total_sales variable.
  total_sales += $18

  # Initialize the min and max variables to the value of the first row.
  if (NR == 1) {
    min = $18
    max = $18
  }

  # Update the min and max variables if the current row is less than or greater than the current min and max values.
  if ($18 < min) {
    min = $18
  }
  if ($18 > max) {
    max = $18
  }
}

END {
  # Print the number of rows.
  print "Number of orders:", count
print "Avg Sales:" , total_sales/count
  # Print the total sales.
  print "Total sales:", total_sales

  # Print the min and max sales.
  print "Min sales:", min
  print "Max sales:", max
  
}
