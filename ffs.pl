#!/usr/bin/perl

use Encode;

%hashTable = (
"a" => "\x{0250}",
"b" => "q",
"c" => "\x{0254}",
"d" => "p",
"e" => "\x{01DD}",
"f" => "\x{025F}",
"g" => "\x{0183}",
"h" => "\x{0265}",
"i" => "\x{0131}",
"j" => "\x{027E}",
"k" => "\x{029E}",
"l" => "\x{0283}",
"m" => "\x{026F}",
"n" => "u",
"o" => "o",
"p" => "d",
"q" => "b",
"r" => "\x{0279}",
"s" => "s",
"t" => "\x{0287}",
"u" => "n",
"v" => "\x{028C}",
"w" => "\x{028D}",
"x" => "x",
"y" => "\x{028E}",
"z" => "z",
"." => "\x{02D9}",
"[" => "]",
"(" => ")",
" " => " ",
"{" => "}",
"?" => "\x{00BF}".
"!" => "\x{00A1}",
"\\" => ",",
"<" => ">",
"_" => "\x{203E}",
"x{203F" => "\x{2040}",
"x{2045" => "\x{2046}",
"x{2234" => "\x{2235}",
"\r" => "\n",
"'" => "\x{27}");

my $word = $ARGV[0];
my $output = "";
my $kerby = "(\x{30CE}\x{0CA0}\x{76CA}\x{0CA0})\x{30CE}\x{5F61} ";
my @chars = split(undef,$word);

foreach my $val (@chars) {
	my $newChar = lc $hashTable {$val};
	$output .= decode_utf8($newChar);
}
$output = reverse $output;
my $final = $kerby.$output;
my $pipe;
binmode STDOUT, ":utf8";
open $pipe, " | pbcopy";
print $pipe $final;
