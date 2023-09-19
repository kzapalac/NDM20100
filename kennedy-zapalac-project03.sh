# Question 1
grep -Rin "朝阳区" /anvil/projects/tdm/data/air* >kennedy-zapalac-project03-Q1output.txt # too much output to run directly  in jupyter notebook so I saved the output to another file

# Question 2
# A
head -n 1 /anvil/projects/tdm/data/consumer_complaints/processed.csv
# B
cat /anvil/projects/tdm/data/consumer_complaints/processed.csv | head -n 5 | cut -d, -f 1,4,15
# C
cat /anvil/projects/tdm/data/consumer_complaints/processed.csv | grep 'fraudy fraudulent fraud' | cut -d, -f 1,4,6,15

# Question 3
# A
# surround states with commas to match values in the state field
cat /anvil/projects/tdm/data/consumer_complaints/processed.csv | grep ",IN,\|,OH,\|,IL,\|,WI,\|,MI," |cut -d, -f 1,4,6,9,15 >midwest.csv
# B
# can use ls or wc for this question
echo "rows of data in mimdwest.csv:"
wc -l midwest.csv | cut -d ' ' -f 1 # use cut to reduce the output
echo "size of midwest.csv in megabytes"
ls -l --block-size=MB midwest.csv | cut -d ' ' -f 5 # can use a 1 in front of MB to remove MB from 202MB


# Question 4
echo "rows with improper, struggling, or incorrect:"
grep -ic "improper\|struggling\|incorrect" midwest.csv

# Question 5
# A
echo "Date that appears the most:"
cat /anvil/projects/tdm/data/consumer_complaints/processed.csv | cut -d, -f1 | sort | uniq -c | sed 's/^\s*//' | sort -nr |head -n 1 |cut -d" " -f2-
# must sort before using uniq
# sed used to remove leading white spaces outputted by uniq
# must use -n option for the second sort so that it sorts according to the whole number rather than the first digit, then second digit, etc
# sorted in descending order, so used head to pull the most frequent date
# cut to return only the date and not its frequency
# B
echo "Occurence of each product in the file:"
head /anvil/projects/tdm/data/consumer_complaints/processed.csv | cut -d, -f2 | sort | uniq -c | sed 's/^\s*//' | sort -n
# sed used to remove leading white spaces outputted by uniq