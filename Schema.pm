# Représente le schéma des services disponibles

package Schema;

sub new{
	my($class, @services) = @_;
	my $this = {
		"services" => @services
	};
	bless( $this, $class );
	return $this;
}

1;