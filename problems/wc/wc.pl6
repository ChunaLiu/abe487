#!/usr/bin/env perl6

sub MAIN(Str $file='./const.txt'){
    die "$file not a file" unless $file.IO.f;
    
    my ($lines, $words, $chars) = 0, 0, 0; 
    for $file.IO.lines -> $text {
        $lines++;
        $words += $text.words.elems;
        $chars += chars($text);
        #add count of '\n' at the end of each line
        $chars += 1;
}

    printf "lines (%d) words (%d) chars (%d)",$lines,$words,$chars;
}
