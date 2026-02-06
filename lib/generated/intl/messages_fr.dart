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
      "est-ce que ${playerName} a atteint son enchère (${winningBid} points) ?";

  static String m1(count) =>
      "${Intl.plural(count, one: 'point', other: 'points')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("à propos"),
    "ace": MessageLookupByLibrary.simpleMessage("as"),
    "ace11Points": MessageLookupByLibrary.simpleMessage("as : 11 points"),
    "add": MessageLookupByLibrary.simpleMessage("ajouter"),
    "addPlayer": MessageLookupByLibrary.simpleMessage("ajouter un joueur"),
    "adding": MessageLookupByLibrary.simpleMessage("ajout"),
    "allowsThePlayerToChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "permet au joueur de choisir la couleur.",
        ),
    "appreciation": MessageLookupByLibrary.simpleMessage("crédits"),
    "armour": MessageLookupByLibrary.simpleMessage("armure"),
    "awardedToThePlayerWith3KnightCardsPlayed":
        MessageLookupByLibrary.simpleMessage(
          "attribuée au joueur avec 3+ cartes chevalier jouées",
        ),
    "awardedToThePlayerWith5ConnectedRoads":
        MessageLookupByLibrary.simpleMessage(
          "attribuée au joueur avec 5+ routes connectées",
        ),
    "back": MessageLookupByLibrary.simpleMessage("retour"),
    "biddingPhase": MessageLookupByLibrary.simpleMessage("phase d\'enchères :"),
    "bigArmour": MessageLookupByLibrary.simpleMessage("grande armure"),
    "bigBoots": MessageLookupByLibrary.simpleMessage("grandes bottes"),
    "bigHelmet": MessageLookupByLibrary.simpleMessage("grand casque"),
    "bigMagic": MessageLookupByLibrary.simpleMessage("grande magie"),
    "bigSword": MessageLookupByLibrary.simpleMessage("grande épée"),
    "bingo": MessageLookupByLibrary.simpleMessage("bingo"),
    "blankTile": MessageLookupByLibrary.simpleMessage("tuile\njoker"),
    "boardBuddy": MessageLookupByLibrary.simpleMessage("board buddy"),
    "boardBuddyIsYourUltimateBoardGameCompanion":
        MessageLookupByLibrary.simpleMessage(
          "board buddy est votre compagnon ultime pour les jeux de société",
        ),
    "bonusTileOrSpecialMarkerScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("tuile bonus ou marqueur spécial"),
    "boots": MessageLookupByLibrary.simpleMessage("bottes"),
    "buffsOrDebuffsAffectingCharactersitemsInfo":
        MessageLookupByLibrary.simpleMessage(
          "buffs ou débuffs affectant les personnages/objets",
        ),
    "buildANewSettlementOnAnIntersection": MessageLookupByLibrary.simpleMessage(
      "construisez une nouvelle colonie sur une intersection",
    ),
    "buildingCosts": MessageLookupByLibrary.simpleMessage(
      "coûts de construction :",
    ),
    "buildingRules": MessageLookupByLibrary.simpleMessage(
      "règles de construction :",
    ),
    "canBeAnyColorChosenByTheCurrentPlayerIfDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "peut être de n\'importe quelle couleur choisie par le joueur actuel. si piochée, le joueur décide de la couleur.",
        ),
    "canRepresentAnyNumberForItsOwnParticularColorDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "peut représenter n\'importe quel numéro pour sa propre couleur particulière.",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("annuler"),
    "cardTypesTitle": MessageLookupByLibrary.simpleMessage("types de cartes :"),
    "catan": MessageLookupByLibrary.simpleMessage("catan"),
    "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
      "carte développement : 1 laine + 1 blé + 1 minerai",
    ),
    "catanBuildingCostsOne": MessageLookupByLibrary.simpleMessage(
      "route : 1 bois + 1 argile",
    ),
    "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
      "ville (amélioration) : 2 blé + 3 minerai (2)",
    ),
    "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
      "colonie : 1 bois + 1 argile + 1 laine + 1 blé (1)",
    ),
    "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
      "les villes remplacent les colonies existantes",
    ),
    "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
      "les routes doivent être connectées à vos routes, colonies ou villes existantes",
    ),
    "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
      "les colonies doivent être connectées à votre réseau routier",
    ),
    "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
      "les colonies doivent être à au moins 2 intersections de toute autre colonie/ville",
    ),
    "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
      "2 cartes spéciales : route la plus longue, armée la plus puissante",
    ),
    "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
      "95 cartes ressources (19 de chaque : bois, argile, laine, blé, minerai)",
    ),
    "catanComponentsFour": MessageLookupByLibrary.simpleMessage(
      "18 jetons numérotés",
    ),
    "catanComponentsNine": MessageLookupByLibrary.simpleMessage(
      "1 voleur, 2 dés",
    ),
    "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
      "19 tuiles de terrain (4 forêts, 4 champs de blé, 4 pâturages, 3 montagnes, 3 collines, 1 désert)",
    ),
    "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
      "pièces joueur : 5 colonies, 4 villes, 15 routes par joueur",
    ),
    "catanComponentsSix": MessageLookupByLibrary.simpleMessage(
      "25 cartes développement",
    ),
    "catanComponentsThree": MessageLookupByLibrary.simpleMessage(
      "9 pièces de port",
    ),
    "catanComponentsTwo": MessageLookupByLibrary.simpleMessage(
      "6 pièces de cadre maritime",
    ),
    "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
      "monopole (2) : nommez une ressource, tous les joueurs vous donnent les leurs",
    ),
    "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
      "chevalier (14) : déplacez le voleur, volez 1 ressource au joueur adjacent",
    ),
    "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
      "construction de routes (2) : construisez 2 routes gratuitement",
    ),
    "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
      "point de victoire (5) : vaut 1, gardez caché jusqu\'à la victoire",
    ),
    "catanGameGoal": MessageLookupByLibrary.simpleMessage(
      "soyez le premier joueur à atteindre 10 points de victoire en construisant des colonies, des villes, des routes et en gagnant des cartes spéciales.",
    ),
    "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
      "lancez les dés : tous les joueurs avec des colonies/villes sur les tuiles correspondant au numéro reçoivent des ressources",
    ),
    "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
      "construction : dépensez des ressources pour construire des routes, colonies, villes ou acheter des cartes développement",
    ),
    "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
      "commerce : échangez des ressources avec d\'autres joueurs ou utilisez les ports (4:1 ou taux spéciaux)",
    ),
    "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
      "chaque joueur place 2 colonies et 2 routes dans l\'ordre inverse des tours",
    ),
    "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
      "assemblez le plateau avec les tuiles de terrain à l\'intérieur du cadre maritime",
    ),
    "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
      "placez le voleur sur la tuile désert",
    ),
    "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "placez les jetons numérotés sur les tuiles (sauf le désert)",
    ),
    "catanResourcesFive": MessageLookupByLibrary.simpleMessage(
      "montagnes – minerai",
    ),
    "catanResourcesFour": MessageLookupByLibrary.simpleMessage("champs – blé"),
    "catanResourcesOne": MessageLookupByLibrary.simpleMessage("forêt – bois"),
    "catanResourcesSix": MessageLookupByLibrary.simpleMessage(
      "désert – pas de ressources",
    ),
    "catanResourcesThree": MessageLookupByLibrary.simpleMessage(
      "pâturage – laine (mouton)",
    ),
    "catanResourcesTwo": MessageLookupByLibrary.simpleMessage(
      "collines – argile",
    ),
    "catanScoringFive": MessageLookupByLibrary.simpleMessage(
      "cartes point de victoire : 1 chacune",
    ),
    "catanScoringFour": MessageLookupByLibrary.simpleMessage(
      "armée la plus puissante : 2",
    ),
    "catanScoringOne": MessageLookupByLibrary.simpleMessage("colonie : 1"),
    "catanScoringThree": MessageLookupByLibrary.simpleMessage(
      "route la plus longue : 2",
    ),
    "catanScoringTwo": MessageLookupByLibrary.simpleMessage("ville : 2"),
    "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
      "route la plus longue : premier joueur avec 5+ routes continues (peut être volée)",
    ),
    "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
      "armée la plus puissante : premier joueur avec 3+ cartes chevalier jouées (peut être volée)",
    ),
    "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
      "la tuile bloquée ne produit pas de ressources tant que le voleur y est",
    ),
    "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
      "tout joueur avec plus de 7 cartes doit en défausser la moitié (arrondi à l\'inférieur)",
    ),
    "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
      "volez 1 ressource au hasard à un joueur ayant une colonie/ville sur cette tuile",
    ),
    "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
      "déplacez le voleur sur n\'importe quelle tuile (sauf le désert)",
    ),
    "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "catan® est une marque déposée de catan gmbh.",
    ),
    "catanTradingOne": MessageLookupByLibrary.simpleMessage(
      "commerce domestique : négociez n\'importe quel échange avec d\'autres joueurs pendant votre tour",
    ),
    "catanTradingThree": MessageLookupByLibrary.simpleMessage(
      "commerce portuaire : 3:1 générique ou ports 2:1 pour ressource spécifique",
    ),
    "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
      "commerce maritime : 4:1 avec la banque (4 ressources identiques pour 1)",
    ),
    "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
      "le premier joueur à atteindre 10 points de victoire pendant son tour gagne la partie. vous devez annoncer votre victoire pendant votre tour.",
    ),
    "changesTheColorAndForcesTheNextPlayerToDrawUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "change la couleur et force le joueur suivant à piocher quatre cartes.",
        ),
    "changesTheDirectionOfPlayUnoInfo": MessageLookupByLibrary.simpleMessage(
      "change le sens du jeu.",
    ),
    "charactersGenderFemaleInfo": MessageLookupByLibrary.simpleMessage(
      "genre du personnage : féminin",
    ),
    "charactersGenderMaleInfo": MessageLookupByLibrary.simpleMessage(
      "genre du personnage : masculin",
    ),
    "checkMyWebsite": MessageLookupByLibrary.simpleMessage(
      "visitez mon site web",
    ),
    "city": MessageLookupByLibrary.simpleMessage("ville"),
    "class1": MessageLookupByLibrary.simpleMessage("classe 1"),
    "class2": MessageLookupByLibrary.simpleMessage("classe 2"),
    "clear": MessageLookupByLibrary.simpleMessage("effacer"),
    "clearance": MessageLookupByLibrary.simpleMessage("purification"),
    "cleric": MessageLookupByLibrary.simpleMessage("clerc"),
    "close": MessageLookupByLibrary.simpleMessage("fermer"),
    "common": MessageLookupByLibrary.simpleMessage("compteur"),
    "confirm": MessageLookupByLibrary.simpleMessage("confirmer"),
    "continueGame": MessageLookupByLibrary.simpleMessage("continuer la partie"),
    "continueTitle": MessageLookupByLibrary.simpleMessage("continuer"),
    "contractResolution": MessageLookupByLibrary.simpleMessage(
      "résolution du contrat :",
    ),
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage(
      "impossible de lancer",
    ),
    "currentBet": MessageLookupByLibrary.simpleMessage("enchère actuelle :"),
    "currentCount": MessageLookupByLibrary.simpleMessage("compte actuel :"),
    "cursed": MessageLookupByLibrary.simpleMessage("maudit"),
    "dark": MessageLookupByLibrary.simpleMessage("sombre"),
    "darkSideCardsAreReplacedWithLightOnesAndVice":
        MessageLookupByLibrary.simpleMessage(
          "les cartes du côté sombre sont remplacées par celles du côté clair et vice versa.",
        ),
    "developmentCardWorth1VictoryPoint": MessageLookupByLibrary.simpleMessage(
      "carte développement valant 1 point de victoire",
    ),
    "developmentCards": MessageLookupByLibrary.simpleMessage(
      "cartes développement :",
    ),
    "didPlayerReachBid": m0,
    "didYouEnter": MessageLookupByLibrary.simpleMessage("a atteint"),
    "doReturn": MessageLookupByLibrary.simpleMessage("retour"),
    "dontHaveYourFavouriteGameEmailMe": MessageLookupByLibrary.simpleMessage(
      "votre jeu préféré n\'est pas disponible ? envoyez-moi un e-mail !",
    ),
    "dos": MessageLookupByLibrary.simpleMessage("dos"),
    "dosBonus": MessageLookupByLibrary.simpleMessage("bonus :"),
    "dosBonusDoubleColorMatchDrawCard": MessageLookupByLibrary.simpleMessage(
      "double correspondance de couleur : tous les autres joueurs piochent 1 carte.",
    ),
    "dosBonusNumberColorMatchAddCard": MessageLookupByLibrary.simpleMessage(
      "bonus :",
    ),
    "dosGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "jouez toutes vos cartes et marquez des points grâce aux cartes restantes de vos adversaires. le premier joueur à atteindre 200 points gagne.",
    ),
    "dosGameObjectiveTitle": MessageLookupByLibrary.simpleMessage("objectif :"),
    "dosPreparationCentralRow": MessageLookupByLibrary.simpleMessage(
      "placez 2 cartes dans la \'rangée centrale\'",
    ),
    "dosPreparationDealCards": MessageLookupByLibrary.simpleMessage(
      "distribuez 7 cartes à chaque joueur.",
    ),
    "dosPreparationDrawPile": MessageLookupByLibrary.simpleMessage(
      "mettez le reste du paquet à côté comme pioche.",
    ),
    "dosScoring": MessageLookupByLibrary.simpleMessage("décompte des points :"),
    "dosScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "cartes numérotées : valeur faciale.",
    ),
    "dosScoringWildDos": MessageLookupByLibrary.simpleMessage(
      "\'joker dos\' : 20 points.",
    ),
    "dosScoringWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'joker #\' : 40 points.",
    ),
    "dosSpecialCardWildDos": MessageLookupByLibrary.simpleMessage(
      "\'joker dos\' : remplace deux cartes de n\'importe quelle couleur.",
    ),
    "dosSpecialCardWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'joker #\' : remplace n\'importe quel numéro (1-10) de sa couleur.",
    ),
    "dosSpecialRule": MessageLookupByLibrary.simpleMessage("règle spéciale :"),
    "dosSpecialRuleDosCall": MessageLookupByLibrary.simpleMessage(
      "quand vous avez 2 cartes restantes, criez \'dos !\' si vous oubliez et êtes pris, piochez 2 cartes.",
    ),
    "dosTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "dos® est une marque déposée de mattel.",
    ),
    "dosTurnRuleDoubleMatch": MessageLookupByLibrary.simpleMessage(
      "double correspondance : deux cartes additionnées donnent le numéro d\'une carte de la rangée centrale.",
    ),
    "dosTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "si aucune correspondance n\'est possible, piochez une carte. si elle correspond, vous pouvez la jouer.",
    ),
    "dosTurnRuleEndTurn": MessageLookupByLibrary.simpleMessage(
      "à la fin de votre tour, complétez la rangée centrale à 2 cartes.",
    ),
    "dosTurnRulePickCards": MessageLookupByLibrary.simpleMessage(
      "les joueurs jouent à tour de rôle en faisant correspondre des cartes de leur main aux cartes de la rangée centrale :",
    ),
    "dosTurnRuleSingleMatch": MessageLookupByLibrary.simpleMessage(
      "correspondance simple : une carte correspond par numéro.",
    ),
    "dosVictory200Points": MessageLookupByLibrary.simpleMessage(
      "le premier joueur à atteindre 200 points gagne.",
    ),
    "doublesTheValueOfALetterScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("double la valeur d\'une lettre"),
    "doublesTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "double la valeur d\'un mot entier",
        ),
    "drawFiveUnoFlipInfo": MessageLookupByLibrary.simpleMessage("piocher cinq"),
    "drawOneUnoFlipInfo": MessageLookupByLibrary.simpleMessage("piocher une"),
    "drawTwoCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "carte plus deux",
    ),
    "dwarf": MessageLookupByLibrary.simpleMessage("nain"),
    "eachCardHasANumberDeterminingItsValue":
        MessageLookupByLibrary.simpleMessage(
          "chaque carte a un numéro qui détermine sa valeur.",
        ),
    "eachCardHasANumberFrom0To9WhichUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "chaque carte a un numéro de 0 à 9, qui détermine sa valeur.",
        ),
    "eachCardHasANumberFrom1To9Which": MessageLookupByLibrary.simpleMessage(
      "chaque carte a un numéro de 1 à 9, qui détermine sa valeur.",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("modifier"),
    "elf": MessageLookupByLibrary.simpleMessage("elfe"),
    "emailCopied": MessageLookupByLibrary.simpleMessage("e-mail copié"),
    "endGameTitle": MessageLookupByLibrary.simpleMessage("fin de partie :"),
    "english": MessageLookupByLibrary.simpleMessage("anglais"),
    "enterAWord": MessageLookupByLibrary.simpleMessage("entrez un mot"),
    "featureRequest": MessageLookupByLibrary.simpleMessage(
      "demande de fonctionnalité",
    ),
    "finish": MessageLookupByLibrary.simpleMessage("terminer"),
    "firstBonus": MessageLookupByLibrary.simpleMessage("premier bonus"),
    "flipCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage("carte flip"),
    "flipSide": MessageLookupByLibrary.simpleMessage("côté flip"),
    "flipsAllCardsToTheOppositeSideUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "retourne toutes les cartes du côté opposé.",
        ),
    "followMeOnXTwitter": MessageLookupByLibrary.simpleMessage(
      "suivez-moi sur x (twitter)",
    ),
    "french": MessageLookupByLibrary.simpleMessage("français"),
    "gameGoal": MessageLookupByLibrary.simpleMessage("objectif du jeu :"),
    "gameOver": MessageLookupByLibrary.simpleMessage("fin de partie"),
    "gameTurnTitle": MessageLookupByLibrary.simpleMessage("tour de jeu :"),
    "gameUpTo": MessageLookupByLibrary.simpleMessage("partie jusqu\'à : "),
    "games": MessageLookupByLibrary.simpleMessage("jeux"),
    "gear": MessageLookupByLibrary.simpleMessage("équipement"),
    "german": MessageLookupByLibrary.simpleMessage("allemand"),
    "githubRepository": MessageLookupByLibrary.simpleMessage("dépôt github"),
    "halfBreed": MessageLookupByLibrary.simpleMessage("métis"),
    "halfling": MessageLookupByLibrary.simpleMessage("halfelin"),
    "headGear": MessageLookupByLibrary.simpleMessage("couvre-chef"),
    "helmet": MessageLookupByLibrary.simpleMessage("casque"),
    "heyMyNameIsGleb": MessageLookupByLibrary.simpleMessage(
      "salut ! je m\'appelle gleb",
    ),
    "highestScoreWins": MessageLookupByLibrary.simpleMessage(
      "le score le plus haut gagne",
    ),
    "human": MessageLookupByLibrary.simpleMessage("humain"),
    "indicatesAnActiveCurse": MessageLookupByLibrary.simpleMessage(
      "indique une malédiction active",
    ),
    "jack": MessageLookupByLibrary.simpleMessage("valet"),
    "jack2Points": MessageLookupByLibrary.simpleMessage("valet : 2 points"),
    "keepAwakeMode": MessageLookupByLibrary.simpleMessage("mode écran allumé"),
    "king": MessageLookupByLibrary.simpleMessage("roi"),
    "king4Points": MessageLookupByLibrary.simpleMessage("roi : 4 points"),
    "languages": MessageLookupByLibrary.simpleMessage("langues"),
    "largestArmy": MessageLookupByLibrary.simpleMessage(
      "armée la plus puissante",
    ),
    "leftHand": MessageLookupByLibrary.simpleMessage("main gauche"),
    "letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour":
        MessageLookupByLibrary.simpleMessage(
          " vous permet de suivre les scores et les moments clés sans effort, pour rester concentré sur le jeu",
        ),
    "level": MessageLookupByLibrary.simpleMessage("niveau"),
    "light": MessageLookupByLibrary.simpleMessage("clair"),
    "longestRoad": MessageLookupByLibrary.simpleMessage("route la plus longue"),
    "lowestScoreWins": MessageLookupByLibrary.simpleMessage(
      "le score le plus bas gagne",
    ),
    "magic": MessageLookupByLibrary.simpleMessage("magie"),
    "mapGenerator": MessageLookupByLibrary.simpleMessage("générateur de carte"),
    "marksADeadCharacterInfo": MessageLookupByLibrary.simpleMessage(
      "indique un personnage mort",
    ),
    "marriage": MessageLookupByLibrary.simpleMessage("mariage :"),
    "menu": MessageLookupByLibrary.simpleMessage("menu"),
    "mode": MessageLookupByLibrary.simpleMessage("mode"),
    "modifiers": MessageLookupByLibrary.simpleMessage("modificateurs"),
    "moveHistory": MessageLookupByLibrary.simpleMessage("historique des coups"),
    "multiplayer": MessageLookupByLibrary.simpleMessage("multijoueur"),
    "munchkin": MessageLookupByLibrary.simpleMessage("munchkin"),
    "munchkinCombatCompareLevels": MessageLookupByLibrary.simpleMessage(
      "comparez le niveau de votre personnage (y compris les bonus) avec le niveau du monstre.",
    ),
    "munchkinCombatEscapeRules": MessageLookupByLibrary.simpleMessage(
      "si vous ne parvenez pas à gagner, fuyez (lancez un dé). un 5 ou un 6 réussit. si vous échouez à fuir, suivez les conséquences indiquées sur la carte du monstre.",
    ),
    "munchkinCombatHelpOrBoost": MessageLookupByLibrary.simpleMessage(
      "si votre niveau est inférieur, vous pouvez : demander l\'aide d\'un autre joueur (négocié) ou utiliser des cartes de votre main pour vous renforcer.",
    ),
    "munchkinCombatTitle": MessageLookupByLibrary.simpleMessage(
      "combat (s\'il y a un monstre) :",
    ),
    "munchkinCombatWinCondition": MessageLookupByLibrary.simpleMessage(
      "si votre niveau est égal ou supérieur, vous gagnez et obtenez des trésors et un niveau.",
    ),
    "munchkinCurseEncounter": MessageLookupByLibrary.simpleMessage(
      "malédiction : appliquez-la immédiatement à vous-même.",
    ),
    "munchkinCursesCardType": MessageLookupByLibrary.simpleMessage(
      "malédictions — entravent votre personnage ou les autres joueurs.",
    ),
    "munchkinDeathRules": MessageLookupByLibrary.simpleMessage(
      "mort : vous perdez toutes vos cartes sauf votre niveau et vos races (ou classes).",
    ),
    "munchkinEndTurnDiscardRules": MessageLookupByLibrary.simpleMessage(
      "à la fin de votre tour, défaussez les cartes en excès si vous en avez plus de 5. donnez-les au joueur avec le niveau le plus bas.",
    ),
    "munchkinEquipmentCardType": MessageLookupByLibrary.simpleMessage(
      "équipement — fournit des bonus à votre niveau pendant le combat.",
    ),
    "munchkinGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "soyez le premier à atteindre le niveau 10 en combattant des monstres, en utilisant l\'équipement, les malédictions et les cartes de capacités.",
    ),
    "munchkinInitialCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "chaque joueur prend : 4 cartes du paquet porte et 4 cartes du paquet trésor.",
    ),
    "munchkinLevel10Condition": MessageLookupByLibrary.simpleMessage(
      "niveau 10 : le niveau final ne peut être atteint qu\'en vainquant un monstre.",
    ),
    "munchkinMonsterEncounter": MessageLookupByLibrary.simpleMessage(
      "monstre : combattez-le (voir \'combat\').",
    ),
    "munchkinMonsterEnhancersCardType": MessageLookupByLibrary.simpleMessage(
      "améliorateurs de monstre — augmentent la force du monstre.",
    ),
    "munchkinMonsterVictoryReward": MessageLookupByLibrary.simpleMessage(
      "victoire sur un monstre : vaincre un monstre vous accorde un niveau et des trésors.",
    ),
    "munchkinMonstersCardType": MessageLookupByLibrary.simpleMessage(
      "monstres — combattez-les pour gagner des niveaux.",
    ),
    "munchkinNoMonsterActionsDescription": MessageLookupByLibrary.simpleMessage(
      "jouer un monstre de sa main pour le combattre (facultatif) ou « chercher les ennuis » (piocher une carte du paquet porte dans sa main).",
    ),
    "munchkinNoMonsterActionsTitle": MessageLookupByLibrary.simpleMessage(
      "s\'il n\'y a pas de monstre, le joueur peut :",
    ),
    "munchkinOneTimeItemsCardType": MessageLookupByLibrary.simpleMessage(
      "objets à usage unique — utilisés en combat ou pour d\'autres effets.",
    ),
    "munchkinOtherCardEncounter": MessageLookupByLibrary.simpleMessage(
      "toute autre carte : gardez-la dans votre main.",
    ),
    "munchkinShuffleCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "mélangez les cartes porte et trésor et divisez-les en deux piles séparées.",
    ),
    "munchkinStartingGearInstruction": MessageLookupByLibrary.simpleMessage(
      "les joueurs placent leurs cartes d\'équipement de départ sur la table, s\'ils en ont.",
    ),
    "munchkinTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "munchkin® est une marque déposée de steve jackson games.",
    ),
    "munchkinTurnDescription": MessageLookupByLibrary.simpleMessage(
      "le joueur pioche la carte du dessus du paquet porte. résultats possibles :",
    ),
    "munchkinVictoryCondition": MessageLookupByLibrary.simpleMessage(
      "le premier joueur à atteindre le niveau 10 gagne !",
    ),
    "myOtherApps": MessageLookupByLibrary.simpleMessage(
      "mes autres applications",
    ),
    "nWord": MessageLookupByLibrary.simpleMessage("\nmot"),
    "name": MessageLookupByLibrary.simpleMessage("nom"),
    "newGame": MessageLookupByLibrary.simpleMessage("nouvelle partie"),
    "newGameWithSamePlayers": MessageLookupByLibrary.simpleMessage(
      "nouvelle manche",
    ),
    "nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "le joueur suivant pioche 1 carte et passe son tour.",
        ),
    "nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "le joueur suivant pioche 5 cartes et passe son tour.",
        ),
    "nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "le joueur suivant pioche deux cartes et perd son tour.",
        ),
    "nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "le joueur suivant pioche jusqu\'à obtenir la couleur choisie.",
        ),
    "nine0Points": MessageLookupByLibrary.simpleMessage("neuf : 0 points"),
    "no": MessageLookupByLibrary.simpleMessage("non"),
    "noClass": MessageLookupByLibrary.simpleMessage("sans classe"),
    "noItem": MessageLookupByLibrary.simpleMessage("pas d\'objet"),
    "numberCards": MessageLookupByLibrary.simpleMessage("cartes numérotées"),
    "off": MessageLookupByLibrary.simpleMessage("désactivé"),
    "on": MessageLookupByLibrary.simpleMessage("activé"),
    "options": MessageLookupByLibrary.simpleMessage("options"),
    "others": MessageLookupByLibrary.simpleMessage("autres"),
    "pass": MessageLookupByLibrary.simpleMessage("passer"),
    "play": MessageLookupByLibrary.simpleMessage("jouer"),
    "playerName": MessageLookupByLibrary.simpleMessage("nom du joueur"),
    "playerOnBarrel": MessageLookupByLibrary.simpleMessage(
      "joueur sur le tonneau :",
    ),
    "players": MessageLookupByLibrary.simpleMessage("joueurs"),
    "playersOnBarrel": MessageLookupByLibrary.simpleMessage(
      "joueurs sur le tonneau :",
    ),
    "points": MessageLookupByLibrary.simpleMessage("points"),
    "pointsConfirmed": MessageLookupByLibrary.simpleMessage("points confirmés"),
    "pointsCount": m1,
    "possiblyTheRemovalOfCursesOrDebuffs": MessageLookupByLibrary.simpleMessage(
      "possiblement la suppression de malédictions ou de débuffs",
    ),
    "preparation": MessageLookupByLibrary.simpleMessage("préparation :"),
    "projectWebsite": MessageLookupByLibrary.simpleMessage(
      "site web du projet",
    ),
    "queen": MessageLookupByLibrary.simpleMessage("dame"),
    "queen3Points": MessageLookupByLibrary.simpleMessage("dame : 3 points"),
    "race1": MessageLookupByLibrary.simpleMessage("race 1"),
    "rateTheApp": MessageLookupByLibrary.simpleMessage(
      "évaluez l\'application",
    ),
    "reportABug": MessageLookupByLibrary.simpleMessage("signaler un bug"),
    "resources": MessageLookupByLibrary.simpleMessage("ressources :"),
    "results": MessageLookupByLibrary.simpleMessage("résultats"),
    "returnToMenu": MessageLookupByLibrary.simpleMessage("retour au menu"),
    "reverseCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "carte inverser",
    ),
    "rightHand": MessageLookupByLibrary.simpleMessage("main droite"),
    "rollDiceLocale": MessageLookupByLibrary.simpleMessage("lancer les dés"),
    "round": MessageLookupByLibrary.simpleMessage("manche"),
    "rules": MessageLookupByLibrary.simpleMessage("règles"),
    "russian": MessageLookupByLibrary.simpleMessage("russe"),
    "score": MessageLookupByLibrary.simpleMessage("score"),
    "score50ExtraPointsForUsingAll7Tiles": MessageLookupByLibrary.simpleMessage(
      "marquez 50 points supplémentaires pour avoir utilisé les 7 tuiles",
    ),
    "scrabble": MessageLookupByLibrary.simpleMessage("scrabble"),
    "scrabbleAdditionalDisputedWords": MessageLookupByLibrary.simpleMessage(
      "les mots contestés sont vérifiés dans un dictionnaire convenu.",
    ),
    "scrabbleAdditionalPointsTitle": MessageLookupByLibrary.simpleMessage(
      "règles supplémentaires :",
    ),
    "scrabbleAdditionalReplaceTiles": MessageLookupByLibrary.simpleMessage(
      "les joueurs peuvent échanger des tuiles et passer leur tour.",
    ),
    "scrabbleAdditionalWordRules": MessageLookupByLibrary.simpleMessage(
      "tous les mots doivent être complets et respecter les règles de la langue.",
    ),
    "scrabbleEndGameNoTiles": MessageLookupByLibrary.simpleMessage(
      "le jeu se termine quand il n\'y a plus de tuiles et qu\'aucun coup n\'est possible.",
    ),
    "scrabbleEndGameRemainingTilesPenalty":
        MessageLookupByLibrary.simpleMessage(
          "les tuiles non jouées sont soustraites du score du joueur.",
        ),
    "scrabbleEndGameSkippedTurns": MessageLookupByLibrary.simpleMessage(
      "le jeu se termine si tous les joueurs passent leur tour deux fois.",
    ),
    "scrabbleFeatureBlankTile": MessageLookupByLibrary.simpleMessage(
      "les tuiles blanches peuvent représenter n\'importe quelle lettre mais ne rapportent aucun point.",
    ),
    "scrabbleFeatureRefillTiles": MessageLookupByLibrary.simpleMessage(
      "les joueurs piochent des tuiles après chaque tour pour compléter leur chevalet à 7.",
    ),
    "scrabbleFeatureSevenTileBonus": MessageLookupByLibrary.simpleMessage(
      "utiliser les 7 tuiles en un tour rapporte un bonus de 50 points.",
    ),
    "scrabbleFeaturesTitle": MessageLookupByLibrary.simpleMessage(
      "particularités :",
    ),
    "scrabbleGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "formez des mots sur le plateau en style mots croisés. marquez plus de points que vos adversaires.",
    ),
    "scrabbleGameSetAccessories": MessageLookupByLibrary.simpleMessage(
      "4 chevalets, sac à tuiles.",
    ),
    "scrabbleGameSetBoard": MessageLookupByLibrary.simpleMessage(
      "plateau 15x15.",
    ),
    "scrabbleGameSetLetters": MessageLookupByLibrary.simpleMessage(
      "104 tuiles (dont 2 jokers).",
    ),
    "scrabbleGameSetTitle": MessageLookupByLibrary.simpleMessage(
      "matériel de jeu :",
    ),
    "scrabblePreparationDrawTiles": MessageLookupByLibrary.simpleMessage(
      "chaque joueur pioche 7 tuiles.",
    ),
    "scrabblePreparationFirstTurnRule": MessageLookupByLibrary.simpleMessage(
      "le premier tour revient au joueur dont la tuile tirée au hasard est la plus proche du début de l\'alphabet.",
    ),
    "scrabblePreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "mélangez les tuiles dans le sac.",
    ),
    "scrabbleScoringBlueBonus": MessageLookupByLibrary.simpleMessage(
      "les cases bleues doublent/triplent le score de la lettre.",
    ),
    "scrabbleScoringRedBonus": MessageLookupByLibrary.simpleMessage(
      "les cases rouges doublent/triplent le score du mot.",
    ),
    "scrabbleScoringTitle": MessageLookupByLibrary.simpleMessage(
      "décompte des points :",
    ),
    "scrabbleScoringWordPoints": MessageLookupByLibrary.simpleMessage(
      "points pour un mot : somme des points des tuiles + bonus des cases du plateau.",
    ),
    "scrabbleTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "scrabble® est une marque déposée de hasbro, inc.",
    ),
    "scrabbleTurnRuleFirstWord": MessageLookupByLibrary.simpleMessage(
      "premier mot : doit passer par la case centrale (étoile).",
    ),
    "scrabbleTurnRuleLetterPlacement": MessageLookupByLibrary.simpleMessage(
      "chaque nouvelle tuile doit former partie d\'un nouveau mot ou d\'un mot existant.",
    ),
    "scrabbleTurnRuleWordDirection": MessageLookupByLibrary.simpleMessage(
      "tous les mots doivent être placés horizontalement ou verticalement.",
    ),
    "scrabbleTurnRulesTitle": MessageLookupByLibrary.simpleMessage(
      "règles de tour :",
    ),
    "seaSaltPaper": MessageLookupByLibrary.simpleMessage("sea salt & paper"),
    "seaSaltPaperDuoBoat": MessageLookupByLibrary.simpleMessage(
      "duo de bateaux : jouez immédiatement un autre tour.",
    ),
    "seaSaltPaperDuoCardsDescription": MessageLookupByLibrary.simpleMessage(
      "après votre action, vous pouvez jouer des paires pour déclencher des effets spéciaux :",
    ),
    "seaSaltPaperDuoCardsTitle": MessageLookupByLibrary.simpleMessage(
      "cartes duo :",
    ),
    "seaSaltPaperDuoCrab": MessageLookupByLibrary.simpleMessage(
      "duo de crabes : regardez une pile de défausse et prenez n\'importe quelle carte.",
    ),
    "seaSaltPaperDuoFish": MessageLookupByLibrary.simpleMessage(
      "duo de poissons : piochez la carte du dessus du paquet.",
    ),
    "seaSaltPaperDuoShark": MessageLookupByLibrary.simpleMessage(
      "duo requin + nageur : volez une carte de la main d\'un adversaire.",
    ),
    "seaSaltPaperEndRoundDescription": MessageLookupByLibrary.simpleMessage(
      "quand vous avez 7 points ou plus, vous pouvez terminer la manche en choisissant :",
    ),
    "seaSaltPaperEndRoundTitle": MessageLookupByLibrary.simpleMessage(
      "fin de manche :",
    ),
    "seaSaltPaperGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "collectionnez des cartes pour former des combinaisons et marquer des points. soyez le premier à atteindre le score cible en terminant les manches stratégiquement.",
    ),
    "seaSaltPaperLastChanceOption": MessageLookupByLibrary.simpleMessage(
      "dernière chance : chaque adversaire joue un dernier tour. si vous avez toujours le meilleur score, gagnez des points bonus égaux à votre majorité de couleur. si quelqu\'un vous dépasse, vous ne marquez que votre majorité de couleur.",
    ),
    "seaSaltPaperPreparationDiscard": MessageLookupByLibrary.simpleMessage(
      "retournez deux cartes face visible à côté du paquet pour former deux piles de défausse.",
    ),
    "seaSaltPaperPreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "mélangez toutes les cartes et placez le paquet face cachée au centre.",
    ),
    "seaSaltPaperPreparationStartPlayer": MessageLookupByLibrary.simpleMessage(
      "choisissez un joueur de départ.",
    ),
    "seaSaltPaperScoringCollections": MessageLookupByLibrary.simpleMessage(
      "les collections (coquillages, pingouins, pieuvres) rapportent plus avec plus de cartes.",
    ),
    "seaSaltPaperScoringColorMajority": MessageLookupByLibrary.simpleMessage(
      "majorité de couleur : 1 point bonus par carte de votre couleur la plus fréquente.",
    ),
    "seaSaltPaperScoringMermaid": MessageLookupByLibrary.simpleMessage(
      "sirène : collecter les 4 cartes sirène fait gagner la partie instantanément !",
    ),
    "seaSaltPaperScoringPairs": MessageLookupByLibrary.simpleMessage(
      "les paires et combinaisons rapportent des points selon leur type.",
    ),
    "seaSaltPaperScoringTitle": MessageLookupByLibrary.simpleMessage("score :"),
    "seaSaltPaperStopOption": MessageLookupByLibrary.simpleMessage(
      "stop : la manche se termine immédiatement. tous les joueurs comptent leurs cartes.",
    ),
    "seaSaltPaperTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "sea salt & paper® est une marque de studio bombyx. conçu par bruno cathala et théo rivière.",
    ),
    "seaSaltPaperTurnDescription": MessageLookupByLibrary.simpleMessage(
      "à votre tour, choisissez l\'une des deux actions :",
    ),
    "seaSaltPaperTurnDrawTwo": MessageLookupByLibrary.simpleMessage(
      "piochez deux cartes du paquet, gardez-en une et placez l\'autre face visible sur une pile de défausse.",
    ),
    "seaSaltPaperTurnTakeDiscard": MessageLookupByLibrary.simpleMessage(
      "prenez la carte du dessus d\'une des piles de défausse.",
    ),
    "seaSaltPaperVictory2Players": MessageLookupByLibrary.simpleMessage(
      "2 joueurs : le premier à 40 points gagne.",
    ),
    "seaSaltPaperVictory3Players": MessageLookupByLibrary.simpleMessage(
      "3 joueurs : le premier à 35 points gagne.",
    ),
    "seaSaltPaperVictory4Players": MessageLookupByLibrary.simpleMessage(
      "4 joueurs : le premier à 30 points gagne.",
    ),
    "secondBonus": MessageLookupByLibrary.simpleMessage("deuxième bonus"),
    "secondRace": MessageLookupByLibrary.simpleMessage("race 2"),
    "set": MessageLookupByLibrary.simpleMessage("set"),
    "setCardAttributeFillType": MessageLookupByLibrary.simpleMessage(
      "type de remplissage : vide, rayé, plein.",
    ),
    "setCardAttributeNumberOfSymbols": MessageLookupByLibrary.simpleMessage(
      "nombre de symboles : 1, 2 ou 3.",
    ),
    "setCardAttributeSymbolColor": MessageLookupByLibrary.simpleMessage(
      "couleur du symbole : rouge, vert, violet.",
    ),
    "setCardAttributeSymbolType": MessageLookupByLibrary.simpleMessage(
      "type de symbole : ovale, losange, vague.",
    ),
    "setCardAttributesDescription": MessageLookupByLibrary.simpleMessage(
      "chaque carte est unique et possède 4 attributs :",
    ),
    "setCardAttributesTitle": MessageLookupByLibrary.simpleMessage(
      "attributs des cartes :",
    ),
    "setExampleOfValidSetColor": MessageLookupByLibrary.simpleMessage(
      "attribut \'nombre\' : identique (deux).",
    ),
    "setExampleOfValidSetFill": MessageLookupByLibrary.simpleMessage(
      "que faire si aucun set n\'est trouvé :",
    ),
    "setExampleOfValidSetNumber": MessageLookupByLibrary.simpleMessage(
      "attribut \'type\' : différent (ovale, losange, vague).",
    ),
    "setExampleOfValidSetTitle": MessageLookupByLibrary.simpleMessage(
      "attribut \'couleur\' : différent (rouge, vert, violet).",
    ),
    "setExampleOfValidSetType": MessageLookupByLibrary.simpleMessage(
      "attribut \'remplissage\' : identique (rayé).",
    ),
    "setGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "trouvez un set (un groupe de 3 cartes) où chaque attribut est soit identique sur toutes les cartes, soit différent sur toutes les cartes.",
    ),
    "setGameTurnStepContinue": MessageLookupByLibrary.simpleMessage(
      "exemple d\'un set valide :",
    ),
    "setGameTurnStepDealerSetup": MessageLookupByLibrary.simpleMessage(
      "le distributeur place 12 cartes.",
    ),
    "setGameTurnStepFindingSet": MessageLookupByLibrary.simpleMessage(
      "les joueurs cherchent simultanément un set. le premier à en trouver un annonce : \'set !\'",
    ),
    "setGameTurnStepFour": MessageLookupByLibrary.simpleMessage(
      "le jeu continue.",
    ),
    "setGameTurnStepValidation": MessageLookupByLibrary.simpleMessage(
      "vérifiez la validité : si c\'est correct, le joueur prend les cartes et le distributeur les remplace par 3 nouvelles. si c\'est incorrect, le joueur perd 1 point ou passe son tour (selon l\'accord).",
    ),
    "setImportantRuleCardPosition": MessageLookupByLibrary.simpleMessage(
      "les cartes formant un set peuvent être disposées dans n\'importe quel ordre.",
    ),
    "setImportantRuleConfirmation": MessageLookupByLibrary.simpleMessage(
      "un nouveau set ne peut être déclaré tant que le précédent n\'est pas confirmé.",
    ),
    "setImportantRuleSimplifiedMode": MessageLookupByLibrary.simpleMessage(
      "pour l\'apprentissage, le jeu peut être simplifié en utilisant seulement 3 attributs.",
    ),
    "setImportantRulesTitle": MessageLookupByLibrary.simpleMessage(
      "règles importantes :",
    ),
    "setNoSetFoundDescription": MessageLookupByLibrary.simpleMessage(
      "s\'il n\'existe pas de set parmi les 12 cartes, le distributeur ajoute 3 cartes (jusqu\'à un maximum de 21 cartes). parmi 21 cartes, un set existe toujours.",
    ),
    "setNoSetFoundTitle": MessageLookupByLibrary.simpleMessage(
      "que faire si aucun set n\'est trouvé :",
    ),
    "setScoringGameEnd": MessageLookupByLibrary.simpleMessage(
      "le jeu se termine quand le paquet est épuisé ou qu\'un total de points prédéfini est atteint.",
    ),
    "setScoringPointPerSet": MessageLookupByLibrary.simpleMessage(
      "1 point par set trouvé.",
    ),
    "setScoringTitle": MessageLookupByLibrary.simpleMessage(
      "décompte des points :",
    ),
    "setTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "set® est une marque déposée de set enterprises, inc.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("paramètres"),
    "settlement": MessageLookupByLibrary.simpleMessage("colonie"),
    "shareFeedback": MessageLookupByLibrary.simpleMessage(
      "partager vos commentaires",
    ),
    "shareWithFriedns": MessageLookupByLibrary.simpleMessage(
      "partager avec des amis",
    ),
    "shareWithFriends": MessageLookupByLibrary.simpleMessage(
      "partager avec des amis",
    ),
    "sinceThisIsAnOpenSourceProjectYouCanLeave":
        MessageLookupByLibrary.simpleMessage(
          "comme il s\'agit d\'un projet open-source, n\'hésitez pas à y contribuer",
        ),
    "singleplayer": MessageLookupByLibrary.simpleMessage("un joueur"),
    "skip": MessageLookupByLibrary.simpleMessage("passer"),
    "skipCardUnoInfo": MessageLookupByLibrary.simpleMessage("carte passer"),
    "skipEveryoneCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "carte passer tous",
    ),
    "skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "fait passer tous les joueurs et rend le tour au joueur d\'origine.",
        ),
    "skipsTheNextPlayersTurnUnoInfo": MessageLookupByLibrary.simpleMessage(
      "fait passer le tour du joueur suivant.",
    ),
    "spanish": MessageLookupByLibrary.simpleMessage("espagnol"),
    "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
      "cartes spéciales (2 PV chacune) :",
    ),
    "specialCardsTitle": MessageLookupByLibrary.simpleMessage(
      "cartes spéciales :",
    ),
    "specialRulesTitle": MessageLookupByLibrary.simpleMessage(
      "règles spéciales :",
    ),
    "subtracting": MessageLookupByLibrary.simpleMessage("soustraction"),
    "superMunch": MessageLookupByLibrary.simpleMessage("super munch."),
    "swapHandsWithAnyPlayerAndChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "échangez vos mains avec n\'importe quel joueur et choisissez la couleur.",
        ),
    "sword": MessageLookupByLibrary.simpleMessage("épée"),
    "telegram": MessageLookupByLibrary.simpleMessage("telegram"),
    "ten10Points": MessageLookupByLibrary.simpleMessage("dix : 10 points"),
    "theNumberOfPlayersShouldBe": MessageLookupByLibrary.simpleMessage(
      "le nombre de joueurs doit être",
    ),
    "theRobberRolling7": MessageLookupByLibrary.simpleMessage(
      "le voleur (en faisant 7) :",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("thème"),
    "thief": MessageLookupByLibrary.simpleMessage("voleur"),
    "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
      "à partir du joueur après le donneur, les joueurs enchérissent sur le nombre de points qu\'ils pensent pouvoir marquer (enchère minimum : 100). chaque enchère doit être supérieure à la précédente (par incréments de 5 ou 10).",
    ),
    "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
      "le joueur avec l\'enchère la plus haute remporte l\'enchère, prend le talon et déclare l\'atout. l\'enchérisseur défausse 3 cartes face cachée (mais conserve leur valeur en points).",
    ),
    "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
      "les joueurs peuvent passer s\'ils ne veulent pas enchérir plus haut.",
    ),
    "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
      "si l\'enchérisseur marque au moins le montant de son enchère : il ajoute son score réel à son total.",
    ),
    "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
      "les autres joueurs ajoutent les points des plis qu\'ils ont gagnés à leurs totaux.",
    ),
    "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
      "si l\'enchérisseur n\'atteint pas son enchère : le montant de son enchère est soustrait de son total (il peut devenir négatif).",
    ),
    "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
      "l\'enchérisseur mène le premier pli en jouant n\'importe quelle carte. les autres joueurs doivent suivre la couleur si possible. s\'ils ne peuvent pas, ils doivent jouer un atout s\'ils en ont un.",
    ),
    "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
      "le gagnant du pli mène le pli suivant. continuez jusqu\'à ce que toutes les cartes soient jouées.",
    ),
    "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
      "la carte la plus haute de la couleur menée gagne, sauf si un atout est joué. l\'atout le plus haut gagne.",
    ),
    "thousandGoal": MessageLookupByLibrary.simpleMessage(
      "l\'objectif est d\'être le premier joueur à atteindre 1000 points en remportant des plis dans un jeu d\'enchères. les joueurs enchérissent sur le nombre de points qu\'ils peuvent marquer, puis essaient de remplir leur contrat.",
    ),
    "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
      "vous ne pouvez marquer des mariages que si vous remportez au moins un pli.",
    ),
    "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
      "un mariage est un roi et une dame de la même couleur dans votre main.",
    ),
    "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
      "mariage non-atout : 80 points (même règle s\'applique).",
    ),
    "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
      "mariage d\'atout : 100 points (doit être déclaré en jouant la première carte de la paire).",
    ),
    "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
      "utilisez un jeu de 24 cartes : 9, 10, valet, dame, roi, as des quatre couleurs.",
    ),
    "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
      "placez 3 cartes face cachée au centre comme talon (veuve).",
    ),
    "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "distribuez 7 cartes à chaque joueur (pour 3 joueurs), ou 8 cartes (pour 2 joueurs).",
    ),
    "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
      "règle du tonneau : si un joueur atteint 880+ points, il est \'sur le tonneau\' et doit marquer exactement 1000, sinon il redescend à 880.",
    ),
    "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
      "certaines variantes exigent exactement 1000 points pour gagner. dépasser réinitialise à 880 ou au score précédent.",
    ),
    "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
      "total des points dans le jeu : 120. ajoutez les bonus de mariage si applicable.",
    ),
    "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
      "le premier joueur à atteindre 1000 points (ou exactement 1000, selon les règles de la maison) gagne la partie.",
    ),
    "toAllWhoCreatedThe": MessageLookupByLibrary.simpleMessage(
      "merci à tous ceux qui ont créé",
    ),
    "toBoardBuddysContributors": MessageLookupByLibrary.simpleMessage(
      "les contributeurs de board buddy",
    ),
    "total": MessageLookupByLibrary.simpleMessage("total"),
    "totalStrength": MessageLookupByLibrary.simpleMessage("force totale : "),
    "trading": MessageLookupByLibrary.simpleMessage("commerce :"),
    "tripleTheValueOfALetterScrabbleInfo": MessageLookupByLibrary.simpleMessage(
      "triple la valeur d\'une lettre",
    ),
    "tripleTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "triple la valeur d\'un mot entier",
        ),
    "twoHanded": MessageLookupByLibrary.simpleMessage("deux mains"),
    "uno": MessageLookupByLibrary.simpleMessage("uno"),
    "unoActiveCardDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'plus deux\' : le joueur suivant pioche 2 cartes et perd son tour.",
    ),
    "unoActiveCardReverse": MessageLookupByLibrary.simpleMessage(
      "\'inverser\' : inverse le sens du jeu.",
    ),
    "unoActiveCardSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'passer\' : le joueur suivant perd son tour.",
    ),
    "unoActiveCardWild": MessageLookupByLibrary.simpleMessage(
      "\'joker\' : permet de choisir la couleur de jeu.",
    ),
    "unoActiveCardWildDrawFour": MessageLookupByLibrary.simpleMessage(
      "\'joker plus quatre\' : choisissez la couleur, et le joueur suivant pioche 4 cartes. vous ne pouvez la jouer que si vous n\'avez pas de carte correspondante.",
    ),
    "unoActiveCardsTitle": MessageLookupByLibrary.simpleMessage(
      "cartes action :",
    ),
    "unoFlip": MessageLookupByLibrary.simpleMessage("uno flip"),
    "unoFlipDarkSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "côté sombre :",
    ),
    "unoFlipDarkSideDrawFive": MessageLookupByLibrary.simpleMessage(
      "\'piocher cinq\'",
    ),
    "unoFlipDarkSideDrawUntilColor": MessageLookupByLibrary.simpleMessage(
      "\'piocher jusqu\'à la couleur correspondante\'",
    ),
    "unoFlipDarkSideReverse": MessageLookupByLibrary.simpleMessage(
      "\'inverser\'",
    ),
    "unoFlipDarkSideSkipAll": MessageLookupByLibrary.simpleMessage(
      "\'passer tous\'",
    ),
    "unoFlipDarkSideWildCard": MessageLookupByLibrary.simpleMessage(
      "\'joker\'",
    ),
    "unoFlipGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "jouez toutes vos cartes et marquez des points grâce aux cartes restantes de vos adversaires. le premier joueur à atteindre 500 points gagne.",
    ),
    "unoFlipGameStartDealCards": MessageLookupByLibrary.simpleMessage(
      "chaque joueur reçoit 7 cartes.",
    ),
    "unoFlipGameStartLightSide": MessageLookupByLibrary.simpleMessage(
      "commencez la partie du côté clair du paquet.",
    ),
    "unoFlipGameStartTitle": MessageLookupByLibrary.simpleMessage(
      "début de partie :",
    ),
    "unoFlipKeyMoment": MessageLookupByLibrary.simpleMessage("moments clés :"),
    "unoFlipKeyMomentFlipCardEffect": MessageLookupByLibrary.simpleMessage(
      "après une carte \'flip\', tout le jeu change de côté.",
    ),
    "unoFlipKeyMomentUnoCall": MessageLookupByLibrary.simpleMessage(
      "quand vous jouez votre avant-dernière carte, criez \'uno !\' si vous oubliez et êtes pris, piochez 2 cartes.",
    ),
    "unoFlipLightSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "côté clair :",
    ),
    "unoFlipLightSideDrawOne": MessageLookupByLibrary.simpleMessage(
      "\'piocher une\'",
    ),
    "unoFlipLightSideReverse": MessageLookupByLibrary.simpleMessage(
      "\'inverser\'",
    ),
    "unoFlipLightSideSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'passer le tour\'",
    ),
    "unoFlipLightSideWildCard": MessageLookupByLibrary.simpleMessage(
      "\'joker\'",
    ),
    "unoFlipLightSideWildDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'joker plus deux\'",
    ),
    "unoFlipScoringActiveCards": MessageLookupByLibrary.simpleMessage(
      "cartes action : 20 à 60 points selon le type.",
    ),
    "unoFlipScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "cartes numérotées : valeur faciale.",
    ),
    "unoFlipScoringRoundWinnerPoints": MessageLookupByLibrary.simpleMessage(
      "le gagnant de la manche marque des points pour les cartes restantes des adversaires :",
    ),
    "unoFlipScoringTitle": MessageLookupByLibrary.simpleMessage(
      "décompte des points :",
    ),
    "unoFlipTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno flip® est une marque déposée de mattel.",
    ),
    "unoFlipTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "si aucune carte correspondante n\'est disponible, piochez dans la pile.",
    ),
    "unoFlipTurnRuleFlipCard": MessageLookupByLibrary.simpleMessage(
      "la carte \'flip\' fait passer le jeu de l\'autre côté du paquet.",
    ),
    "unoFlipTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "jouez une carte correspondant à la carte du dessus par couleur, numéro ou symbole.",
    ),
    "unoFlipVictory500Points": MessageLookupByLibrary.simpleMessage(
      "le premier joueur à atteindre 500 points gagne.",
    ),
    "unoFlipVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "alternative : le joueur avec le score le plus bas gagne à la fin de la partie.",
    ),
    "unoGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "soyez le premier à jouer toutes vos cartes et marquez des points grâce aux cartes restantes de vos adversaires. le premier joueur à atteindre 500 points gagne.",
    ),
    "unoGameTurnTitle": MessageLookupByLibrary.simpleMessage(
      "les joueurs jouent à tour de rôle une carte qui correspond à la carte du dessus par couleur, numéro ou symbole.",
    ),
    "unoPreparationDeckInCenter": MessageLookupByLibrary.simpleMessage(
      "placez le reste du paquet au centre comme pioche.",
    ),
    "unoPreparationDistributeCards": MessageLookupByLibrary.simpleMessage(
      "distribuez 7 cartes à chaque joueur.",
    ),
    "unoPreparationFlipFirstCard": MessageLookupByLibrary.simpleMessage(
      "retournez la carte du dessus pour commencer la pile de défausse.",
    ),
    "unoScoring20PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'passer\', \'plus deux\', \'inverser\' : 20 points.",
    ),
    "unoScoring40PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'échange de mains\', \'carte blanche\' : 40 points.",
    ),
    "unoScoring50PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'joker\', \'joker plus quatre\' : 50 points.",
    ),
    "unoScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "cartes numérotées : valeur faciale.",
    ),
    "unoScoringTitle": MessageLookupByLibrary.simpleMessage(
      "décompte des points :",
    ),
    "unoSpecialCardBlank": MessageLookupByLibrary.simpleMessage(
      "\'carte blanche\' : créez une règle avant de commencer la partie.",
    ),
    "unoSpecialCardSwap": MessageLookupByLibrary.simpleMessage(
      "\'échange de mains\' : échangez vos mains avec n\'importe quel joueur et choisissez la couleur.",
    ),
    "unoSpecialRuleReshuffle": MessageLookupByLibrary.simpleMessage(
      "si la pioche est vide, mélangez la pile de défausse.",
    ),
    "unoSpecialRuleUnoCall": MessageLookupByLibrary.simpleMessage(
      "oublié de dire \'uno\' ? piochez 2 cartes si vous êtes pris avant le tour du joueur suivant.",
    ),
    "unoTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno® est une marque déposée de mattel.",
    ),
    "unoTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "si vous ne pouvez pas jouer, piochez une carte. si elle est jouable, vous pouvez la jouer immédiatement.",
    ),
    "unoTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "les joueurs jouent à tour de rôle une carte qui correspond à la carte du dessus par couleur, numéro ou symbole.",
    ),
    "unoTurnRuleOptionalDraw": MessageLookupByLibrary.simpleMessage(
      "les joueurs peuvent piocher une carte même s\'ils en ont une jouable, mais ils ne peuvent pas la jouer au même tour.",
    ),
    "unoVictory500Points": MessageLookupByLibrary.simpleMessage(
      "le premier joueur à atteindre 500 points gagne.",
    ),
    "unoVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "alternative : le joueur avec le score le plus bas gagne à la fin de la partie.",
    ),
    "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
      "améliorez une colonie en ville (+1 point)",
    ),
    "victoryPointCard": MessageLookupByLibrary.simpleMessage(
      "carte point de victoire",
    ),
    "victoryTitle": MessageLookupByLibrary.simpleMessage("victoire :"),
    "warrior": MessageLookupByLibrary.simpleMessage("guerrier"),
    "whoGoesFirst": MessageLookupByLibrary.simpleMessage(
      "qui distribue en premier ?",
    ),
    "wildCardOneDosInfo": MessageLookupByLibrary.simpleMessage("carte joker #"),
    "wildCardUnoInfo": MessageLookupByLibrary.simpleMessage("carte joker"),
    "wildDrawColorUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "joker piocher couleur",
    ),
    "wildDrawFourCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "carte joker plus quatre",
    ),
    "wildDrawTwoCardDosInfo": MessageLookupByLibrary.simpleMessage(
      "carte joker plus deux",
    ),
    "wildShuffleHandsCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "carte joker échange de mains",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("gagnant : "),
    "wizard": MessageLookupByLibrary.simpleMessage("magicien"),
    "wordIsTooLongMaximum15LettersAllowed":
        MessageLookupByLibrary.simpleMessage(
          "le mot est trop long. maximum 15 lettres autorisées",
        ),
    "wordModifier": MessageLookupByLibrary.simpleMessage(
      "modificateur de mot : ",
    ),
    "x2Word": MessageLookupByLibrary.simpleMessage("x2 mot"),
    "x3Word": MessageLookupByLibrary.simpleMessage("x3 mot"),
    "yes": MessageLookupByLibrary.simpleMessage("oui"),
    "youHaveAnUnfinishedGame": MessageLookupByLibrary.simpleMessage(
      "vous avez une partie en cours",
    ),
    "yourBet": MessageLookupByLibrary.simpleMessage("votre enchère"),
  };
}
