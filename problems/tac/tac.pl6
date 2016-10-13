#!/usr/bin/env perl6

sub MAIN (Str $file!) {
    die "Not a file ($file)" unless $file.IO.f;

    my @box  = lines $file.IO;
    print join("\n", @box.reverse);
    printf "\n";
    #put @box.reverse;
    #say @box;
    #for $file.IO.lines -> $line {
    #    $revline = reverse($line);
    #    put '$revline';
    #}
   #put "OK";
}
