use v5.14;
sub bracket_matching {
    my $string = shift;
    my $temp = $string;
    my $last = $temp;
    do {
        $last = $temp;
        if($temp =~ /\([^()]*\)/) {
            $temp = "$`" . "$'";
        }
    }while($temp ne $last);
    if($last =~ /[^()]*/ and $last eq "$&") {
        say "\"$string\"是合法字符串";
    } else {
        say "\"$string\"是非法字符串";
    }
}

bracket_matching("test");
bracket_matching("(test)");
bracket_matching("(test)test");
bracket_matching("test)");
bracket_matching("(test");
bracket_matching("(test(test))");
bracket_matching("(test(test)");
bracket_matching("((test)(test))");
bracket_matching("((test)test)test)");
bracket_matching("(test(test)(test)");
