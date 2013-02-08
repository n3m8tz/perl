#!/usr/bin/perl
use Modern::Perl;

sub binary_sort {
    my (@array) = @_;
    my @new;
    foreach (@array) {
        if ($_ == 0) {
            unshift(@new, 0);
            } else {
                push(@new, 1);
            }
    }
    return @new;
}


# First let's generate our array
my @array;
for (0 .. 10) {
    $array[$_] = int(rand(2));
}
print "the array is @array\n";
my @array2 = map { int(rand(100) } 1 .. 100;


my @sorted = binary_sort(@array);
print "the sorted array is @sorted\n";

