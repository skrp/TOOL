file=$1
awk '{ print length($0); }' $file;
# TEST FOR SPECIFIC CHAR 
#num$2
#awk '{ if (length($0) != $num) print length($0); }' $file;
