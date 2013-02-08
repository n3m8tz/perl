#!/usr/bin/perl

use Modern::Perl;
use Benchmark qw(cmpthese);

package main {
    sub quick_sort {
        my @a = @_;
        return @a if @a < 2; #Covers empty array and one element array cases
        my $p = pop @a; #Select and remove pivot point from array
        # grep for elements less then pivot in an array and run quick_sort on them
        # do the same for the elemenets greater then pivot and then return the concatenated array
        quick_sort(grep $_ < $p, @a), $p, quick_sort(grep $_ >= $p, @a);
    }

    sub quick_sort_2 {
        return () unless @_;
        (qsort(grep { $_ < $_[0] } @_[1..$#_]), $_[0], qsort(grep { $_ >= $_[0] } @_[1..$#_]));
    }

    sub sort_bubble_inplace {
        my @input = @_;

        my $length  = scalar @input;
        my $swapped = 0;

        if ($length < 1) {
            return;
        }

        for (my $k = 0; $k < $length; $k++) {
            for (my $j = 0; $j < $length - 1; $j++) {
                if ($input[$j] > $input[$j + 1] && ($swapped = 1)) {
                    ($input[$j], $input[$j + 1]) = ($input[$j + 1], $input[$j])
                }
            }

            last unless $swapped;
        }
    }

    sub merge_sort {
        my @x = @_;
        return @x if @x < 2; # Array size 0 or 1 can be considerd sorted
        my $m = int @x / 2; #Taking the middle point
        my @a = merge_sort(@x[0 .. $m - 1]); #Recursevly split all elemenets left of middle
        my @b = merge_sort(@x[$m .. $#x]); #Recursevly split elemenets right of middle
        for (@x) {
                $_ = !@a            ? shift @b #if @a has no elements shift @b
                        : !@b            ? shift @a #if @b has no elements shift @a
                        : $a[0] <= $b[0] ? shift @a #if first elemenet of @a is less then 1st elem of @b shift @a
                        :                  shift @b; #else shift b
        }
        #@x;
    }

    sub insert_sort {
        my @a = @_;
        return @a if @a < 2;

        for (my $i = 1; $i < int @a; $i++) {
                my $val_to_insert = $a[$i];
                my $hole_pos = $i;
                while ($hole_pos > 0 and $val_to_insert < $a[$hole_pos - 1] ) {
                        $a[$hole_pos] = $a[$hole_pos - 1];
                        $hole_pos--;
                }
        $a[$hole_pos] = $val_to_insert;
        }

        return @a;
    }

    sub insert_sort_2 {
        for my $i (0 .. $#_) {
            my ($j, $val) = ($i - 1, $_[$i]);
            $_[$j-- + 1] = $_[$j] while ($j >= 0 && $_[$j] > $val);
            $_[$j+1] = $val;
        }
        @_;
    }


    my @rand = map { int(rand(100)) } 1 .. 100;
    cmpthese(1_000_000, {
        merge_sort  => sub { merge_sort(@rand) },
        quick_sort  => sub { quick_sort(@rand) },
        #quick_sort_2  => sub { quick_sort_2(@rand) },
        sort_bubble_inplace => sub { sort_bubble_inplace(@rand) },
        insert_sort_2 => sub { insert_sort_2(@rand) },
        insert_sort => sub { insert_sort(@rand) }
    });

}




