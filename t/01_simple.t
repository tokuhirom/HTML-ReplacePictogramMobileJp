use strict;
use warnings;
use Test::More tests => 10;
use HTML::ReplacePictogramMobileJp;
use Encode;
use Encode::JP::Mobile;

is _x('I', 'utf8', encode('x-utf8-docomo', "\x{E751}")), "<U+E751> I";
is _x('I', 'sjis', encode('x-sjis-docomo', "\x{E757}")), "<U+E757> I";
is _x('I', 'sjis', "&#xE757;"), "<U+E757> I";

is _x('E', 'utf8', encode('x-utf8-ezweb', "\x{ED80}")), "<U+ED80> E";
# is _x('E', 'sjis', encode('x-sjis-docomo', "\x{E757}")), "<U+E757> I", 'docomo => kddi';
is _x('E', 'sjis', encode('x-sjis-kddi-auto', "\x{ED8D}")), "<U+ED8D> E", 'kddi-auto';

is _x('V', 'sjis', encode('x-sjis-softbank', "\x{E001}")), "<U+E001> V", 'softbank-escape';
is _x('V', 'utf8', encode('x-utf8-softbank', "\x{E537}")), "<U+E537> V", 'softbank-utf8';

is _x('H', 'utf8', "&#xE757;"), "<U+E757> I", 'airh sjis hex cref';
is _x('H', 'sjis', "&#xE757;"), "<U+E757> I", 'airh sjis hex cref';
is _x('H', 'sjis', "\xf9\xfc"), "<U+E757> I", 'airh sjis binary';

sub _x {
    my $carrier = shift;
    my $method = shift;
    my $html_ref = shift;

    HTML::ReplacePictogramMobileJp->replace(
        carrier  => $carrier,
        charset  => $method,
        html     => $html_ref,
        callback => sub {
            my ( $unicode, $carrier ) = @_;
            sprintf "<U+%X> $carrier", $unicode;
        }
    );
}
