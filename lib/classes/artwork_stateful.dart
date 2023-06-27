import 'package:flutter/material.dart';

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  _ArtworkState createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  switchFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  switchDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Artwork"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: <Widget>[
            Stack(
              children: [
                const Image(image: AssetImage('images/Mona_Lisa.jpg')),
                Visibility(
                  visible: !_showDescription,
                  child: Positioned.fill(
                      child: Opacity(
                    opacity: _isFavorite ? 1 : 0.75,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.favorite,
                        color: _isFavorite ? Colors.red : Colors.white,
                        size: 100,
                      ),
                    ),
                  )),
                ),
                Visibility(
                    visible: _showDescription,
                    child: const Positioned.fill(
                      left: 50.0,
                      top: 160.0,
                      right: 50.0,
                      bottom: 180.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Text(
                            "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé\nentre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort\nle 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa\nGherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à\nl'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à\nParis. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci.\nLa Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre\nd'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par\nce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau\nl’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout\ncas considérée comme l'une des représentations d'un visage féminin les plus célèbres au\nmonde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le\ndiamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier\nquotidiennement",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const Text(
              "Mona Lisa",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 30,
                color: Colors.brown,
              ),
            ),
            const Text(
              "Léonard De Vinci",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: switchDescription,
                  icon: const Icon(
                    Icons.article,
                    color: Colors.brown,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    switchFavorite();
                    const snackBar =
                        SnackBar(content: Text("Oeuvre ajoutée à vos favoris"));
                    if (_isFavorite == true) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavorite ? Colors.red : Colors.brown,
                  ),
                ),
              ],
            )
          ])),
        ));
  }
}
