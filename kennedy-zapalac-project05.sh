# question 1a
echo "Total cost of purchases with WHISKIES in the line"
# searching for whiskies in the whole line and adding state bottle price to myprices if the line contains that
# was told it's ok to search the whole line
# repeat for each line
# finally print the total cost of purchases with whiskies in the line, represented by myprices
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{if ($0 ~ /WHISKIES/) {myprices += $19}} END{print myprices}'
# question 1b
echo "Total cost of purchases from CEDAR RAPIDS"
# searching for whiskies in the whole line and adding state bottle price to myprices if the line contains that
# repeat for each line
# finally print the total cost of purchases with cedar rapids in the line, represented by myprices
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{if ($0 ~ /CEDAR RAPIDS/) {myprices += $19}} END{print myprices}'

# question 2a
# extract ONLY the field with the store names
# sort the resulting data so that the same store names are next to each other
# then use uniq -c to see how many values of each store name there are
# and sort this data using sort -n (to sort the data numerically)
# and finally take the tail of the results
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | cut -d";" -f4 | sort | uniq -c | sort -n | tail -n1
# question 2b
# pipe the output from cat to awk
# ; is the delimeter
# if field 4, the store name, contains "HY-VEE #3 / BDI / DES MOINES", then pull field 19, the state bottle cost, and sum the cost of all purchases from this store
# had to escape the forward slashes with backward slashes so awk didn't think the pattern to match ended
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{if ($4 ~ /HY-VEE #3 \/ BDI \/ DES MOINES/) {myprices += $19}} END{print myprices}'

# Question 3a
# piping the ouput of cat to awk
# adding the value in field 23 to myvolumes for each line and printing the final sum
# field 23 = volume sold (liters)
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{myvolumes += $23} END{print myvolumes}'
# Question 3b
# piping the output of cat to awk
# adding the value in field 23 to myvolumes only if the line contains `VODKA 80 PROOF`
# field 23 = volume sold (liters)
# repeat for each line
# print the final sum
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{if ($0 ~ /VODKA 80 PROOF/) {myvolumes += $23}} END{print myvolumes}'

# question 4a
# pipe the output of cat to cut
# extract the address, city, and zip code fields
# sort the resulting data so that the same store names are next to each other
# then use uniq -c to see how many values of each store name there are
# and sort this data using sort -n (to sort the data numerically)
# and finally take the tail of the results
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | cut -d";" -f5,6,7 | sort | uniq -c | sort -n | tail -n1

# alternate awk method
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{print $5, $6, $7}' | sort | uniq -c | sort -n | tail -n1

# Question 5
# calculating the total volume in ml using the liters field
# just taking it a step further than question 3a
# Question 3a
# piping the ouput of cat to awk
# adding the value in field 23 to myvolumes for each line and printing the final sum divided by 1000
# field 23 = volume sold (liters)
echo "total volume sold in ml"
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{myvolumes += $23} END{print myvolumes/1000}'