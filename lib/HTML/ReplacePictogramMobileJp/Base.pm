package HTML::ReplacePictogramMobileJp::Base;
use strict;
use warnings;
use base 'Exporter';
our @EXPORT = qw/validate_args unicode_property unicode_hex_cref filter/;
use Params::Validate ':all';
use Encode;
use Encode::JP::Mobile ':props';

sub validate_args {
    validate(
        @_,
        +{
            callback => { type => CODEREF },
            html     => { type => SCALAR },
        }
    );
    @_;
}

my $property_for = +{
    E => 'InKDDIPictograms',
    I => 'InDoCoMoPictograms',
    V => 'InSoftBankPictograms',
};
sub unicode_property {
    my $carrier = shift;
    $_ =~ s/(\p{$property_for->{$carrier}})/callback(ord $1, $carrier)/ge;
}

sub unicode_hex_cref {
    my $carrier = shift;
    $_ =~ s/&#x([A-F0-9]{4});/callback(hex $1, $carrier)/ge;
}

sub filter {
    my ($charset, $decode_by, $code) = @_;
    my $pkg = caller(0);
    no strict 'refs';
    *{"$pkg\::$charset"} = sub {
        my $class = shift;
        my %args = validate_args(@_);
        local $_ = decode($decode_by, $args{html}, Encode::FB_XMLCREF);
        local *HTML::ReplacePictogramMobileJp::Base::callback = $args{callback};
        local *{"$pkg\::callback"} = $args{callback};

        $code->();

        $_ = encode($decode_by, $_);

        $_;
    };
}

1;
