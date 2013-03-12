# Représente les metadatas d'un service

package ServiceData;

sub new{
	my($class, $className, $url) = @_;
	my $this = {
		"className" => $className,
		"url" => $url
	};

	bless( $this, $class );
	return $this;
}

1;