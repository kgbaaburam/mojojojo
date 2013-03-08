package TripFacade;

sub constructeur{
	my($class, $xmlSchemaPath) = @_;
	my $this = {
		"xmlSchemaPath" => $xmlSchemaPath,
		"date" => $DATE
	}
	bless( $this, $classe );
	return $this;
}



my $obj1 = TripFacade->__construct();