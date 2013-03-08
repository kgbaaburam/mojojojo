package crawl;

use Mojolicious::Lite;
use Mojo::UserAgent;
use URI::Escape;
use Mojo::DOM;

my $ua = Mojo::UserAgent->new;


my $depart = "bordeaux";
my $arrivee = "paris";
my $date = uri_escape("08/03/2013");


my $url = "http://www.covoiturage.fr/recherche?fc=".$depart."&tc=".$arrivee."&d=".$date."&to=BOTH&p=1&n=20&t=tripsearch&a=searchtrip";


my $contenu = $ua->get($url)->res->dom('li.one-trip');

my @datas;

$contenu->each(sub {
    my ($e, $count) = @_;

    my $dom = Mojo::DOM->new($e);


    # my $lieu_depart;
    # my $lieu_arrivee;
    # my $prix;
    # my $date;
    # my $heure;
    # my $duree;

    my $lieux = $dom->at('h2 span');

    # my @data = ($lieu_depart, $lieu_arrivee, $prix, $date, $heure, $duree);
    push(@datas, $lieux);
  });



get '/' => {text => @datas[1]};


app->start;

1;