#!/usr/bin/perl
use Modern::Perl;

package main {

    sub linear_search2 {
        my ($searchKey, @array) = @_;
        while (my ($index, $value) = each(@array)) {
            if ($value == $searchKey) {
                return ($index, 1);
            }
        }
    }

    sub linear_search {
        my ($searchKey, @array) = @_;
        my ($index, $found) = 0;

        for (my $i = 0; $i < scalar @array && !$found; ++$i) {
            if ($array[ $i ] == $searchKey) {
                $index = $i;
                $found = 1;
            }
        }
        return ($index, $found);
    }


    my @array;
    foreach (0 .. 10) {
        $array[$_] = 2 * $_;
    }

    print "Enter an integer search key: ";
    chomp (my $searchKey = <STDIN> );

    my ($index, $found) = 0;   # $found is initially false

    ($index, $found) = linear_search2($searchKey, @array);

    if ( $found ) {      # $found == 1
       print "Found $searchKey at subscript $index \n";
    }
    else {               # $found == 0
       print "$searchKey not found \n";
    }

}

