// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static String m0(playerName, winningBid) =>
      "${playerName} a-t-il atteint sa mise (${winningBid} points)?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("à propos"),
        "ace": MessageLookupByLibrary.simpleMessage("as"),
        "ace11Points": MessageLookupByLibrary.simpleMessage("as: 11 points"),
        "add": MessageLookupByLibrary.simpleMessage("ajouter"),
        "addPlayer": MessageLookupByLibrary.simpleMessage("ajouter un joueur"),
        "adding": MessageLookupByLibrary.simpleMessage("ajouter"),
        "appreciation": MessageLookupByLibrary.simpleMessage("crédits"),
        "armour": MessageLookupByLibrary.simpleMessage("armure"),
        "awardedToThePlayerWith3KnightCardsPlayed":
            MessageLookupByLibrary.simpleMessage(
                "awarded to the player with 3+ knight cards played"),
        "awardedToThePlayerWith5ConnectedRoads":
            MessageLookupByLibrary.simpleMessage(
                "awarded to the player with 5+ connected roads"),
        "back": MessageLookupByLibrary.simpleMessage("retour"),
        "biddingPhase":
            MessageLookupByLibrary.simpleMessage("phase d\'enchères:"),
        "bingo": MessageLookupByLibrary.simpleMessage("bingo"),
        "boots": MessageLookupByLibrary.simpleMessage("bottes"),
        "buildANewSettlementOnAnIntersection":
            MessageLookupByLibrary.simpleMessage(
                "build a new settlement on an intersection"),
        "buildingCosts":
            MessageLookupByLibrary.simpleMessage("coûts de construction :"),
        "buildingRules":
            MessageLookupByLibrary.simpleMessage("règles de construction :"),
        "cancel": MessageLookupByLibrary.simpleMessage("annuler"),
        "catan": MessageLookupByLibrary.simpleMessage("catan"),
        "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
            "carte de développement : 1 laine + 1 blé + 1 minerai"),
        "catanBuildingCostsOne":
            MessageLookupByLibrary.simpleMessage("route : 1 bois + 1 argile"),
        "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
            "ville (amélioration) : 2 blé + 3 minerai (2)"),
        "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
            "colonie : 1 bois + 1 argile + 1 laine + 1 blé (1)"),
        "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
            "les villes remplacent les colonies existantes"),
        "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
            "les routes doivent se connecter à vos routes, colonies ou villes existantes"),
        "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
            "les colonies doivent se connecter à votre réseau routier"),
        "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
            "les colonies doivent être à au moins 2 intersections de toute autre colonie/ville"),
        "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
            "2 cartes spéciales : route la plus longue, armée la plus puissante"),
        "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
            "95 cartes de ressources (19 de chaque : bois, argile, laine, blé, minerai)"),
        "catanComponentsFour":
            MessageLookupByLibrary.simpleMessage("18 jetons numérotés"),
        "catanComponentsNine":
            MessageLookupByLibrary.simpleMessage("1 voleur, 2 dés"),
        "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
            "19 hexagones de terrain (4 forêts, 4 champs de blé, 4 pâturages, 3 montagnes, 3 collines, 1 désert)"),
        "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
            "pièces de joueur : 5 colonies, 4 villes, 15 routes par joueur"),
        "catanComponentsSix":
            MessageLookupByLibrary.simpleMessage("25 cartes de développement"),
        "catanComponentsThree":
            MessageLookupByLibrary.simpleMessage("9 pièces de port"),
        "catanComponentsTwo":
            MessageLookupByLibrary.simpleMessage("6 pièces du cadre maritime"),
        "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
            "monopole (2) : nommez une ressource, tous les joueurs vous donnent les leurs"),
        "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
            "chevalier (14) : déplacez le voleur, volez 1 ressource à un joueur adjacent"),
        "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
            "construction de routes (2) : construisez 2 routes gratuitement"),
        "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
            "point de victoire (5) : vaut 1, gardez caché jusqu\'à la victoire"),
        "catanGameGoal": MessageLookupByLibrary.simpleMessage(
            "soyez le premier joueur à atteindre 10 points de victoire en construisant des colonies, des villes, des routes et en obtenant des cartes spéciales."),
        "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
            "lancez les dés : tous les joueurs avec des colonies/villes sur les hexagones correspondant au numéro reçoivent des ressources"),
        "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
            "construction : dépensez des ressources pour construire des routes, colonies, villes ou acheter des cartes de développement"),
        "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
            "commerce : échangez des ressources avec d\'autres joueurs ou utilisez les ports (4:1 ou tarifs spéciaux)"),
        "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
            "chaque joueur place 2 colonies et 2 routes dans l\'ordre inverse des tours"),
        "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
            "assemblez le plateau avec les hexagones de terrain à l\'intérieur du cadre maritime"),
        "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
            "placez le voleur sur l\'hexagone du désert"),
        "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
            "placez les jetons numérotés sur les hexagones (sauf le désert)"),
        "catanResourcesFive":
            MessageLookupByLibrary.simpleMessage("montagnes – minerai"),
        "catanResourcesFour":
            MessageLookupByLibrary.simpleMessage("champs – blé"),
        "catanResourcesOne":
            MessageLookupByLibrary.simpleMessage("forêt – bois"),
        "catanResourcesSix":
            MessageLookupByLibrary.simpleMessage("désert – pas de ressources"),
        "catanResourcesTree":
            MessageLookupByLibrary.simpleMessage("pâturage – laine (mouton)"),
        "catanResourcesTwo":
            MessageLookupByLibrary.simpleMessage("collines – argile (brique)"),
        "catanScoringFive": MessageLookupByLibrary.simpleMessage(
            "cartes point de victoire : 1 chacune"),
        "catanScoringFour":
            MessageLookupByLibrary.simpleMessage("armée la plus puissante : 2"),
        "catanScoringOne": MessageLookupByLibrary.simpleMessage("colonie : 1"),
        "catanScoringThree":
            MessageLookupByLibrary.simpleMessage("route la plus longue : 2"),
        "catanScoringTwo": MessageLookupByLibrary.simpleMessage("ville : 2"),
        "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
            "route la plus longue : premier joueur avec 5+ routes continues (peut être volée)"),
        "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
            "armée la plus puissante : premier joueur avec 3+ cartes chevalier jouées (peut être volée)"),
        "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
            "l\'hexagone bloqué ne produit pas de ressources tant que le voleur y est"),
        "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
            "tout joueur avec plus de 7 cartes doit en défausser la moitié (arrondi vers le bas)"),
        "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
            "volez 1 ressource aléatoire à un joueur avec une colonie/ville sur cet hexagone"),
        "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
            "déplacez le voleur sur n\'importe quel hexagone (sauf le désert)"),
        "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "catan® est une marque déposée de catan gmbh."),
        "catanTradingOne": MessageLookupByLibrary.simpleMessage(
            "commerce domestique : négociez tout échange avec d\'autres joueurs pendant votre tour"),
        "catanTradingThree": MessageLookupByLibrary.simpleMessage(
            "commerce portuaire : ports génériques 3:1 ou spécifiques 2:1"),
        "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
            "commerce maritime : 4:1 avec la banque (4 ressources identiques pour 1)"),
        "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
            "le premier joueur à atteindre 10 points de victoire pendant son tour gagne la partie. vous devez annoncer votre victoire pendant votre tour."),
        "city": MessageLookupByLibrary.simpleMessage("city"),
        "class1": MessageLookupByLibrary.simpleMessage("classe 1"),
        "class2": MessageLookupByLibrary.simpleMessage("classe 2"),
        "clear": MessageLookupByLibrary.simpleMessage("effacer"),
        "clearance": MessageLookupByLibrary.simpleMessage("dégagement"),
        "cleric": MessageLookupByLibrary.simpleMessage("clerc"),
        "close": MessageLookupByLibrary.simpleMessage("fermer"),
        "common": MessageLookupByLibrary.simpleMessage("compteur"),
        "confirm": MessageLookupByLibrary.simpleMessage("confirmer"),
        "contractResolution":
            MessageLookupByLibrary.simpleMessage("résolution du contrat:"),
        "currentBet": MessageLookupByLibrary.simpleMessage("mise actuelle:"),
        "currentCount": MessageLookupByLibrary.simpleMessage("compte actuel:"),
        "cursed": MessageLookupByLibrary.simpleMessage("maudit"),
        "dark": MessageLookupByLibrary.simpleMessage("sombre"),
        "developmentCardWorth1VictoryPoint":
            MessageLookupByLibrary.simpleMessage(
                "development card worth 1 victory point"),
        "developmentCards":
            MessageLookupByLibrary.simpleMessage("cartes de développement :"),
        "didPlayerReachBid": m0,
        "didYouEnter": MessageLookupByLibrary.simpleMessage("a-t-il atteint"),
        "dontHaveYourFavouriteGameEmailMe":
            MessageLookupByLibrary.simpleMessage(
                "vous n\'avez pas votre jeu préféré ? écrivez-moi!"),
        "dos": MessageLookupByLibrary.simpleMessage("dos"),
        "dwarf": MessageLookupByLibrary.simpleMessage("nain"),
        "edit": MessageLookupByLibrary.simpleMessage("modifier"),
        "elf": MessageLookupByLibrary.simpleMessage("elfe"),
        "english": MessageLookupByLibrary.simpleMessage("anglais"),
        "finish": MessageLookupByLibrary.simpleMessage("terminer"),
        "french": MessageLookupByLibrary.simpleMessage("français"),
        "games": MessageLookupByLibrary.simpleMessage("jeux"),
        "gear": MessageLookupByLibrary.simpleMessage("équipement"),
        "german": MessageLookupByLibrary.simpleMessage("allemand"),
        "halfling": MessageLookupByLibrary.simpleMessage("halfelin"),
        "helmet": MessageLookupByLibrary.simpleMessage("casque"),
        "human": MessageLookupByLibrary.simpleMessage("humain"),
        "jack": MessageLookupByLibrary.simpleMessage("valet"),
        "jack2Points": MessageLookupByLibrary.simpleMessage("valet: 2 points"),
        "king": MessageLookupByLibrary.simpleMessage("roi"),
        "king4Points": MessageLookupByLibrary.simpleMessage("roi: 4 points"),
        "languages": MessageLookupByLibrary.simpleMessage("langues"),
        "largestArmy": MessageLookupByLibrary.simpleMessage("largest army"),
        "level": MessageLookupByLibrary.simpleMessage("niveau"),
        "light": MessageLookupByLibrary.simpleMessage("clair"),
        "longestRoad": MessageLookupByLibrary.simpleMessage("longest road"),
        "magic": MessageLookupByLibrary.simpleMessage("magie"),
        "marriage": MessageLookupByLibrary.simpleMessage("mariage:"),
        "menu": MessageLookupByLibrary.simpleMessage("menu"),
        "mode": MessageLookupByLibrary.simpleMessage("mode"),
        "modifiers": MessageLookupByLibrary.simpleMessage("modificateurs"),
        "multiplayer": MessageLookupByLibrary.simpleMessage("multijoueur"),
        "munchkin": MessageLookupByLibrary.simpleMessage("munchkin"),
        "name": MessageLookupByLibrary.simpleMessage("nom"),
        "nine0Points": MessageLookupByLibrary.simpleMessage("neuf: 0 points"),
        "no": MessageLookupByLibrary.simpleMessage("non"),
        "off": MessageLookupByLibrary.simpleMessage("désactivé"),
        "on": MessageLookupByLibrary.simpleMessage("activé"),
        "options": MessageLookupByLibrary.simpleMessage("options"),
        "others": MessageLookupByLibrary.simpleMessage("autres"),
        "pass": MessageLookupByLibrary.simpleMessage("passer"),
        "play": MessageLookupByLibrary.simpleMessage("jouer"),
        "playerOnBarrel":
            MessageLookupByLibrary.simpleMessage("joueur sur le baril:"),
        "players": MessageLookupByLibrary.simpleMessage("joueurs"),
        "playersOnBarrel":
            MessageLookupByLibrary.simpleMessage("joueurs sur le baril:"),
        "points": MessageLookupByLibrary.simpleMessage("points"),
        "pointsConfirmed":
            MessageLookupByLibrary.simpleMessage("points confirmés"),
        "preparation": MessageLookupByLibrary.simpleMessage("préparation :"),
        "queen": MessageLookupByLibrary.simpleMessage("dame"),
        "queen3Points": MessageLookupByLibrary.simpleMessage("dame: 3 points"),
        "race1": MessageLookupByLibrary.simpleMessage("race 1"),
        "resources": MessageLookupByLibrary.simpleMessage("ressources :"),
        "results": MessageLookupByLibrary.simpleMessage("résultats"),
        "round": MessageLookupByLibrary.simpleMessage("manche"),
        "rules": MessageLookupByLibrary.simpleMessage("règles"),
        "russian": MessageLookupByLibrary.simpleMessage("russe"),
        "score": MessageLookupByLibrary.simpleMessage("score"),
        "scrabble": MessageLookupByLibrary.simpleMessage("scrabble"),
        "set": MessageLookupByLibrary.simpleMessage("set"),
        "settings": MessageLookupByLibrary.simpleMessage("paramètres"),
        "settlement": MessageLookupByLibrary.simpleMessage("settlement"),
        "singleplayer": MessageLookupByLibrary.simpleMessage("solo"),
        "skip": MessageLookupByLibrary.simpleMessage("passer"),
        "spanish": MessageLookupByLibrary.simpleMessage("espagnol"),
        "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
            "cartes spéciales (2 chacune) :"),
        "subtracting": MessageLookupByLibrary.simpleMessage("soustraire"),
        "sword": MessageLookupByLibrary.simpleMessage("épée"),
        "telegram": MessageLookupByLibrary.simpleMessage("telegram"),
        "ten10Points": MessageLookupByLibrary.simpleMessage("dix: 10 points"),
        "theRobberRolling7":
            MessageLookupByLibrary.simpleMessage("le voleur (en faisant 7) :"),
        "theme": MessageLookupByLibrary.simpleMessage("thème"),
        "thief": MessageLookupByLibrary.simpleMessage("voleur"),
        "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
            "en commençant par le joueur après le donneur, les joueurs enchérissent sur le nombre de points qu\'ils pensent pouvoir marquer (enchère minimale de 100). chaque enchère doit être supérieure à l\'enchère précédente (par incréments de 5 ou 10)."),
        "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
            "le joueur avec l\'enchère la plus élevée remporte l\'enchère, prend le talon et déclare l\'atout. l\'enchérisseur défausse 3 cartes face cachée (mais conserve leur valeur en points)."),
        "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
            "les joueurs peuvent passer s\'ils ne veulent pas enchérir plus haut."),
        "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
            "si l\'enchérisseur marque au moins son montant d\'enchère: il ajoute son score réel à son total."),
        "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
            "les autres joueurs ajoutent les points des plis qu\'ils ont remportés à leurs totaux."),
        "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
            "si l\'enchérisseur ne remplit pas son enchère: son montant d\'enchère est soustrait de son total (il peut devenir négatif)."),
        "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
            "l\'enchérisseur commence le premier pli en jouant n\'importe quelle carte. les autres joueurs doivent suivre la couleur si possible. s\'ils ne peuvent pas, ils doivent jouer un atout s\'ils en ont un."),
        "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
            "le gagnant du pli commence le pli suivant. continuez jusqu\'à ce que toutes les cartes soient jouées."),
        "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
            "la carte la plus haute de la couleur jouée l\'emporte, sauf si un atout est joué. l\'atout le plus haut l\'emporte."),
        "thousandGoal": MessageLookupByLibrary.simpleMessage(
            "le but est d\'être le premier joueur à atteindre 1000 points en remportant des plis dans un jeu d\'enchères. les joueurs enchérissent sur le nombre de points qu\'ils peuvent marquer, puis essaient de remplir leur contrat."),
        "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
            "vous ne pouvez marquer des mariages que si vous remportez au moins un pli."),
        "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
            "un mariage est un roi et une dame de la même couleur dans votre main."),
        "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
            "mariage non-atout: 80 points (même règle s\'applique)."),
        "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
            "mariage atout: 100 points (doit être déclaré lors du jeu de la première carte de la paire)."),
        "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
            "utilisez un jeu de 24 cartes: 9, 10, valet, dame, roi, as des quatre couleurs."),
        "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
            "placez 3 cartes face cachée au centre comme le talon (veuve)."),
        "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
            "distribuez 7 cartes à chaque joueur (pour 3 joueurs), ou 8 cartes (pour 2 joueurs)."),
        "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
            "règle du baril: si un joueur atteint 880+ points, il est «sur le baril» et doit marquer exactement 1000, sinon il retombe à 880."),
        "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
            "certaines variantes nécessitent exactement 1000 points pour gagner. dépasser vous ramène à 880 ou au score précédent."),
        "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
            "total des points dans le jeu: 120. ajoutez les bonus de mariage si applicable."),
        "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
            "le premier joueur à atteindre 1000 points (ou exactement 1000, selon les règles de la maison) remporte la partie."),
        "total": MessageLookupByLibrary.simpleMessage("total"),
        "trading": MessageLookupByLibrary.simpleMessage("commerce :"),
        "uno": MessageLookupByLibrary.simpleMessage("uno"),
        "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
            "upgrade a settlement to a city (+1 point)"),
        "victoryPointCard":
            MessageLookupByLibrary.simpleMessage("victory point card"),
        "warrior": MessageLookupByLibrary.simpleMessage("guerrier"),
        "whoGoesFirst":
            MessageLookupByLibrary.simpleMessage("qui distribue en premier ?"),
        "winner": MessageLookupByLibrary.simpleMessage("gagnant : "),
        "wizard": MessageLookupByLibrary.simpleMessage("magicien"),
        "wordIsTooLongMaximum15LettersAllowed":
            MessageLookupByLibrary.simpleMessage(
                "le mot est trop long. maximum 15 lettres autorisées"),
        "yes": MessageLookupByLibrary.simpleMessage("oui"),
        "yourBet": MessageLookupByLibrary.simpleMessage("votre mise")
      };
}
