package HTML::ReplacePictogramMobileJp::AirHPhone;
use strict;
use warnings;
use HTML::ReplacePictogramMobileJp::Base;

filter utf8 => 'utf-8', sub {
    unicode_hex_cref 'I';
};

filter sjis => 'x-sjis-airh', sub {
    unicode_property 'I';
    unicode_hex_cref 'I';
};

1;
