package Trip;

sub new{
	my($classe) = @_;
	my $this = {
		prix => 0,
		date => 0,
		lieuDepart => "Unknown",
		lieuArrivee => "Unknown"
	};
	bless($this, $classe);
	return $this;
}