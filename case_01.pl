#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

#CGI
use CGI::Carp qw(fatalsToBrowser);
print "Content-type: text/html\n\n";

print "<html>\n";
print "<head>\n";
print "<title>Test</title>\n";
print "</head>\n";
print "<body>\n";
print "Test\n";
print "</body>\n";
print "</html>\n";

print <<Label1;
\n\nLong string\n\n
Label1

print "Start time: ", time(), "\n";
#sleep(30);
print "End time: ", time(), "\n";

#web-framework
#use Mojolicious::Lite;
#get '/' => {text => 'Hello World!'};
#app->start;

#PSGI
#my $app = sub {
#    return [200, ['Content-Type' => 'text/plain'], ["hello, world\n"]];
#}

#Misc
#print 1, 0 x 100;

$pi       = 3.141592654;
$link1    = q{<a href="http://ru.wikipedia.org/wiki/Pi">$pi</a>}."\n";
print $link1;
$link2    = qq{<a href="http://ru.wikipedia.org/wiki/Pi">$pi</a>}."\n";
print $link2;

%hash = (
            cat => 'kitten',
            dog => 'puppy',
            cow => 'calf'
        );
print $hash{'cat'}."\n";
print join("-", keys %hash)."\n";
print join("-", values %hash)."\n";
print join("-", %hash)."\n";

sub printTwo{
	print "2\n";
}

sub three{
	"3\n";
}

$s = \&three;
print &$s;
$s = \&printTwo;
print &$s; #print &printTwo

use constant MY => 2;
print MY;