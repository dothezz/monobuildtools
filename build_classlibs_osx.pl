use Cwd;
use Cwd 'abs_path';
use Getopt::Long;
use File::Basename;
use File::Path;

my $monoroot = File::Spec->rel2abs(dirname(__FILE__) . "/../..");
my $monoroot = abs_path($monoroot);
my $buildScriptsRoot = "$monoroot/external/buildscripts";

system(
	"perl",
	"$buildScriptsRoot/build.pl",
	"--build=1",
	"--clean=1",
	"--artifact=1",
	"--artifactscommon=1",
	"--aotprofile=mobile_static",
	"--aotprofiledestname=unity_aot",
	"--buildusandboo=1",
	"--forcedefaultbuilddeps=1") eq 0 or die ("Failed builidng mono\n");