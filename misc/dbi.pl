#DBIx::Class
# select * from user where age >= 18

my @adults = $schema->resultset('User')->search({
	age => { '>=' => 18 },
})

foreach my $adult (@adults) {
	# update user set fires=now() where id=
	$adult->update({
		fired => \'now()',
	});
	$adult->cry();
}

#----------------------------------------

__PACKAGE__->table('user_ip');
__PACKAGE__->add_columns(
	'user_id',
	{ data_type => 'integer', is_foreign_key => 1, is_nullable => 0 },
	'ip',
	{ data_type => 'varchar', is_nullable => 0, size => 128 },
);

__PACKAGE__->set_primary_key('user_id', 'ip');
__PACKAGE__->belongs_to(
	'user',
	'Schema::Result::User',
	{ 'user_id' => 'user_id' },
	{ is_deferrable => 1, on_delete => 'CASCADE', on_update => 'CASCADE' },
);

#----------------------------------------

my $user = $schema->resultset('User')->find(1);
my $free_services = $user->accounts->search_related('service', {
	status => {'<>' => $DELETED_STATUS},
	price => 0,
})

#----------------------------------------

my $man = $schema->resultset('User')->search(
	{
		'name' => '',
		'cat.name' => '',
		'dog.name' => '',
	},
	{
		join => ['cat', 'dog'],
	}
)

#----------------------------------------

$person_rs->create(
	{
		name => '',
		email => '',
		cds =>
		[
			{ title => '', year => 1 },
			{ title => '', year => 2 },
			{ title => '', year => 3 }
		],
	}
);

#----------------------------------------

$schema->resultset('User')->find(1)->update({name => '',});
$schema->resultset('Cd')->search({title => '',})->update_all({year => 1,});

#----------------------------------------




