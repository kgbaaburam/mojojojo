package AbstractService;

sub new{
	my($classe) = @_;
	
	my $this = {};
	bless($this, $classe);
	return $this;
}

sub formatUrl{
	my($this, $url, $date, $lieuDepart, $lieuArrive) = @_;
	my $finalUrl = $url;
	
	# Remplacement des motifs dans l'url fournie
	$finalUrl =~ s/${date}/$date/
	$finalUrl =~ s/${lieuDepart}/$lieuDepart/
	$finalUrl =~ s/${lieuArrive}/$lieuArrive/
	
	return $finalUrl;
}