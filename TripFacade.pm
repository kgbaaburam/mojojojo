package TripFacade;

sub new{
	my($classe, $xmlSchemaPath) = @_;
	my $this = {
		"xmlSchemaPath" => $xmlSchemaPath
	};
	bless($this, $classe);
	return $this;
}

sub getData{
	print("TripFacade::getData");
	my($this, $parameters) = @_;
	my $schemaPath = $this -> {xmlSchemaPath};
	my $schema = ServiceSchemaBuilder -> build( my $schemaPath );
	
	my @services = my $schema -> {services};
	
	foreach my $serviceProviderName (@services) {
		print("Chargement des données depuis le service : '$serviceProviderName'");
		# Import du package du service
		eval "use $serviceProviderName;1";
		
		# Instanciation du ServiceProvider
		my $provider = $serviceProviderName -> new();
		
		# Test héritage d'abstract AbstractService
		if(! my $provider -> isa("AbstractService") ){
			die("Le service : '".$serviceProviderName."' doit hériter de la classe AbstractService.");
		}
		
		my $data = my $provider -> getData($parameters);
		
		# TODO : Traitement sur les données récupérées
		
	}
}

1;