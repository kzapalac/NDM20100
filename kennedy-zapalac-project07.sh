# Question 1
# for each of the stores (names stored in field 4), sum the total cost of purchases, then print the total cost of purchases for each store, sort (g
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F";" '{mytotal[$4] += $22} END{for(i in mytotal) {print(mytotal[i], i)}}' | sort -gr | head -n10

# Question 2
# substitute the double quotes (") using sed, s stands for substitute, what I am replacing is after the first "/", and what I want to replace it with is after the second "/"
# sum the total transaction amount for each city, state pair, the print out the 10 city, state pairs with the greatest toal transaction amount
cat /anvil/projects/tdm/data/election/escaped2020sample.txt | sed 's/"//g' | awk -F"|" '{mytotal[$9","$10] += $15} END{for(i in mytotal) {print(mytotal[i], i)}}' | sort -nr | head -n10

# Question 3
# grab the flight data column
# then split into 3 fields separated by "-", grab the year and month (if year = 1990, but this isn't necessary because all the flights are from 1990 but it conveniently removes the older header)
# sort by year and month, then count the number of flight for each year and month pair
cat /anvil/projects/tdm/data/flights/1990.csv | awk -F, '{print $6}' | awk -F"-" '{if($1 == "1990") {print $2"/"$1}}' | sort | uniq -c

# Question 4
# same as above, but then remove the leading white space, separate the fields using a colon instead of space, add headers, and output to file
cat /anvil/projects/tdm/data/flights/1990.csv | awk -F, '{print $6}' | awk -F"-" '{if($1 == "1990") {print $2"/"$1}}' | sort | uniq -c | sed 's/^\s*//' | awk -F" " 'BEGIN{print "flight_month_year;total_number_of_flights"} {print $2";"$1}' > 1990_flight_info.csv
# check the output of the new file I created
cat ~/1990_flight_info.csv