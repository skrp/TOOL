use strict; use warnings;
use File::Copy;
my $dir = './dump'; my $log = 'log_numget';
my $bad_dir = 'bad'; my $good_dir = 'good';
open(my $lfh, '>>', $log);
my $bad = 'Sadly, the requested';
my $good = ' total of ';

opendir(my $dh, $dir) or die "cant open $dir\n";

while (my $file = readdir($dh))
{
    print "workn on $file\n";
    my $fpath = "$dir/$file";
    open(my $tfh, '<', $fpath) or print "$file OPEN FAIL\n";
    my @tmp = readline $tfh;
    foreach (@tmp)
    {
        if (/$bad/)
        {
            print $lfh "$file BAD EGG\n";
            close $tfh; my $bpath = "$bad_dir/$file";
            move($fpath,$bpath) or die "cant move $bpath\n";
            last;
        }
        elsif (/$good/)
        {
            print $lfh "$file GOOD EGG\n";
            close $tfh; my $gpath = "$good_dir/$file";
            move($fpath,$gpath) or die "cant move $gpath\n";
            last;
        }
    }
}
