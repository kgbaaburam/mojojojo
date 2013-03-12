mojojojo
========

Mojolicious scraping project

========

Config instructions :

- install CPAN Plugins

sudo cpanm URI
sudo cpanm File::Slurp;

========

Perl protips :

instanciation dynamique depuis un string :

my $classname = "myclass2";
eval "use $classname;1" or die($@);
$classname->new();

========

