#!/usr/bin/env perl6

sub MAIN(Str $s1!, Str $s2!) {
    my $str1 = $s1.IO.e ?? $s1.IO.slurp !! $s1;
    my $str2 = $s2.IO.e ?? $s2.IO.slurp !! $s2;
    my $count = 0; 
    my %keys1;
    my %keys2;
    for $str1 -> $line1 {
    for $line1.lc.subst(/<-[\w\s]>/, '', :g).words -> $words1 {
    %keys1{ $words1 }++;
    }
    #put %keys1;
    };

    for $str2 -> $line2 {
    for $line2.lc.subst(/<-[\w\s]>/, '', :g).words -> $words2 {
    %keys2{ $words2 }++;
    }
    #put %keys2;
    };

    #put ("testing......");
    for %keys1.kv -> $key1,$value1 {
    #put join "\t", $key1, $value1;
    if %keys2{$key1}:exists {
    $count++;
    # $count +=min(%keys1{$key1},%keys2{$key1});
    #put(%keys1{$key1});
    #put(%keys2{$key1});
    #put("find..." , $key1);
    }
    }
     
    put $count;

 
}
