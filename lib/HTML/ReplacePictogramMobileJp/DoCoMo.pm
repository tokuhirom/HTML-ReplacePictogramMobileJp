package HTML::ReplacePictogramMobileJp::DoCoMo;
use strict;
use warnings;
use HTML::ReplacePictogramMobileJp::Base;

filter utf8 => 'x-utf8-docomo', sub {
    unicode_property 'I';
    unicode_hex_cref 'I';
};

filter sjis => 'x-sjis-docomo', sub {
    unicode_property 'I';
    unicode_hex_cref 'I';
};

1;
