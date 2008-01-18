use inc::Module::Install;
name 'HTML-ReplacePictogramMobileJp';
all_from 'lib/HTML/ReplacePictogramMobileJp.pm';

requires $_ for (qw/
/);

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
