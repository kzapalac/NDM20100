# Question 1
# print the number of fields for each row, then count number of unique fields, which should output the number of rows
# if each row has the same number of fields, which this file does
# then print the first field (# of rows) and the second field (# of columns)
cat /anvil/projects/tdm/data/restaurant/orders.csv | awk -F"," '{print NF}' | uniq -c | awk -F" " '{print "rows: "$1; print "columns: "$2}'
# alternative if you're sure that each row has the same # of fields
cat /anvil/projects/tdm/data/restaurant/orders.csv | awk -F"," '{ } END{print "rows: "NR; print "columns: "NF}'

# Question 2
# print the 25th field, the location type
# remove the header
# sort and count unique entries
# print the first 2 lines
# print the unique location types and number of orders for each location
# format using printf, giving the first output 17 spaces and the second output 16 spaces from the left (- indicates left alignment)
cat /anvil/projects/tdm/data/restaurant/orders.csv | awk -F"," '{print $25}' | grep -v LOCATION_TYPE | sort | uniq -c | 
awk 'BEGIN{print "Location Type    Number of Orders"; print "-------------    ----------------"} 
    {printf "%-17s%-16s\n", $2, $1}'

# Question 3
# grab the 21st field which contains the delivery date
# remove the header
# print just the date without the time
# grab just the year
# sort the years
# output the unique years
cat /anvil/projects/tdm/data/restaurant/orders.csv | awk -F"," '{print $21}' | grep -v delivery_date | awk -F" " '{print $1}' | awk -F"-" '{print $1}' | sort | uniq

# Question 4
# the only year in this dataset is 2019, so I just have to sum the grand total (field 4) for every row and format the output
cat /anvil/projects/tdm/data/restaurant/orders.csv | awk -F"," 'BEGIN{print "Year Summary of Orders in dollars"} {total += $4} END{print "2019 $" total}'

# Question 5
# pipe the output of cat
# grab the 3rd field, which contains the observation date and time
# print just the year and month
# sort year and month
# count unique combinations of year and month
# format print output
cat /anvil/projects/tdm/data/whin/observations.csv | awk -F"|" '{print $3}' | grep -v observation_time | awk -F"-" '{print $1, $2}' | sort | uniq -c | awk 'BEGIN{print "Month and Year    Number of Occurrences"; print "--------------    ---------------------"} {printf "%-4s-%-13s%-21s\n", $2, $3, $1}'