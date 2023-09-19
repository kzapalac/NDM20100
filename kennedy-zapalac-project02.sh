pwd # By default, I start in my home directory
echo $HOME # another way to view my home directory

cd /anvil/projects/tdm/data
echo "part b begins here"
pwd
echo $PWD 
echo "part c begins here"
ls
echo "part d begins here"
ls -aR /anvil/projects/tdm/data/movies_and_tv
cd ~
echo "part f begins here"
pwd

cd /anvil/projects/tdm/opt/lmod
echo $PWD
cd ../../../../../home/x-kzapalac
echo $PWD

cd $SCRATCH
tokei $HOME
echo "First 5 lines:"
head -n 5 /anvil/datasets/training/anvil-101/batch-test/batch-test-README
echo "Last 5 lines:"
tail -n 5 /anvil/datasets/training/anvil-101/batch-test/batch-test-README # the last 3 lines are blank
echo "Number of lines in README:"
wc -l /anvil/datasets/training/anvil-101/batch-test/batch-test-README
echo "Size in bytes of README:"
wc -c /anvil/datasets/training/anvil-101/batch-test/batch-test-README
echo "Location of tokei:"
which tokei

cd $SCRATCH
cp /anvil/projects/tdm/data/movies_and_tv/imdb.db .
mkdir movies_and_tv
mv $SCRATCH/imdb.db ./movies_and_tv
touch im_empty.txt
rm -r movies_and_tv
rm im_empty.txt