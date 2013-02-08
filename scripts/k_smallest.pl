#!/usr/bin/perl
use Modern::Perl;

sub k_minimal_element {
    my ($k_smalles, @array) = @_;
    my $smallest;
    my $minimal;

    foreach (@array) {
        $minimal = $array[0];
        if ($minimal > $_) {
            $minimal = $_;
        }
    }
    for (0 .. $k_smalles -2) {
        $smallest = $array[0];
        foreach (@array) {
            if ($minimal < $_ && $_ < $smallest) {
                $smallest = $_;
            }
        }
        $minimal = $smallest;
    }
    return $smallest;
}


# First let's generate our array
my @array;
for (0 .. 10) {
    $array[$_] = int(rand(-100));
}
for (10 .. 20) {
    $array[$_] = int(rand(100));
}
print "My array is @array\n";


# let's clall our function
my $k_smalles = 3;
my $element = k_minimal_element($k_smalles, @array);
print "the $k_smalles th smallest element is $element\n";

