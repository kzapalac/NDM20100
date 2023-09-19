# Question 1
# when I run wc, this file looks like it has 0 lines even though it contains data!
echo "Lines in the csv intially:"
cat /anvil/projects/tdm/data/stackoverflow/unprocessed/2011.csv | wc -l
# split the columns (indicated with commas) into new lines and count words in the first 10 lines
echo "Words in the first 10 lines split by commas:"
cat /anvil/projects/tdm/data/stackoverflow/unprocessed/2011.csv | tr ',' '\n' | head -n10 | wc -w

# Question 2
# grabbing the 5th line to see what it is
echo "This is what the 5th line looks like:"
head /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | head -n5 | tail -n1
# set the field separator as ";" and specified that awk should only print the number of fields for the 5th row of the file provided
echo "Number of fields in the 5th row:"
awk -F";" '{if(NR==5) print NF}' /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt

# Question 3
# prints the state bottle retail price and item description fields, sorts by price in descending order, and returns the 6 most expensive items
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | awk -F';' '{print $20","$16}' | sort -nr | head -n6

#Question 4
# grabbing the bottle volume field, sorting by the bottle volume (must specify it's a number rather than a string) which must be done before using uniq because uniq counts the duplicate values that are right next to each other, and counting how many times each bottle volume appears in the file
cat /anvil/projects/tdm/data/iowa_liquor_sales/iowa_liquor_sales_cleaner.txt | cut -d';' -f10 | sort -n | uniq -c