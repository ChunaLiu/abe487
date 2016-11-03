#!/usr/bin/env perl6

sub MAIN (Str $s1!, Str $s2!) {
    my $str1 = $s1.IO.e ?? $s1.IO.slurp !! $s1;
    my $str2 = $s2.IO.e ?? $s2.IO.slurp !! $s2;
    
    #put $str1;
    #put $str1.chars;
    #put $str2;
    my $n = min($str1.chars, $str2.chars);
    my $dist = 0;
    for 0..^$n -> $i {
       ++$dist if $str1.substr($i,1) ne $str2.substr($i,1);
        
    }
    #put $dist;
    put $dist+max($str1.chars, $str2.chars) - min($str1.chars, $str2.chars);
    #put "OK";
}
