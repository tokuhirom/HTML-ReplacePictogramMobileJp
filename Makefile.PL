use inc::Module::Install;
name 'HTML-ReplacePictogramMobileJp';
all_from 'lib/HTML/ReplacePictogramMobileJp.pm';

requires 'Encode';
requires 'Params::Validate';
requires 'File::ShareDir';
requires 'Encode::JP::Mobile' => '0.22';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
