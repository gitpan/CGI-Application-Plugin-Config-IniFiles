#! perl

use Test::More tests => 5;
use lib qw(. t);

BEGIN { use_ok ("TestConfigIniFiles"); };

$ENV{'CGI_APP_RETURN_ONLY'} = 1;

my $app = new TestConfigIniFiles;
isa_ok ($app,"TestConfigIniFiles");

my $out = $app->run;
#diag ("\n" . $out);

ok ($out =~ m#^Content-Type:#,"header");
ok ($out =~ m#^title="Main title"#m,"main title");
ok ($out =~ m#^dbs=main,test#m,"db list");

exit;

### That's all, folks!
