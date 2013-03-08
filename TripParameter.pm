package TripParameter;

sub new{
	my($class) = @_;
	my $this = {
		"date" => $date,
		"depart" => $depart,
		"arrive" => $arrive
	};
	bless $this, $class;
	return $this;
}

1;