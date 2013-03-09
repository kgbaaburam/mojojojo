mojojojo
========

Mojolicious scraping project

========

Config instructions :

- install CPAN Plugins

sudo cpanm URI

========

Perl protips :

instanciation dynamique depuis un string :

my $classname = "myclass2";
eval "use $classname;1" or die($@);
$classname->new();


========

MOJO Tooltips : 
- Création de l'arborescence de fichier mojo
Perl Terminal : (dans le dossier de la solution)
"mojo generate app"

