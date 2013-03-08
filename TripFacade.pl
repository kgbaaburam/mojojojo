package TripFacade;

sub constructeur{
	my($class, $xmlSchemaPath) = @_;
	my $this = {
		"xmlSchemaPath" => $xmlSchemaPath
	}
	bless( $this, $classe );
	return $this;
}

sub getData{
	my ( $this, $parameters ) = @_;
	my $schema = ServiceSchemaBuilder->build($this->{xmlSchemaPath});
	
	@services = $schema -> {services};
	
	foreach my $serviceProviderName (@services) {
		my $command = $serviceProviderName . "-> constructeur()";
		my $provider = eval($command);
		
		$provider -> getData($parameters);
	}
}

1;