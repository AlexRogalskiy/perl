#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use DBI;

my @drivers = DBI->available_drivers();
print join("\n", @drivers);

print "\n\n";

my @sources = DBI->data_sources("ODBC");
print join("\n", @sources);

my $ds = 'DBI:mysql:bankpaymentstorage:localhost';
#my $ds = 'DBI:ODBC:bankpaymentstorage';

my $user = 'root';
my $passw = 'toor';
my $db = DBI->connect($ds, $user, $passw) or die("ERROR: code=" . $DBI::err . ", message=" . $DBI::errstr);
#my $db = DBI->connect($ds, $user, $passw, {PrintError=>0, RaiseError=>1});
if(!$db) {
	print "ERROR: code=" . $DBI::err . ", message=" . $DBI::errstr;
	exit();
}
#$db->{LongReadLen} = 200;
#$db->{LongTruncOk} = 1;

#$db->do('SET NAMES cp1251');
#$db->do("INSERT INTO staff VALUES(NULL, 'Васильев', 'Антон', 'Васильев', 'vasiliyev\@osp-bank.ru', '7654321', '1', 'M', '1984-03-02')");
$db->do('SET NAMES cp866');
my $res = $db->prepare("SELECT * FROM staff");
$res->execute();
if($res->err) {
	print "ERROR: " . $res->errstr;
} else {
	#$res->dump_results(80, "\n", " - ");
	#print $res->rows();
	#while (my @row = $res->fetchrow_array()) {
	#	print $row[0], " - ", $row[1], " - ", $row[2], "\n";
	#}
	#while (my $row = $res->fetchrow_arrayref()) {
	#	print $row->[0], " - ", $row->[1], "\n";
	#}
	#while (my $row = $res->fetch()) {
	#	print $row->[0], " - ", $row->[1], " - ", $row->[2], "\n";
	#}
	#while (my $row = $res->fetchrow_hashref()) {
	#	print $row->{'Staff_ID'}, " - ", $row->{'UserID'}, " - ", $row->{'FirstName'}, "\n";
	#}
	my $rows = $res->fetchall_arrayref();
	print "Total rows: " . scalar(@$rows) . "\n";
	foreach my $row (@$rows) {
		print $row->[0], " - ", $row->[1], " - ", $row->[2], "\n";
	}
}

#my $result = $db->prepare("INSERT");
#$result->execute("");

$res->finish();

#my $str = "Д'Артаньян и три мушкетера";
#print $db->quote($str);

$db->disconnect();