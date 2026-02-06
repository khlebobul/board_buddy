// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(playerName, winningBid) =>
      "did ${playerName} reach their bid (${winningBid} points)?";

  static String m1(count) =>
      "${Intl.plural(count, one: 'point', other: 'points')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("about"),
    "ace": MessageLookupByLibrary.simpleMessage("ace"),
    "ace11Points": MessageLookupByLibrary.simpleMessage("ace: 11 points"),
    "add": MessageLookupByLibrary.simpleMessage("add"),
    "addPlayer": MessageLookupByLibrary.simpleMessage("add player"),
    "adding": MessageLookupByLibrary.simpleMessage("adding"),
    "allowsThePlayerToChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "allows the player to choose the color.",
        ),
    "appreciation": MessageLookupByLibrary.simpleMessage("credits"),
    "armour": MessageLookupByLibrary.simpleMessage("armour"),
    "awardedToThePlayerWith3KnightCardsPlayed":
        MessageLookupByLibrary.simpleMessage(
          "awarded to the player with 3+ knight cards played",
        ),
    "awardedToThePlayerWith5ConnectedRoads":
        MessageLookupByLibrary.simpleMessage(
          "awarded to the player with 5+ connected roads",
        ),
    "back": MessageLookupByLibrary.simpleMessage("back"),
    "biddingPhase": MessageLookupByLibrary.simpleMessage("bidding phase:"),
    "bigArmour": MessageLookupByLibrary.simpleMessage("big armour"),
    "bigBoots": MessageLookupByLibrary.simpleMessage("big boots"),
    "bigHelmet": MessageLookupByLibrary.simpleMessage("big helmet"),
    "bigMagic": MessageLookupByLibrary.simpleMessage("big magic"),
    "bigSword": MessageLookupByLibrary.simpleMessage("big sword"),
    "bingo": MessageLookupByLibrary.simpleMessage("bingo"),
    "blankTile": MessageLookupByLibrary.simpleMessage("blank\ntile"),
    "boardBuddy": MessageLookupByLibrary.simpleMessage("board buddy"),
    "boardBuddyIsYourUltimateBoardGameCompanion":
        MessageLookupByLibrary.simpleMessage(
          "board buddy is your ultimate board game companion",
        ),
    "bonusTileOrSpecialMarkerScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("bonus tile or special marker"),
    "boots": MessageLookupByLibrary.simpleMessage("boots"),
    "buffsOrDebuffsAffectingCharactersitemsInfo":
        MessageLookupByLibrary.simpleMessage(
          "buffs or debuffs affecting characters/items",
        ),
    "buildANewSettlementOnAnIntersection": MessageLookupByLibrary.simpleMessage(
      "build a new settlement on an intersection",
    ),
    "buildingCosts": MessageLookupByLibrary.simpleMessage("building costs:"),
    "buildingRules": MessageLookupByLibrary.simpleMessage("building rules:"),
    "canBeAnyColorChosenByTheCurrentPlayerIfDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "can be any color chosen by the current player. if drawn, the player decides the color.",
        ),
    "canRepresentAnyNumberForItsOwnParticularColorDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "can represent any number for its own particular color.",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
    "cardTypesTitle": MessageLookupByLibrary.simpleMessage("types of cards:"),
    "catan": MessageLookupByLibrary.simpleMessage("catan"),
    "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
      "development card: 1 wool + 1 grain + 1 ore",
    ),
    "catanBuildingCostsOne": MessageLookupByLibrary.simpleMessage(
      "road: 1 lumber + 1 brick",
    ),
    "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
      "city (upgrade): 2 grain + 3 ore (2)",
    ),
    "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
      "settlement: 1 lumber + 1 brick + 1 wool + 1 grain (1)",
    ),
    "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
      "cities replace existing settlements",
    ),
    "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
      "roads must connect to your existing roads, settlements, or cities",
    ),
    "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
      "settlements must connect to your road network",
    ),
    "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
      "settlements must be at least 2 intersections away from any other settlement/city",
    ),
    "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
      "2 special cards: longest road, largest army",
    ),
    "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
      "95 resource cards (19 each: lumber, brick, wool, grain, ore)",
    ),
    "catanComponentsFour": MessageLookupByLibrary.simpleMessage(
      "18 number tokens",
    ),
    "catanComponentsNine": MessageLookupByLibrary.simpleMessage(
      "1 robber, 2 dice",
    ),
    "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
      "19 terrain hexes (4 forest, 4 grain, 4 pasture, 3 mountains, 3 hills, 1 desert)",
    ),
    "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
      "player pieces: 5 settlements, 4 cities, 15 roads per player",
    ),
    "catanComponentsSix": MessageLookupByLibrary.simpleMessage(
      "25 development cards",
    ),
    "catanComponentsThree": MessageLookupByLibrary.simpleMessage(
      "9 harbor pieces",
    ),
    "catanComponentsTwo": MessageLookupByLibrary.simpleMessage(
      "6 sea frame pieces",
    ),
    "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
      "monopoly (2): name a resource, all players give you theirs",
    ),
    "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
      "knight (14): move robber, steal 1 resource from adjacent player",
    ),
    "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
      "road building (2): build 2 roads for free",
    ),
    "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
      "victory point (5): worth 1, keep hidden until winning",
    ),
    "catanGameGoal": MessageLookupByLibrary.simpleMessage(
      "be the first player to reach 10 victory points by building settlements, cities, roads, and earning special cards.",
    ),
    "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
      "roll dice: all players with settlements/cities on hexes matching the number receive resources",
    ),
    "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
      "build: spend resources to construct roads, settlements, cities, or buy development cards",
    ),
    "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
      "trade: exchange resources with other players or use harbors (4:1 or special rates)",
    ),
    "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
      "each player places 2 settlements and 2 roads in reverse turn order",
    ),
    "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
      "assemble the board with terrain hexes inside the sea frame",
    ),
    "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
      "place the robber on the desert hex",
    ),
    "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "place number tokens on hexes (except desert)",
    ),
    "catanResourcesFive": MessageLookupByLibrary.simpleMessage(
      "mountains – ore",
    ),
    "catanResourcesFour": MessageLookupByLibrary.simpleMessage(
      "fields – grain (wheat)",
    ),
    "catanResourcesOne": MessageLookupByLibrary.simpleMessage(
      "forest – lumber (wood)",
    ),
    "catanResourcesSix": MessageLookupByLibrary.simpleMessage(
      "desert – no resources",
    ),
    "catanResourcesThree": MessageLookupByLibrary.simpleMessage(
      "pasture – wool (sheep)",
    ),
    "catanResourcesTwo": MessageLookupByLibrary.simpleMessage(
      "hills – brick (clay)",
    ),
    "catanScoringFive": MessageLookupByLibrary.simpleMessage(
      "victory point cards: 1 each",
    ),
    "catanScoringFour": MessageLookupByLibrary.simpleMessage("largest army: 2"),
    "catanScoringOne": MessageLookupByLibrary.simpleMessage("settlement: 1"),
    "catanScoringThree": MessageLookupByLibrary.simpleMessage(
      "longest road: 2",
    ),
    "catanScoringTwo": MessageLookupByLibrary.simpleMessage("city: 2"),
    "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
      "longest road: first player with 5+ continuous roads (can be stolen)",
    ),
    "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
      "largest army: first player with 3+ played knight cards (can be stolen)",
    ),
    "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
      "the blocked hex produces no resources while robber is there",
    ),
    "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
      "any player with more than 7 cards must discard half (rounded down)",
    ),
    "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
      "steal 1 random resource from a player with a settlement/city on that hex",
    ),
    "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
      "move the robber to any hex (except desert)",
    ),
    "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "catan® is a trademark of catan gmbh.",
    ),
    "catanTradingOne": MessageLookupByLibrary.simpleMessage(
      "domestic trade: negotiate any exchange with other players on your turn",
    ),
    "catanTradingThree": MessageLookupByLibrary.simpleMessage(
      "harbor trade: 3:1 generic or 2:1 specific resource harbors",
    ),
    "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
      "maritime trade: 4:1 with bank (any 4 same resources for 1)",
    ),
    "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
      "the first player to reach 10 victory points on their turn wins the game. you must announce your victory on your turn.",
    ),
    "changesTheColorAndForcesTheNextPlayerToDrawUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "changes the color and forces the next player to draw four cards.",
        ),
    "changesTheDirectionOfPlayUnoInfo": MessageLookupByLibrary.simpleMessage(
      "changes the direction of play.",
    ),
    "charactersGenderFemaleInfo": MessageLookupByLibrary.simpleMessage(
      "character\'s gender: female",
    ),
    "charactersGenderMaleInfo": MessageLookupByLibrary.simpleMessage(
      "character\'s gender: male",
    ),
    "checkMyWebsite": MessageLookupByLibrary.simpleMessage("check my website"),
    "city": MessageLookupByLibrary.simpleMessage("city"),
    "class1": MessageLookupByLibrary.simpleMessage("class 1"),
    "class2": MessageLookupByLibrary.simpleMessage("class 2"),
    "clear": MessageLookupByLibrary.simpleMessage("clear"),
    "clearance": MessageLookupByLibrary.simpleMessage("clearance"),
    "cleric": MessageLookupByLibrary.simpleMessage("cleric"),
    "close": MessageLookupByLibrary.simpleMessage("close"),
    "common": MessageLookupByLibrary.simpleMessage("counter"),
    "confirm": MessageLookupByLibrary.simpleMessage("confirm"),
    "continueGame": MessageLookupByLibrary.simpleMessage("continue game"),
    "continueTitle": MessageLookupByLibrary.simpleMessage("continue"),
    "contractResolution": MessageLookupByLibrary.simpleMessage(
      "contract resolution:",
    ),
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage("could not launch"),
    "currentBet": MessageLookupByLibrary.simpleMessage("current bet:"),
    "currentCount": MessageLookupByLibrary.simpleMessage("current count:"),
    "cursed": MessageLookupByLibrary.simpleMessage("cursed"),
    "dark": MessageLookupByLibrary.simpleMessage("dark"),
    "darkSideCardsAreReplacedWithLightOnesAndVice":
        MessageLookupByLibrary.simpleMessage(
          "dark side cards are replaced with light ones and vice versa.",
        ),
    "developmentCardWorth1VictoryPoint": MessageLookupByLibrary.simpleMessage(
      "development card worth 1 victory point",
    ),
    "developmentCards": MessageLookupByLibrary.simpleMessage(
      "development cards:",
    ),
    "didPlayerReachBid": m0,
    "didYouEnter": MessageLookupByLibrary.simpleMessage("did reach"),
    "doReturn": MessageLookupByLibrary.simpleMessage("return"),
    "dontHaveYourFavouriteGameEmailMe": MessageLookupByLibrary.simpleMessage(
      "don\'t have your favourite game? email me!",
    ),
    "dos": MessageLookupByLibrary.simpleMessage("dos"),
    "dosBonus": MessageLookupByLibrary.simpleMessage("bonuses:"),
    "dosBonusDoubleColorMatchDrawCard": MessageLookupByLibrary.simpleMessage(
      "double color match: all other players draw 1 card.",
    ),
    "dosBonusNumberColorMatchAddCard": MessageLookupByLibrary.simpleMessage(
      "bonuses:",
    ),
    "dosGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "play all your cards and score points from your opponents\' remaining cards. the first player to reach 200 points wins.",
    ),
    "dosGameObjectiveTitle": MessageLookupByLibrary.simpleMessage("objective:"),
    "dosPreparationCentralRow": MessageLookupByLibrary.simpleMessage(
      "place 2 cards in the \'center row\'",
    ),
    "dosPreparationDealCards": MessageLookupByLibrary.simpleMessage(
      "deal 7 cards to each player.",
    ),
    "dosPreparationDrawPile": MessageLookupByLibrary.simpleMessage(
      "put the rest of the deck next to it as the draw pile.",
    ),
    "dosScoring": MessageLookupByLibrary.simpleMessage("scoring:"),
    "dosScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "number cards: face value.",
    ),
    "dosScoringWildDos": MessageLookupByLibrary.simpleMessage(
      "\'wild dos\': 20 points.",
    ),
    "dosScoringWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'wild #\': 40 points.",
    ),
    "dosSpecialCardWildDos": MessageLookupByLibrary.simpleMessage(
      "\'wild dos\': substitutes for two cards of any color.",
    ),
    "dosSpecialCardWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'wild #\': substitutes for any number (1–10) of its color.",
    ),
    "dosSpecialRule": MessageLookupByLibrary.simpleMessage("special rule:"),
    "dosSpecialRuleDosCall": MessageLookupByLibrary.simpleMessage(
      "when you have 2 cards left, call \'dos!\' if you forget and are caught, draw 2 cards.",
    ),
    "dosTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "dos® is a registered trademark of mattel.",
    ),
    "dosTurnRuleDoubleMatch": MessageLookupByLibrary.simpleMessage(
      "double match: two cards add up to the number on a center row card.",
    ),
    "dosTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "if no match is possible, draw a card. if it matches, you can play it.",
    ),
    "dosTurnRuleEndTurn": MessageLookupByLibrary.simpleMessage(
      "at the end of your turn, refill the center row to 2 cards.",
    ),
    "dosTurnRulePickCards": MessageLookupByLibrary.simpleMessage(
      "players take turns matching cards from their hand to cards in the center row:",
    ),
    "dosTurnRuleSingleMatch": MessageLookupByLibrary.simpleMessage(
      "single match: a card matches by number.",
    ),
    "dosVictory200Points": MessageLookupByLibrary.simpleMessage(
      "the first player to reach 200 points wins.",
    ),
    "doublesTheValueOfALetterScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("doubles the value of a letter"),
    "doublesTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "doubles the value of an entire word",
        ),
    "drawFiveUnoFlipInfo": MessageLookupByLibrary.simpleMessage("draw five"),
    "drawOneUnoFlipInfo": MessageLookupByLibrary.simpleMessage("draw one"),
    "drawTwoCardUnoInfo": MessageLookupByLibrary.simpleMessage("draw two card"),
    "dwarf": MessageLookupByLibrary.simpleMessage("dwarf"),
    "eachCardHasANumberDeterminingItsValue":
        MessageLookupByLibrary.simpleMessage(
          "each card has a number, determining its value.",
        ),
    "eachCardHasANumberFrom0To9WhichUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "each card has a number from 0 to 9, which determines its value.",
        ),
    "eachCardHasANumberFrom1To9Which": MessageLookupByLibrary.simpleMessage(
      "each card has a number from 1 to 9, which determines its value.",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("edit"),
    "elf": MessageLookupByLibrary.simpleMessage("elf"),
    "emailCopied": MessageLookupByLibrary.simpleMessage("email copied"),
    "endGameTitle": MessageLookupByLibrary.simpleMessage("end of game:"),
    "english": MessageLookupByLibrary.simpleMessage("english"),
    "enterAWord": MessageLookupByLibrary.simpleMessage("enter a word"),
    "featureRequest": MessageLookupByLibrary.simpleMessage("feature request"),
    "finish": MessageLookupByLibrary.simpleMessage("finish"),
    "firstBonus": MessageLookupByLibrary.simpleMessage("first bonus"),
    "flipCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage("flip card"),
    "flipSide": MessageLookupByLibrary.simpleMessage("flip side"),
    "flipsAllCardsToTheOppositeSideUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "flips all cards to the opposite side.",
        ),
    "followMeOnXTwitter": MessageLookupByLibrary.simpleMessage(
      "follow me on x (twitter)",
    ),
    "french": MessageLookupByLibrary.simpleMessage("french"),
    "gameGoal": MessageLookupByLibrary.simpleMessage("game goal:"),
    "gameOver": MessageLookupByLibrary.simpleMessage("game over"),
    "gameTurnTitle": MessageLookupByLibrary.simpleMessage("game turn:"),
    "gameUpTo": MessageLookupByLibrary.simpleMessage("game up to: "),
    "games": MessageLookupByLibrary.simpleMessage("games"),
    "gear": MessageLookupByLibrary.simpleMessage("gear"),
    "german": MessageLookupByLibrary.simpleMessage("german"),
    "githubRepository": MessageLookupByLibrary.simpleMessage(
      "github repository",
    ),
    "halfBreed": MessageLookupByLibrary.simpleMessage("half breed"),
    "halfling": MessageLookupByLibrary.simpleMessage("halfling"),
    "headGear": MessageLookupByLibrary.simpleMessage("head gear"),
    "helmet": MessageLookupByLibrary.simpleMessage("helmet"),
    "heyMyNameIsGleb": MessageLookupByLibrary.simpleMessage(
      "hey! my name is gleb",
    ),
    "highestScoreWins": MessageLookupByLibrary.simpleMessage(
      "highest score wins",
    ),
    "human": MessageLookupByLibrary.simpleMessage("human"),
    "indicatesAnActiveCurse": MessageLookupByLibrary.simpleMessage(
      "indicates an active curse",
    ),
    "jack": MessageLookupByLibrary.simpleMessage("jack"),
    "jack2Points": MessageLookupByLibrary.simpleMessage("jack: 2 points"),
    "keepAwakeMode": MessageLookupByLibrary.simpleMessage("keep awake mode"),
    "king": MessageLookupByLibrary.simpleMessage("king"),
    "king4Points": MessageLookupByLibrary.simpleMessage("king: 4 points"),
    "languages": MessageLookupByLibrary.simpleMessage("languages"),
    "largestArmy": MessageLookupByLibrary.simpleMessage("largest army"),
    "leftHand": MessageLookupByLibrary.simpleMessage("left hand"),
    "letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour":
        MessageLookupByLibrary.simpleMessage(
          " lets you track scores and key moments effortlessly, keeping your focus on the game",
        ),
    "level": MessageLookupByLibrary.simpleMessage("level"),
    "light": MessageLookupByLibrary.simpleMessage("light"),
    "longestRoad": MessageLookupByLibrary.simpleMessage("longest road"),
    "lowestScoreWins": MessageLookupByLibrary.simpleMessage(
      "lowest score wins",
    ),
    "magic": MessageLookupByLibrary.simpleMessage("magic"),
    "mapGenerator": MessageLookupByLibrary.simpleMessage("map generator"),
    "marksADeadCharacterInfo": MessageLookupByLibrary.simpleMessage(
      "marks a dead character",
    ),
    "marriage": MessageLookupByLibrary.simpleMessage("marriage:"),
    "menu": MessageLookupByLibrary.simpleMessage("menu"),
    "mode": MessageLookupByLibrary.simpleMessage("mode"),
    "modifiers": MessageLookupByLibrary.simpleMessage("modifiers"),
    "moveHistory": MessageLookupByLibrary.simpleMessage("move history"),
    "multiplayer": MessageLookupByLibrary.simpleMessage("multiplayer"),
    "munchkin": MessageLookupByLibrary.simpleMessage("munchkin"),
    "munchkinCombatCompareLevels": MessageLookupByLibrary.simpleMessage(
      "compare your character\'s level (including bonuses) with the monster\'s level.",
    ),
    "munchkinCombatEscapeRules": MessageLookupByLibrary.simpleMessage(
      "if you fail to win, escape (roll a die). a roll of 5 or 6 succeeds. if you fail to escape, follow the consequences listed on the monster card.",
    ),
    "munchkinCombatHelpOrBoost": MessageLookupByLibrary.simpleMessage(
      "if your level is lower, you can: ask another player for help (negotiated) or use cards from your hand to boost yourself.",
    ),
    "munchkinCombatTitle": MessageLookupByLibrary.simpleMessage(
      "combat (if there\'s a monster):",
    ),
    "munchkinCombatWinCondition": MessageLookupByLibrary.simpleMessage(
      "if your level is equal to or higher, you win and gain treasures and a level.",
    ),
    "munchkinCurseEncounter": MessageLookupByLibrary.simpleMessage(
      "curse: immediately apply it to yourself.",
    ),
    "munchkinCursesCardType": MessageLookupByLibrary.simpleMessage(
      "curses — hinder your character or other players.",
    ),
    "munchkinDeathRules": MessageLookupByLibrary.simpleMessage(
      "death: you lose all cards except your level and races (or classes).",
    ),
    "munchkinEndTurnDiscardRules": MessageLookupByLibrary.simpleMessage(
      "at the end of your turn, discard excess cards if you have more than 5. give them to the player with the lowest level.",
    ),
    "munchkinEquipmentCardType": MessageLookupByLibrary.simpleMessage(
      "equipment — provides bonuses to your level during combat.",
    ),
    "munchkinGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "be the first to reach level 10 by fighting monsters, using equipment, curses, and abilities cards.",
    ),
    "munchkinInitialCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "each player takes: 4 cards from the door deck and 4 cards from the treasure deck.",
    ),
    "munchkinLevel10Condition": MessageLookupByLibrary.simpleMessage(
      "level 10: the final level can only be achieved by defeating a monster.",
    ),
    "munchkinMonsterEncounter": MessageLookupByLibrary.simpleMessage(
      "monster: fight it (see \'combat\').",
    ),
    "munchkinMonsterEnhancersCardType": MessageLookupByLibrary.simpleMessage(
      "monster enhancers — increase the monster\'s strength.",
    ),
    "munchkinMonsterVictoryReward": MessageLookupByLibrary.simpleMessage(
      "monster victory: defeating a monster grants you a level and treasures.",
    ),
    "munchkinMonstersCardType": MessageLookupByLibrary.simpleMessage(
      "monsters — fight them to level up.",
    ),
    "munchkinNoMonsterActionsDescription": MessageLookupByLibrary.simpleMessage(
      "play a monster from their hand to fight (optional) or go \'looking for trouble\' (draw a card from the door deck into their hand).",
    ),
    "munchkinNoMonsterActionsTitle": MessageLookupByLibrary.simpleMessage(
      "if there\'s no monster, the player can:",
    ),
    "munchkinOneTimeItemsCardType": MessageLookupByLibrary.simpleMessage(
      "one-time-use items — used in combat or for other effects.",
    ),
    "munchkinOtherCardEncounter": MessageLookupByLibrary.simpleMessage(
      "any other card: keep it in your hand.",
    ),
    "munchkinShuffleCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "shuffle the door and treasure cards and divide them into two separate decks.",
    ),
    "munchkinStartingGearInstruction": MessageLookupByLibrary.simpleMessage(
      "players place their starting equipment cards on the table, if they have any.",
    ),
    "munchkinTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "munchkin® is a registered trademark of steve jackson games.",
    ),
    "munchkinTurnDescription": MessageLookupByLibrary.simpleMessage(
      "the player draws the top card from the door deck. possible outcomes:",
    ),
    "munchkinVictoryCondition": MessageLookupByLibrary.simpleMessage(
      "the first player to reach level 10 wins!",
    ),
    "myOtherApps": MessageLookupByLibrary.simpleMessage("my other apps"),
    "nWord": MessageLookupByLibrary.simpleMessage("\nword"),
    "name": MessageLookupByLibrary.simpleMessage("name"),
    "newGame": MessageLookupByLibrary.simpleMessage("new game"),
    "newGameWithSamePlayers": MessageLookupByLibrary.simpleMessage(
      "another round",
    ),
    "nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "next player draws 1 card and skips turn.",
        ),
    "nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "next player draws 5 cards and skips turn.",
        ),
    "nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "next player draws two cards and loses their turn.",
        ),
    "nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "next player draws until they get the chosen color.",
        ),
    "nine0Points": MessageLookupByLibrary.simpleMessage("nine: 0 points"),
    "no": MessageLookupByLibrary.simpleMessage("no"),
    "noClass": MessageLookupByLibrary.simpleMessage("no class"),
    "noItem": MessageLookupByLibrary.simpleMessage("no item"),
    "numberCards": MessageLookupByLibrary.simpleMessage("number cards"),
    "off": MessageLookupByLibrary.simpleMessage("off"),
    "on": MessageLookupByLibrary.simpleMessage("on"),
    "options": MessageLookupByLibrary.simpleMessage("options"),
    "others": MessageLookupByLibrary.simpleMessage("others"),
    "pass": MessageLookupByLibrary.simpleMessage("pass"),
    "play": MessageLookupByLibrary.simpleMessage("play"),
    "playerName": MessageLookupByLibrary.simpleMessage("player name"),
    "playerOnBarrel": MessageLookupByLibrary.simpleMessage("player on barrel:"),
    "players": MessageLookupByLibrary.simpleMessage("players"),
    "playersOnBarrel": MessageLookupByLibrary.simpleMessage(
      "players on barrel:",
    ),
    "points": MessageLookupByLibrary.simpleMessage("points"),
    "pointsConfirmed": MessageLookupByLibrary.simpleMessage("points confirmed"),
    "pointsCount": m1,
    "possiblyTheRemovalOfCursesOrDebuffs": MessageLookupByLibrary.simpleMessage(
      "possibly the removal of curses or debuffs",
    ),
    "preparation": MessageLookupByLibrary.simpleMessage("preparation:"),
    "projectWebsite": MessageLookupByLibrary.simpleMessage("project website"),
    "queen": MessageLookupByLibrary.simpleMessage("queen"),
    "queen3Points": MessageLookupByLibrary.simpleMessage("queen: 3 points"),
    "race1": MessageLookupByLibrary.simpleMessage("race 1"),
    "rateTheApp": MessageLookupByLibrary.simpleMessage("rate the app"),
    "reportABug": MessageLookupByLibrary.simpleMessage("report a bug"),
    "resources": MessageLookupByLibrary.simpleMessage("resources:"),
    "results": MessageLookupByLibrary.simpleMessage("results"),
    "returnToMenu": MessageLookupByLibrary.simpleMessage("return to menu"),
    "reverseCardUnoInfo": MessageLookupByLibrary.simpleMessage("reverse card"),
    "rightHand": MessageLookupByLibrary.simpleMessage("right hand"),
    "rollDiceLocale": MessageLookupByLibrary.simpleMessage("roll dice"),
    "round": MessageLookupByLibrary.simpleMessage("round"),
    "rules": MessageLookupByLibrary.simpleMessage("rules"),
    "russian": MessageLookupByLibrary.simpleMessage("russian"),
    "score": MessageLookupByLibrary.simpleMessage("score"),
    "score50ExtraPointsForUsingAll7Tiles": MessageLookupByLibrary.simpleMessage(
      "score 50 extra points for using all 7 tiles",
    ),
    "scrabble": MessageLookupByLibrary.simpleMessage("scrabble"),
    "scrabbleAdditionalDisputedWords": MessageLookupByLibrary.simpleMessage(
      "challenged words are checked in an agreed-upon dictionary.",
    ),
    "scrabbleAdditionalPointsTitle": MessageLookupByLibrary.simpleMessage(
      "additional rules:",
    ),
    "scrabbleAdditionalReplaceTiles": MessageLookupByLibrary.simpleMessage(
      "players may swap tiles and pass their turn.",
    ),
    "scrabbleAdditionalWordRules": MessageLookupByLibrary.simpleMessage(
      "all words must be complete and adhere to language rules.",
    ),
    "scrabbleEndGameNoTiles": MessageLookupByLibrary.simpleMessage(
      "the game ends when there are no tiles left and no moves can be made.",
    ),
    "scrabbleEndGameRemainingTilesPenalty":
        MessageLookupByLibrary.simpleMessage(
          "unplayed tiles are subtracted from the player\'s score.",
        ),
    "scrabbleEndGameSkippedTurns": MessageLookupByLibrary.simpleMessage(
      "the game ends if all players pass their turns twice.",
    ),
    "scrabbleFeatureBlankTile": MessageLookupByLibrary.simpleMessage(
      "blank tiles can represent any letter but score no points.",
    ),
    "scrabbleFeatureRefillTiles": MessageLookupByLibrary.simpleMessage(
      "players draw tiles after each turn to refill their racks to 7.",
    ),
    "scrabbleFeatureSevenTileBonus": MessageLookupByLibrary.simpleMessage(
      "using all 7 tiles in a turn earns a 50-point bonus.",
    ),
    "scrabbleFeaturesTitle": MessageLookupByLibrary.simpleMessage("features:"),
    "scrabbleGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "form words on the board crossword-style. score more points than your opponents.",
    ),
    "scrabbleGameSetAccessories": MessageLookupByLibrary.simpleMessage(
      "4 racks, tile bag.",
    ),
    "scrabbleGameSetBoard": MessageLookupByLibrary.simpleMessage(
      "15x15 board.",
    ),
    "scrabbleGameSetLetters": MessageLookupByLibrary.simpleMessage(
      "104 tiles (including 2 blanks).",
    ),
    "scrabbleGameSetTitle": MessageLookupByLibrary.simpleMessage("game set:"),
    "scrabblePreparationDrawTiles": MessageLookupByLibrary.simpleMessage(
      "each player draws 7 tiles.",
    ),
    "scrabblePreparationFirstTurnRule": MessageLookupByLibrary.simpleMessage(
      "the first turn goes to the player whose randomly drawn tile is closest to the start of the alphabet.",
    ),
    "scrabblePreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "shuffle the tiles in the bag.",
    ),
    "scrabbleScoringBlueBonus": MessageLookupByLibrary.simpleMessage(
      "blue spaces double/triple the letter score.",
    ),
    "scrabbleScoringRedBonus": MessageLookupByLibrary.simpleMessage(
      "red spaces double/triple the word score.",
    ),
    "scrabbleScoringTitle": MessageLookupByLibrary.simpleMessage("scoring:"),
    "scrabbleScoringWordPoints": MessageLookupByLibrary.simpleMessage(
      "points for a word: sum of tile points + bonuses from board spaces.",
    ),
    "scrabbleTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "scrabble® is a registered trademark of hasbro, inc.",
    ),
    "scrabbleTurnRuleFirstWord": MessageLookupByLibrary.simpleMessage(
      "first word: must pass through the center square (star).",
    ),
    "scrabbleTurnRuleLetterPlacement": MessageLookupByLibrary.simpleMessage(
      "each new tile must form part of a new or existing word.",
    ),
    "scrabbleTurnRuleWordDirection": MessageLookupByLibrary.simpleMessage(
      "all words must be placed horizontally or vertically.",
    ),
    "scrabbleTurnRulesTitle": MessageLookupByLibrary.simpleMessage(
      "turn rules:",
    ),
    "seaSaltPaper": MessageLookupByLibrary.simpleMessage("sea salt & paper"),
    "seaSaltPaperDuoBoat": MessageLookupByLibrary.simpleMessage(
      "boat duo: take another turn immediately.",
    ),
    "seaSaltPaperDuoCardsDescription": MessageLookupByLibrary.simpleMessage(
      "after your action, you may play matching pairs to trigger special effects:",
    ),
    "seaSaltPaperDuoCardsTitle": MessageLookupByLibrary.simpleMessage(
      "duo cards:",
    ),
    "seaSaltPaperDuoCrab": MessageLookupByLibrary.simpleMessage(
      "crab duo: look through one discard pile and take any card.",
    ),
    "seaSaltPaperDuoFish": MessageLookupByLibrary.simpleMessage(
      "fish duo: draw the top card from the deck.",
    ),
    "seaSaltPaperDuoShark": MessageLookupByLibrary.simpleMessage(
      "shark + swimmer duo: steal one card from an opponent\'s hand.",
    ),
    "seaSaltPaperEndRoundDescription": MessageLookupByLibrary.simpleMessage(
      "when you have 7 or more points, you may end the round by choosing:",
    ),
    "seaSaltPaperEndRoundTitle": MessageLookupByLibrary.simpleMessage(
      "ending the round:",
    ),
    "seaSaltPaperGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "collect cards to form combinations and score points. be the first to reach the target score by strategically ending rounds.",
    ),
    "seaSaltPaperLastChanceOption": MessageLookupByLibrary.simpleMessage(
      "last chance: each opponent gets one more turn. if you still have the highest score, gain bonus points equal to your color majority. if someone beats you, you only score your color majority.",
    ),
    "seaSaltPaperPreparationDiscard": MessageLookupByLibrary.simpleMessage(
      "flip two cards face-up next to the deck to form two discard piles.",
    ),
    "seaSaltPaperPreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "shuffle all cards and place the deck face down in the center.",
    ),
    "seaSaltPaperPreparationStartPlayer": MessageLookupByLibrary.simpleMessage(
      "choose a starting player.",
    ),
    "seaSaltPaperScoringCollections": MessageLookupByLibrary.simpleMessage(
      "collections (shells, penguins, octopuses) score more with more cards.",
    ),
    "seaSaltPaperScoringColorMajority": MessageLookupByLibrary.simpleMessage(
      "color majority: 1 bonus point per card of your most common color.",
    ),
    "seaSaltPaperScoringMermaid": MessageLookupByLibrary.simpleMessage(
      "mermaid: collecting all 4 mermaid cards wins the game instantly!",
    ),
    "seaSaltPaperScoringPairs": MessageLookupByLibrary.simpleMessage(
      "pairs and combinations score points based on their type.",
    ),
    "seaSaltPaperScoringTitle": MessageLookupByLibrary.simpleMessage(
      "scoring:",
    ),
    "seaSaltPaperStopOption": MessageLookupByLibrary.simpleMessage(
      "stop: the round ends immediately. all players score their cards.",
    ),
    "seaSaltPaperTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "sea salt & paper® is a trademark of studio bombyx. designed by bruno cathala and théo rivière.",
    ),
    "seaSaltPaperTurnDescription": MessageLookupByLibrary.simpleMessage(
      "on your turn, choose one of two actions:",
    ),
    "seaSaltPaperTurnDrawTwo": MessageLookupByLibrary.simpleMessage(
      "draw two cards from the deck, keep one, and place the other face-up on a discard pile.",
    ),
    "seaSaltPaperTurnTakeDiscard": MessageLookupByLibrary.simpleMessage(
      "take the top card from one of the discard piles.",
    ),
    "seaSaltPaperVictory2Players": MessageLookupByLibrary.simpleMessage(
      "2 players: first to 40 points wins.",
    ),
    "seaSaltPaperVictory3Players": MessageLookupByLibrary.simpleMessage(
      "3 players: first to 35 points wins.",
    ),
    "seaSaltPaperVictory4Players": MessageLookupByLibrary.simpleMessage(
      "4 players: first to 30 points wins.",
    ),
    "secondBonus": MessageLookupByLibrary.simpleMessage("second bonus"),
    "secondRace": MessageLookupByLibrary.simpleMessage("race 2"),
    "set": MessageLookupByLibrary.simpleMessage("set"),
    "setCardAttributeFillType": MessageLookupByLibrary.simpleMessage(
      "fill type: empty, striped, solid.",
    ),
    "setCardAttributeNumberOfSymbols": MessageLookupByLibrary.simpleMessage(
      "number of symbols: 1, 2, or 3.",
    ),
    "setCardAttributeSymbolColor": MessageLookupByLibrary.simpleMessage(
      "symbol color: red, green, purple.",
    ),
    "setCardAttributeSymbolType": MessageLookupByLibrary.simpleMessage(
      "symbol type: oval, diamond, wave.",
    ),
    "setCardAttributesDescription": MessageLookupByLibrary.simpleMessage(
      "each card is unique and has 4 attributes:",
    ),
    "setCardAttributesTitle": MessageLookupByLibrary.simpleMessage(
      "card attributes:",
    ),
    "setExampleOfValidSetColor": MessageLookupByLibrary.simpleMessage(
      "attribute \'number\': same (two).",
    ),
    "setExampleOfValidSetFill": MessageLookupByLibrary.simpleMessage(
      "what to do if no set is found:",
    ),
    "setExampleOfValidSetNumber": MessageLookupByLibrary.simpleMessage(
      "attribute \'type\': different (oval, diamond, wave).",
    ),
    "setExampleOfValidSetTitle": MessageLookupByLibrary.simpleMessage(
      "attribute \'color\': different (red, green, purple).",
    ),
    "setExampleOfValidSetType": MessageLookupByLibrary.simpleMessage(
      "attribute \'fill\': same (striped).",
    ),
    "setGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "find a set (a group of 3 cards) where each attribute is either the same across all cards or different on all cards.",
    ),
    "setGameTurnStepContinue": MessageLookupByLibrary.simpleMessage(
      "example of a correct set:",
    ),
    "setGameTurnStepDealerSetup": MessageLookupByLibrary.simpleMessage(
      "the dealer places 12 cards.",
    ),
    "setGameTurnStepFindingSet": MessageLookupByLibrary.simpleMessage(
      "players simultaneously search for a set. the first to find one calls out: \'set!\'",
    ),
    "setGameTurnStepFour": MessageLookupByLibrary.simpleMessage(
      "the game continues.",
    ),
    "setGameTurnStepValidation": MessageLookupByLibrary.simpleMessage(
      "validate correctness: if correct, the player takes the cards, and the dealer replaces them with 3 new ones. if incorrect, the player loses 1 point or skips a turn (as agreed).",
    ),
    "setImportantRuleCardPosition": MessageLookupByLibrary.simpleMessage(
      "cards forming a set can be arranged in any order.",
    ),
    "setImportantRuleConfirmation": MessageLookupByLibrary.simpleMessage(
      "a new set cannot be declared until the previous one is confirmed.",
    ),
    "setImportantRuleSimplifiedMode": MessageLookupByLibrary.simpleMessage(
      "for learning, the game can be simplified by using only 3 attributes.",
    ),
    "setImportantRulesTitle": MessageLookupByLibrary.simpleMessage(
      "important rules:",
    ),
    "setNoSetFoundDescription": MessageLookupByLibrary.simpleMessage(
      "if no set exists among the 12 cards, the dealer adds 3 cards (up to a maximum of 21 cards). among 21 cards, a set always exists.",
    ),
    "setNoSetFoundTitle": MessageLookupByLibrary.simpleMessage(
      "what to do if no set is found:",
    ),
    "setScoringGameEnd": MessageLookupByLibrary.simpleMessage(
      "the game ends when the deck runs out or a predefined point total is reached.",
    ),
    "setScoringPointPerSet": MessageLookupByLibrary.simpleMessage(
      "1 point per found set.",
    ),
    "setScoringTitle": MessageLookupByLibrary.simpleMessage("scoring:"),
    "setTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "set® is a registered trademark of set enterprises, inc.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("settings"),
    "settlement": MessageLookupByLibrary.simpleMessage("settlement"),
    "shareFeedback": MessageLookupByLibrary.simpleMessage("share feedback"),
    "shareWithFriedns": MessageLookupByLibrary.simpleMessage(
      "share with friedns",
    ),
    "shareWithFriends": MessageLookupByLibrary.simpleMessage(
      "share with friends",
    ),
    "sinceThisIsAnOpenSourceProjectYouCanLeave":
        MessageLookupByLibrary.simpleMessage(
          "since this is an open-source project, feel free to contribute to it",
        ),
    "singleplayer": MessageLookupByLibrary.simpleMessage("singleplayer"),
    "skip": MessageLookupByLibrary.simpleMessage("skip"),
    "skipCardUnoInfo": MessageLookupByLibrary.simpleMessage("skip card"),
    "skipEveryoneCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "skip everyone card",
    ),
    "skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "skips all players and returns turn to the original player.",
        ),
    "skipsTheNextPlayersTurnUnoInfo": MessageLookupByLibrary.simpleMessage(
      "skips the next player\'s turn.",
    ),
    "spanish": MessageLookupByLibrary.simpleMessage("spanish"),
    "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
      "special cards (2 each):",
    ),
    "specialCardsTitle": MessageLookupByLibrary.simpleMessage("special cards:"),
    "specialRulesTitle": MessageLookupByLibrary.simpleMessage("special rules:"),
    "subtracting": MessageLookupByLibrary.simpleMessage("subtracting"),
    "superMunch": MessageLookupByLibrary.simpleMessage("super munch."),
    "swapHandsWithAnyPlayerAndChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "swap hands with any player and choose the color.",
        ),
    "sword": MessageLookupByLibrary.simpleMessage("sword"),
    "telegram": MessageLookupByLibrary.simpleMessage("telegram"),
    "ten10Points": MessageLookupByLibrary.simpleMessage("ten: 10 points"),
    "theNumberOfPlayersShouldBe": MessageLookupByLibrary.simpleMessage(
      "the number of players should be",
    ),
    "theRobberRolling7": MessageLookupByLibrary.simpleMessage(
      "the robber (rolling 7):",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("theme"),
    "thief": MessageLookupByLibrary.simpleMessage("thief"),
    "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
      "starting with the player after the dealer, players bid on how many points they think they can score (minimum bid is 100). each bid must be higher than the previous bid (in increments of 5 or 10).",
    ),
    "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
      "the player with the highest bid wins the auction, takes the talon, and declares trump suit. the bidder discards 3 cards face down (but keeps their point value).",
    ),
    "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
      "players can pass if they don\'t want to bid higher.",
    ),
    "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
      "if the bidder scores at least their bid amount: they add their actual score to their total.",
    ),
    "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
      "other players add the points from tricks they won to their totals.",
    ),
    "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
      "if the bidder fails to meet their bid: their bid amount is subtracted from their total (they can go negative).",
    ),
    "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
      "the bidder leads the first trick by playing any card. other players must follow suit if possible. if they cannot, they must play a trump card if they have one.",
    ),
    "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
      "the winner of the trick leads the next trick. continue until all cards are played.",
    ),
    "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
      "the highest card of the led suit wins, unless a trump is played. the highest trump wins.",
    ),
    "thousandGoal": MessageLookupByLibrary.simpleMessage(
      "the goal is to be the first player to reach 1000 points by winning tricks in a bidding game. players bid on how many points they can score, then try to fulfill their contract.",
    ),
    "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
      "you can only score marriages if you win at least one trick.",
    ),
    "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
      "a marriage is a king and queen of the same suit in your hand.",
    ),
    "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
      "non-trump marriage: 80 points (same rule applies).",
    ),
    "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
      "trump marriage: 100 points (must be declared when playing the first card of the pair).",
    ),
    "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
      "use a 24-card deck: 9, 10, jack, queen, king, ace of all four suits.",
    ),
    "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
      "place 3 cards face down in the center as the talon (widow).",
    ),
    "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "deal 7 cards to each player (for 3 players), or 8 cards (for 2 players).",
    ),
    "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
      "barrel rule: if a player reaches 880+ points, they are \"on the barrel\" and must score exactly to 1000, or else drop back to 880.",
    ),
    "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
      "some variants require exactly 1000 points to win. going over resets you to 880 or previous score.",
    ),
    "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
      "total points in deck: 120. add marriage bonuses if applicable.",
    ),
    "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
      "the first player to reach 1000 points (or exactly 1000, depending on house rules) wins the game.",
    ),
    "toAllWhoCreatedThe": MessageLookupByLibrary.simpleMessage(
      "thanks to everyone who created",
    ),
    "toBoardBuddysContributors": MessageLookupByLibrary.simpleMessage(
      "board buddy\'s contributors",
    ),
    "total": MessageLookupByLibrary.simpleMessage("total"),
    "totalStrength": MessageLookupByLibrary.simpleMessage("total strength: "),
    "trading": MessageLookupByLibrary.simpleMessage("trading:"),
    "tripleTheValueOfALetterScrabbleInfo": MessageLookupByLibrary.simpleMessage(
      "triple the value of a letter",
    ),
    "tripleTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "triple the value of an entire word",
        ),
    "twoHanded": MessageLookupByLibrary.simpleMessage("two handed"),
    "uno": MessageLookupByLibrary.simpleMessage("uno"),
    "unoActiveCardDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'draw two\': the next player draws 2 cards and loses their turn.",
    ),
    "unoActiveCardReverse": MessageLookupByLibrary.simpleMessage(
      "\'reverse\': reverses the direction of play.",
    ),
    "unoActiveCardSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'skip\': the next player loses their turn.",
    ),
    "unoActiveCardWild": MessageLookupByLibrary.simpleMessage(
      "\'wild\': allows you to choose the color of play.",
    ),
    "unoActiveCardWildDrawFour": MessageLookupByLibrary.simpleMessage(
      "\'wild draw four\': choose the color, and the next player draws 4 cards. you can only play it if you have no matching cards.",
    ),
    "unoActiveCardsTitle": MessageLookupByLibrary.simpleMessage(
      "action cards:",
    ),
    "unoFlip": MessageLookupByLibrary.simpleMessage("uno flip"),
    "unoFlipDarkSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "dark side:",
    ),
    "unoFlipDarkSideDrawFive": MessageLookupByLibrary.simpleMessage(
      "\'draw five\'",
    ),
    "unoFlipDarkSideDrawUntilColor": MessageLookupByLibrary.simpleMessage(
      "\'draw until matching color\'",
    ),
    "unoFlipDarkSideReverse": MessageLookupByLibrary.simpleMessage(
      "\'reverse\'",
    ),
    "unoFlipDarkSideSkipAll": MessageLookupByLibrary.simpleMessage(
      "\'skip all\'",
    ),
    "unoFlipDarkSideWildCard": MessageLookupByLibrary.simpleMessage("\'wild\'"),
    "unoFlipGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "play all your cards and score points from your opponents\' remaining cards. the first player to reach 500 points wins.",
    ),
    "unoFlipGameStartDealCards": MessageLookupByLibrary.simpleMessage(
      "each player receives 7 cards.",
    ),
    "unoFlipGameStartLightSide": MessageLookupByLibrary.simpleMessage(
      "start the game on the light side of the deck.",
    ),
    "unoFlipGameStartTitle": MessageLookupByLibrary.simpleMessage(
      "game start:",
    ),
    "unoFlipKeyMoment": MessageLookupByLibrary.simpleMessage("key moments:"),
    "unoFlipKeyMomentFlipCardEffect": MessageLookupByLibrary.simpleMessage(
      "after a \'flip\' card, the entire game switches sides.",
    ),
    "unoFlipKeyMomentUnoCall": MessageLookupByLibrary.simpleMessage(
      "when playing your second-to-last card, call \'uno!\' if you forget and are caught, draw 2 cards.",
    ),
    "unoFlipLightSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "light side:",
    ),
    "unoFlipLightSideDrawOne": MessageLookupByLibrary.simpleMessage(
      "\'draw one\'",
    ),
    "unoFlipLightSideReverse": MessageLookupByLibrary.simpleMessage(
      "\'reverse\'",
    ),
    "unoFlipLightSideSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'skip turn\'",
    ),
    "unoFlipLightSideWildCard": MessageLookupByLibrary.simpleMessage(
      "\'wild\'",
    ),
    "unoFlipLightSideWildDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'wild draw two\'",
    ),
    "unoFlipScoringActiveCards": MessageLookupByLibrary.simpleMessage(
      "action cards: 20–60 points depending on type.",
    ),
    "unoFlipScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "number cards: face value.",
    ),
    "unoFlipScoringRoundWinnerPoints": MessageLookupByLibrary.simpleMessage(
      "round winner scores points for opponents\' remaining cards:",
    ),
    "unoFlipScoringTitle": MessageLookupByLibrary.simpleMessage("scoring:"),
    "unoFlipTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno flip® is a registered trademark of mattel.",
    ),
    "unoFlipTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "if no matching card is available, draw from the pile.",
    ),
    "unoFlipTurnRuleFlipCard": MessageLookupByLibrary.simpleMessage(
      "\'flip\' card switches the game to the other side of the deck.",
    ),
    "unoFlipTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "play a card matching the top card by color, number, or symbol.",
    ),
    "unoFlipVictory500Points": MessageLookupByLibrary.simpleMessage(
      "the first player to reach 500 points wins.",
    ),
    "unoFlipVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "alternative: the player with the lowest score wins after the game ends.",
    ),
    "unoGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "be the first to play all your cards and score points from your opponents\' remaining cards. the first player to reach 500 points wins.",
    ),
    "unoGameTurnTitle": MessageLookupByLibrary.simpleMessage(
      "players take turns playing a card that matches the top card by color, number, or symbol.",
    ),
    "unoPreparationDeckInCenter": MessageLookupByLibrary.simpleMessage(
      "place the remaining deck in the center as the draw pile.",
    ),
    "unoPreparationDistributeCards": MessageLookupByLibrary.simpleMessage(
      "deal 7 cards to each player.",
    ),
    "unoPreparationFlipFirstCard": MessageLookupByLibrary.simpleMessage(
      "flip the top card to start the discard pile.",
    ),
    "unoScoring20PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'skip\', \'draw two\', \'reverse\': 20 points.",
    ),
    "unoScoring40PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'swap hands\', \'blank card\': 40 points.",
    ),
    "unoScoring50PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'wild\', \'wild draw four\': 50 points.",
    ),
    "unoScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "number cards: face value.",
    ),
    "unoScoringTitle": MessageLookupByLibrary.simpleMessage("scoring:"),
    "unoSpecialCardBlank": MessageLookupByLibrary.simpleMessage(
      "\'blank card\': make a rule before starting the game.",
    ),
    "unoSpecialCardSwap": MessageLookupByLibrary.simpleMessage(
      "\'swap hands\': swap hands with any player and choose the color.",
    ),
    "unoSpecialRuleReshuffle": MessageLookupByLibrary.simpleMessage(
      "if the draw pile is empty, reshuffle the discard pile.",
    ),
    "unoSpecialRuleUnoCall": MessageLookupByLibrary.simpleMessage(
      "forget to say \'uno\'? draw 2 cards if caught before the next player\'s turn.",
    ),
    "unoTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno® is a registered trademark of mattel.",
    ),
    "unoTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "if you can\'t play, draw a card. if it\'s playable, you can play it immediately.",
    ),
    "unoTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "players take turns playing a card that matches the top card by color, number, or symbol.",
    ),
    "unoTurnRuleOptionalDraw": MessageLookupByLibrary.simpleMessage(
      "players may draw a card even if they have a playable one, but they can\'t play it on the same turn.",
    ),
    "unoVictory500Points": MessageLookupByLibrary.simpleMessage(
      "the first player to reach 500 points wins.",
    ),
    "unoVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "alternative: the player with the lowest score wins after the game ends.",
    ),
    "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
      "upgrade a settlement to a city (+1 point)",
    ),
    "victoryPointCard": MessageLookupByLibrary.simpleMessage(
      "victory point card",
    ),
    "victoryTitle": MessageLookupByLibrary.simpleMessage("victory:"),
    "warrior": MessageLookupByLibrary.simpleMessage("warrior"),
    "whoGoesFirst": MessageLookupByLibrary.simpleMessage("who deals first?"),
    "wildCardOneDosInfo": MessageLookupByLibrary.simpleMessage("wild # card"),
    "wildCardUnoInfo": MessageLookupByLibrary.simpleMessage("wild card"),
    "wildDrawColorUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "wild draw color",
    ),
    "wildDrawFourCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "wild draw four card",
    ),
    "wildDrawTwoCardDosInfo": MessageLookupByLibrary.simpleMessage(
      "wild draw two card",
    ),
    "wildShuffleHandsCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "wild shuffle hands card",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("winner: "),
    "wizard": MessageLookupByLibrary.simpleMessage("wizard"),
    "wordIsTooLongMaximum15LettersAllowed":
        MessageLookupByLibrary.simpleMessage(
          "word is too long. maximum 15 letters allowed",
        ),
    "wordModifier": MessageLookupByLibrary.simpleMessage("word modifier: "),
    "x2Word": MessageLookupByLibrary.simpleMessage("x2 wd"),
    "x3Word": MessageLookupByLibrary.simpleMessage("x3 wd"),
    "yes": MessageLookupByLibrary.simpleMessage("yes"),
    "youHaveAnUnfinishedGame": MessageLookupByLibrary.simpleMessage(
      "you have an unfinished game",
    ),
    "yourBet": MessageLookupByLibrary.simpleMessage("your bet"),
  };
}
