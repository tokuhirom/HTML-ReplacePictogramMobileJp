package HTML::ReplacePictogramMobileJp::EZweb;
use strict;
use warnings;
use HTML::ReplacePictogramMobileJp::Base;

filter utf8 => 'x-utf8-kddi', sub {
    unicode_property 'E';
    unicode_hex_cref 'E';
};

# とりあえず KDDI-Auto をつかう.どっちにするべき?
filter sjis => 'x-sjis-kddi-auto', sub {
    unicode_property 'I';
    unicode_property 'E';
    unicode_hex_cref 'E';
};

1;
