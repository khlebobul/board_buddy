// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `board buddy`
  String get boardBuddy {
    return Intl.message(
      'board buddy',
      name: 'boardBuddy',
      desc: '',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `games`
  String get games {
    return Intl.message(
      'games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `rules`
  String get rules {
    return Intl.message(
      'rules',
      name: 'rules',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `check my website`
  String get checkMyWebsite {
    return Intl.message(
      'check my website',
      name: 'checkMyWebsite',
      desc: '',
      args: [],
    );
  }

  /// `follow me on x (twitter)`
  String get followMeOnXTwitter {
    return Intl.message(
      'follow me on x (twitter)',
      name: 'followMeOnXTwitter',
      desc: '',
      args: [],
    );
  }

  /// `github repository`
  String get githubRepository {
    return Intl.message(
      'github repository',
      name: 'githubRepository',
      desc: '',
      args: [],
    );
  }

  /// `since this is an open-source project, feel free to contribute to it`
  String get sinceThisIsAnOpenSourceProjectYouCanLeave {
    return Intl.message(
      'since this is an open-source project, feel free to contribute to it',
      name: 'sinceThisIsAnOpenSourceProjectYouCanLeave',
      desc: '',
      args: [],
    );
  }

  /// `don't have your favourite game? email me!`
  String get dontHaveYourFavouriteGameEmailMe {
    return Intl.message(
      'don\'t have your favourite game? email me!',
      name: 'dontHaveYourFavouriteGameEmailMe',
      desc: '',
      args: [],
    );
  }

  /// `telegram`
  String get telegram {
    return Intl.message(
      'telegram',
      name: 'telegram',
      desc: '',
      args: [],
    );
  }

  /// `project website`
  String get projectWebsite {
    return Intl.message(
      'project website',
      name: 'projectWebsite',
      desc: '',
      args: [],
    );
  }

  /// `rate the app`
  String get rateTheApp {
    return Intl.message(
      'rate the app',
      name: 'rateTheApp',
      desc: '',
      args: [],
    );
  }

  /// `share with friends`
  String get shareWithFriends {
    return Intl.message(
      'share with friends',
      name: 'shareWithFriends',
      desc: '',
      args: [],
    );
  }

  /// ` lets you track scores and key moments effortlessly, keeping your focus on the game`
  String get letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour {
    return Intl.message(
      ' lets you track scores and key moments effortlessly, keeping your focus on the game',
      name: 'letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour',
      desc: '',
      args: [],
    );
  }

  /// `hey! my name is gleb`
  String get heyMyNameIsGleb {
    return Intl.message(
      'hey! my name is gleb',
      name: 'heyMyNameIsGleb',
      desc: '',
      args: [],
    );
  }

  /// `email copied`
  String get emailCopied {
    return Intl.message(
      'email copied',
      name: 'emailCopied',
      desc: '',
      args: [],
    );
  }

  /// `languages`
  String get languages {
    return Intl.message(
      'languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `report a bug`
  String get reportABug {
    return Intl.message(
      'report a bug',
      name: 'reportABug',
      desc: '',
      args: [],
    );
  }

  /// `share feedback`
  String get shareFeedback {
    return Intl.message(
      'share feedback',
      name: 'shareFeedback',
      desc: '',
      args: [],
    );
  }

  /// `feature request`
  String get featureRequest {
    return Intl.message(
      'feature request',
      name: 'featureRequest',
      desc: '',
      args: [],
    );
  }

  /// `others`
  String get others {
    return Intl.message(
      'others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `english`
  String get english {
    return Intl.message(
      'english',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `russian`
  String get russian {
    return Intl.message(
      'russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `uno`
  String get uno {
    return Intl.message(
      'uno',
      name: 'uno',
      desc: '',
      args: [],
    );
  }

  /// `scrabble`
  String get scrabble {
    return Intl.message(
      'scrabble',
      name: 'scrabble',
      desc: '',
      args: [],
    );
  }

  /// `uno flip`
  String get unoFlip {
    return Intl.message(
      'uno flip',
      name: 'unoFlip',
      desc: '',
      args: [],
    );
  }

  /// `dos`
  String get dos {
    return Intl.message(
      'dos',
      name: 'dos',
      desc: '',
      args: [],
    );
  }

  /// `set`
  String get set {
    return Intl.message(
      'set',
      name: 'set',
      desc: '',
      args: [],
    );
  }

  /// `munchkin`
  String get munchkin {
    return Intl.message(
      'munchkin',
      name: 'munchkin',
      desc: '',
      args: [],
    );
  }

  /// `counter`
  String get common {
    return Intl.message(
      'counter',
      name: 'common',
      desc: '',
      args: [],
    );
  }

  /// `game goal:`
  String get gameGoal {
    return Intl.message(
      'game goal:',
      name: 'gameGoal',
      desc: '',
      args: [],
    );
  }

  /// `preparation:`
  String get preparation {
    return Intl.message(
      'preparation:',
      name: 'preparation',
      desc: '',
      args: [],
    );
  }

  /// `be the first to reach level 10 by fighting monsters, using equipment, curses, and abilities cards.`
  String get munchkinGameObjectiveDescription {
    return Intl.message(
      'be the first to reach level 10 by fighting monsters, using equipment, curses, and abilities cards.',
      name: 'munchkinGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `shuffle the door and treasure cards and divide them into two separate decks.`
  String get munchkinShuffleCardsInstruction {
    return Intl.message(
      'shuffle the door and treasure cards and divide them into two separate decks.',
      name: 'munchkinShuffleCardsInstruction',
      desc: '',
      args: [],
    );
  }

  /// `each player takes: 4 cards from the door deck and 4 cards from the treasure deck.`
  String get munchkinInitialCardsInstruction {
    return Intl.message(
      'each player takes: 4 cards from the door deck and 4 cards from the treasure deck.',
      name: 'munchkinInitialCardsInstruction',
      desc: '',
      args: [],
    );
  }

  /// `players place their starting equipment cards on the table, if they have any.`
  String get munchkinStartingGearInstruction {
    return Intl.message(
      'players place their starting equipment cards on the table, if they have any.',
      name: 'munchkinStartingGearInstruction',
      desc: '',
      args: [],
    );
  }

  /// `game turn:`
  String get gameTurnTitle {
    return Intl.message(
      'game turn:',
      name: 'gameTurnTitle',
      desc: '',
      args: [],
    );
  }

  /// `the player draws the top card from the door deck. possible outcomes:`
  String get munchkinTurnDescription {
    return Intl.message(
      'the player draws the top card from the door deck. possible outcomes:',
      name: 'munchkinTurnDescription',
      desc: '',
      args: [],
    );
  }

  /// `monster: fight it (see 'combat').`
  String get munchkinMonsterEncounter {
    return Intl.message(
      'monster: fight it (see \'combat\').',
      name: 'munchkinMonsterEncounter',
      desc: '',
      args: [],
    );
  }

  /// `curse: immediately apply it to yourself.`
  String get munchkinCurseEncounter {
    return Intl.message(
      'curse: immediately apply it to yourself.',
      name: 'munchkinCurseEncounter',
      desc: '',
      args: [],
    );
  }

  /// `any other card: keep it in your hand.`
  String get munchkinOtherCardEncounter {
    return Intl.message(
      'any other card: keep it in your hand.',
      name: 'munchkinOtherCardEncounter',
      desc: '',
      args: [],
    );
  }

  /// `if there's no monster, the player can:`
  String get munchkinNoMonsterActionsTitle {
    return Intl.message(
      'if there\'s no monster, the player can:',
      name: 'munchkinNoMonsterActionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `play a monster from their hand to fight (optional) or go 'looking for trouble' (draw a card from the door deck into their hand).`
  String get munchkinNoMonsterActionsDescription {
    return Intl.message(
      'play a monster from their hand to fight (optional) or go \'looking for trouble\' (draw a card from the door deck into their hand).',
      name: 'munchkinNoMonsterActionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `combat (if there's a monster):`
  String get munchkinCombatTitle {
    return Intl.message(
      'combat (if there\'s a monster):',
      name: 'munchkinCombatTitle',
      desc: '',
      args: [],
    );
  }

  /// `compare your character's level (including bonuses) with the monster's level.`
  String get munchkinCombatCompareLevels {
    return Intl.message(
      'compare your character\'s level (including bonuses) with the monster\'s level.',
      name: 'munchkinCombatCompareLevels',
      desc: '',
      args: [],
    );
  }

  /// `if your level is equal to or higher, you win and gain treasures and a level.`
  String get munchkinCombatWinCondition {
    return Intl.message(
      'if your level is equal to or higher, you win and gain treasures and a level.',
      name: 'munchkinCombatWinCondition',
      desc: '',
      args: [],
    );
  }

  /// `if your level is lower, you can: ask another player for help (negotiated) or use cards from your hand to boost yourself.`
  String get munchkinCombatHelpOrBoost {
    return Intl.message(
      'if your level is lower, you can: ask another player for help (negotiated) or use cards from your hand to boost yourself.',
      name: 'munchkinCombatHelpOrBoost',
      desc: '',
      args: [],
    );
  }

  /// `if you fail to win, escape (roll a die). a roll of 5 or 6 succeeds. if you fail to escape, follow the consequences listed on the monster card.`
  String get munchkinCombatEscapeRules {
    return Intl.message(
      'if you fail to win, escape (roll a die). a roll of 5 or 6 succeeds. if you fail to escape, follow the consequences listed on the monster card.',
      name: 'munchkinCombatEscapeRules',
      desc: '',
      args: [],
    );
  }

  /// `at the end of your turn, discard excess cards if you have more than 5. give them to the player with the lowest level.`
  String get munchkinEndTurnDiscardRules {
    return Intl.message(
      'at the end of your turn, discard excess cards if you have more than 5. give them to the player with the lowest level.',
      name: 'munchkinEndTurnDiscardRules',
      desc: '',
      args: [],
    );
  }

  /// `types of cards:`
  String get cardTypesTitle {
    return Intl.message(
      'types of cards:',
      name: 'cardTypesTitle',
      desc: '',
      args: [],
    );
  }

  /// `monsters — fight them to level up.`
  String get munchkinMonstersCardType {
    return Intl.message(
      'monsters — fight them to level up.',
      name: 'munchkinMonstersCardType',
      desc: '',
      args: [],
    );
  }

  /// `equipment — provides bonuses to your level during combat.`
  String get munchkinEquipmentCardType {
    return Intl.message(
      'equipment — provides bonuses to your level during combat.',
      name: 'munchkinEquipmentCardType',
      desc: '',
      args: [],
    );
  }

  /// `curses — hinder your character or other players.`
  String get munchkinCursesCardType {
    return Intl.message(
      'curses — hinder your character or other players.',
      name: 'munchkinCursesCardType',
      desc: '',
      args: [],
    );
  }

  /// `monster enhancers — increase the monster's strength.`
  String get munchkinMonsterEnhancersCardType {
    return Intl.message(
      'monster enhancers — increase the monster\'s strength.',
      name: 'munchkinMonsterEnhancersCardType',
      desc: '',
      args: [],
    );
  }

  /// `one-time-use items — used in combat or for other effects.`
  String get munchkinOneTimeItemsCardType {
    return Intl.message(
      'one-time-use items — used in combat or for other effects.',
      name: 'munchkinOneTimeItemsCardType',
      desc: '',
      args: [],
    );
  }

  /// `special rules:`
  String get specialRulesTitle {
    return Intl.message(
      'special rules:',
      name: 'specialRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `monster victory: defeating a monster grants you a level and treasures.`
  String get munchkinMonsterVictoryReward {
    return Intl.message(
      'monster victory: defeating a monster grants you a level and treasures.',
      name: 'munchkinMonsterVictoryReward',
      desc: '',
      args: [],
    );
  }

  /// `level 10: the final level can only be achieved by defeating a monster.`
  String get munchkinLevel10Condition {
    return Intl.message(
      'level 10: the final level can only be achieved by defeating a monster.',
      name: 'munchkinLevel10Condition',
      desc: '',
      args: [],
    );
  }

  /// `death: you lose all cards except your level and races (or classes).`
  String get munchkinDeathRules {
    return Intl.message(
      'death: you lose all cards except your level and races (or classes).',
      name: 'munchkinDeathRules',
      desc: '',
      args: [],
    );
  }

  /// `victory:`
  String get victoryTitle {
    return Intl.message(
      'victory:',
      name: 'victoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `the first player to reach level 10 wins!`
  String get munchkinVictoryCondition {
    return Intl.message(
      'the first player to reach level 10 wins!',
      name: 'munchkinVictoryCondition',
      desc: '',
      args: [],
    );
  }

  /// `munchkin® is a registered trademark of steve jackson games.`
  String get munchkinTrademarkNotice {
    return Intl.message(
      'munchkin® is a registered trademark of steve jackson games.',
      name: 'munchkinTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `find a set (a group of 3 cards) where each attribute is either the same across all cards or different on all cards.`
  String get setGameObjectiveDescription {
    return Intl.message(
      'find a set (a group of 3 cards) where each attribute is either the same across all cards or different on all cards.',
      name: 'setGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `card attributes:`
  String get setCardAttributesTitle {
    return Intl.message(
      'card attributes:',
      name: 'setCardAttributesTitle',
      desc: '',
      args: [],
    );
  }

  /// `each card is unique and has 4 attributes:`
  String get setCardAttributesDescription {
    return Intl.message(
      'each card is unique and has 4 attributes:',
      name: 'setCardAttributesDescription',
      desc: '',
      args: [],
    );
  }

  /// `number of symbols: 1, 2, or 3.`
  String get setCardAttributeNumberOfSymbols {
    return Intl.message(
      'number of symbols: 1, 2, or 3.',
      name: 'setCardAttributeNumberOfSymbols',
      desc: '',
      args: [],
    );
  }

  /// `symbol type: oval, diamond, wave.`
  String get setCardAttributeSymbolType {
    return Intl.message(
      'symbol type: oval, diamond, wave.',
      name: 'setCardAttributeSymbolType',
      desc: '',
      args: [],
    );
  }

  /// `symbol color: red, green, purple.`
  String get setCardAttributeSymbolColor {
    return Intl.message(
      'symbol color: red, green, purple.',
      name: 'setCardAttributeSymbolColor',
      desc: '',
      args: [],
    );
  }

  /// `fill type: empty, striped, solid.`
  String get setCardAttributeFillType {
    return Intl.message(
      'fill type: empty, striped, solid.',
      name: 'setCardAttributeFillType',
      desc: '',
      args: [],
    );
  }

  /// `the dealer places 12 cards.`
  String get setGameTurnStepDealerSetup {
    return Intl.message(
      'the dealer places 12 cards.',
      name: 'setGameTurnStepDealerSetup',
      desc: '',
      args: [],
    );
  }

  /// `players simultaneously search for a set. the first to find one calls out: 'set!'`
  String get setGameTurnStepFindingSet {
    return Intl.message(
      'players simultaneously search for a set. the first to find one calls out: \'set!\'',
      name: 'setGameTurnStepFindingSet',
      desc: '',
      args: [],
    );
  }

  /// `validate correctness: if correct, the player takes the cards, and the dealer replaces them with 3 new ones. if incorrect, the player loses 1 point or skips a turn (as agreed).`
  String get setGameTurnStepValidation {
    return Intl.message(
      'validate correctness: if correct, the player takes the cards, and the dealer replaces them with 3 new ones. if incorrect, the player loses 1 point or skips a turn (as agreed).',
      name: 'setGameTurnStepValidation',
      desc: '',
      args: [],
    );
  }

  /// `example of a correct set:`
  String get setGameTurnStepContinue {
    return Intl.message(
      'example of a correct set:',
      name: 'setGameTurnStepContinue',
      desc: '',
      args: [],
    );
  }

  /// `attribute 'color': different (red, green, purple).`
  String get setExampleOfValidSetTitle {
    return Intl.message(
      'attribute \'color\': different (red, green, purple).',
      name: 'setExampleOfValidSetTitle',
      desc: '',
      args: [],
    );
  }

  /// `attribute 'number': same (two).`
  String get setExampleOfValidSetColor {
    return Intl.message(
      'attribute \'number\': same (two).',
      name: 'setExampleOfValidSetColor',
      desc: '',
      args: [],
    );
  }

  /// `attribute 'type': different (oval, diamond, wave).`
  String get setExampleOfValidSetNumber {
    return Intl.message(
      'attribute \'type\': different (oval, diamond, wave).',
      name: 'setExampleOfValidSetNumber',
      desc: '',
      args: [],
    );
  }

  /// `attribute 'fill': same (striped).`
  String get setExampleOfValidSetType {
    return Intl.message(
      'attribute \'fill\': same (striped).',
      name: 'setExampleOfValidSetType',
      desc: '',
      args: [],
    );
  }

  /// `what to do if no set is found:`
  String get setExampleOfValidSetFill {
    return Intl.message(
      'what to do if no set is found:',
      name: 'setExampleOfValidSetFill',
      desc: '',
      args: [],
    );
  }

  /// `what to do if no set is found:`
  String get setNoSetFoundTitle {
    return Intl.message(
      'what to do if no set is found:',
      name: 'setNoSetFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `if no set exists among the 12 cards, the dealer adds 3 cards (up to a maximum of 21 cards). among 21 cards, a set always exists.`
  String get setNoSetFoundDescription {
    return Intl.message(
      'if no set exists among the 12 cards, the dealer adds 3 cards (up to a maximum of 21 cards). among 21 cards, a set always exists.',
      name: 'setNoSetFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `scoring:`
  String get setScoringTitle {
    return Intl.message(
      'scoring:',
      name: 'setScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `1 point per found set.`
  String get setScoringPointPerSet {
    return Intl.message(
      '1 point per found set.',
      name: 'setScoringPointPerSet',
      desc: '',
      args: [],
    );
  }

  /// `the game ends when the deck runs out or a predefined point total is reached.`
  String get setScoringGameEnd {
    return Intl.message(
      'the game ends when the deck runs out or a predefined point total is reached.',
      name: 'setScoringGameEnd',
      desc: '',
      args: [],
    );
  }

  /// `important rules:`
  String get setImportantRulesTitle {
    return Intl.message(
      'important rules:',
      name: 'setImportantRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `a new set cannot be declared until the previous one is confirmed.`
  String get setImportantRuleConfirmation {
    return Intl.message(
      'a new set cannot be declared until the previous one is confirmed.',
      name: 'setImportantRuleConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `cards forming a set can be arranged in any order.`
  String get setImportantRuleCardPosition {
    return Intl.message(
      'cards forming a set can be arranged in any order.',
      name: 'setImportantRuleCardPosition',
      desc: '',
      args: [],
    );
  }

  /// `for learning, the game can be simplified by using only 3 attributes.`
  String get setImportantRuleSimplifiedMode {
    return Intl.message(
      'for learning, the game can be simplified by using only 3 attributes.',
      name: 'setImportantRuleSimplifiedMode',
      desc: '',
      args: [],
    );
  }

  /// `set® is a registered trademark of set enterprises, inc.`
  String get setTrademarkNotice {
    return Intl.message(
      'set® is a registered trademark of set enterprises, inc.',
      name: 'setTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `game set:`
  String get scrabbleGameSetTitle {
    return Intl.message(
      'game set:',
      name: 'scrabbleGameSetTitle',
      desc: '',
      args: [],
    );
  }

  /// `form words on the board crossword-style. score more points than your opponents.`
  String get scrabbleGameObjectiveDescription {
    return Intl.message(
      'form words on the board crossword-style. score more points than your opponents.',
      name: 'scrabbleGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `15x15 board.`
  String get scrabbleGameSetBoard {
    return Intl.message(
      '15x15 board.',
      name: 'scrabbleGameSetBoard',
      desc: '',
      args: [],
    );
  }

  /// `104 tiles (including 2 blanks).`
  String get scrabbleGameSetLetters {
    return Intl.message(
      '104 tiles (including 2 blanks).',
      name: 'scrabbleGameSetLetters',
      desc: '',
      args: [],
    );
  }

  /// `4 racks, tile bag.`
  String get scrabbleGameSetAccessories {
    return Intl.message(
      '4 racks, tile bag.',
      name: 'scrabbleGameSetAccessories',
      desc: '',
      args: [],
    );
  }

  /// `shuffle the tiles in the bag.`
  String get scrabblePreparationShuffle {
    return Intl.message(
      'shuffle the tiles in the bag.',
      name: 'scrabblePreparationShuffle',
      desc: '',
      args: [],
    );
  }

  /// `each player draws 7 tiles.`
  String get scrabblePreparationDrawTiles {
    return Intl.message(
      'each player draws 7 tiles.',
      name: 'scrabblePreparationDrawTiles',
      desc: '',
      args: [],
    );
  }

  /// `the first turn goes to the player whose randomly drawn tile is closest to the start of the alphabet.`
  String get scrabblePreparationFirstTurnRule {
    return Intl.message(
      'the first turn goes to the player whose randomly drawn tile is closest to the start of the alphabet.',
      name: 'scrabblePreparationFirstTurnRule',
      desc: '',
      args: [],
    );
  }

  /// `turn rules:`
  String get scrabbleTurnRulesTitle {
    return Intl.message(
      'turn rules:',
      name: 'scrabbleTurnRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `first word: must pass through the center square (star).`
  String get scrabbleTurnRuleFirstWord {
    return Intl.message(
      'first word: must pass through the center square (star).',
      name: 'scrabbleTurnRuleFirstWord',
      desc: '',
      args: [],
    );
  }

  /// `all words must be placed horizontally or vertically.`
  String get scrabbleTurnRuleWordDirection {
    return Intl.message(
      'all words must be placed horizontally or vertically.',
      name: 'scrabbleTurnRuleWordDirection',
      desc: '',
      args: [],
    );
  }

  /// `each new tile must form part of a new or existing word.`
  String get scrabbleTurnRuleLetterPlacement {
    return Intl.message(
      'each new tile must form part of a new or existing word.',
      name: 'scrabbleTurnRuleLetterPlacement',
      desc: '',
      args: [],
    );
  }

  /// `scoring:`
  String get scrabbleScoringTitle {
    return Intl.message(
      'scoring:',
      name: 'scrabbleScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `points for a word: sum of tile points + bonuses from board spaces.`
  String get scrabbleScoringWordPoints {
    return Intl.message(
      'points for a word: sum of tile points + bonuses from board spaces.',
      name: 'scrabbleScoringWordPoints',
      desc: '',
      args: [],
    );
  }

  /// `blue spaces double/triple the letter score.`
  String get scrabbleScoringBlueBonus {
    return Intl.message(
      'blue spaces double/triple the letter score.',
      name: 'scrabbleScoringBlueBonus',
      desc: '',
      args: [],
    );
  }

  /// `red spaces double/triple the word score.`
  String get scrabbleScoringRedBonus {
    return Intl.message(
      'red spaces double/triple the word score.',
      name: 'scrabbleScoringRedBonus',
      desc: '',
      args: [],
    );
  }

  /// `features:`
  String get scrabbleFeaturesTitle {
    return Intl.message(
      'features:',
      name: 'scrabbleFeaturesTitle',
      desc: '',
      args: [],
    );
  }

  /// `blank tiles can represent any letter but score no points.`
  String get scrabbleFeatureBlankTile {
    return Intl.message(
      'blank tiles can represent any letter but score no points.',
      name: 'scrabbleFeatureBlankTile',
      desc: '',
      args: [],
    );
  }

  /// `using all 7 tiles in a turn earns a 50-point bonus.`
  String get scrabbleFeatureSevenTileBonus {
    return Intl.message(
      'using all 7 tiles in a turn earns a 50-point bonus.',
      name: 'scrabbleFeatureSevenTileBonus',
      desc: '',
      args: [],
    );
  }

  /// `players draw tiles after each turn to refill their racks to 7.`
  String get scrabbleFeatureRefillTiles {
    return Intl.message(
      'players draw tiles after each turn to refill their racks to 7.',
      name: 'scrabbleFeatureRefillTiles',
      desc: '',
      args: [],
    );
  }

  /// `end of game:`
  String get endGameTitle {
    return Intl.message(
      'end of game:',
      name: 'endGameTitle',
      desc: '',
      args: [],
    );
  }

  /// `the game ends when there are no tiles left and no moves can be made.`
  String get scrabbleEndGameNoTiles {
    return Intl.message(
      'the game ends when there are no tiles left and no moves can be made.',
      name: 'scrabbleEndGameNoTiles',
      desc: '',
      args: [],
    );
  }

  /// `the game ends if all players pass their turns twice.`
  String get scrabbleEndGameSkippedTurns {
    return Intl.message(
      'the game ends if all players pass their turns twice.',
      name: 'scrabbleEndGameSkippedTurns',
      desc: '',
      args: [],
    );
  }

  /// `unplayed tiles are subtracted from the player's score.`
  String get scrabbleEndGameRemainingTilesPenalty {
    return Intl.message(
      'unplayed tiles are subtracted from the player\'s score.',
      name: 'scrabbleEndGameRemainingTilesPenalty',
      desc: '',
      args: [],
    );
  }

  /// `additional rules:`
  String get scrabbleAdditionalPointsTitle {
    return Intl.message(
      'additional rules:',
      name: 'scrabbleAdditionalPointsTitle',
      desc: '',
      args: [],
    );
  }

  /// `players may swap tiles and pass their turn.`
  String get scrabbleAdditionalReplaceTiles {
    return Intl.message(
      'players may swap tiles and pass their turn.',
      name: 'scrabbleAdditionalReplaceTiles',
      desc: '',
      args: [],
    );
  }

  /// `challenged words are checked in an agreed-upon dictionary.`
  String get scrabbleAdditionalDisputedWords {
    return Intl.message(
      'challenged words are checked in an agreed-upon dictionary.',
      name: 'scrabbleAdditionalDisputedWords',
      desc: '',
      args: [],
    );
  }

  /// `all words must be complete and adhere to language rules.`
  String get scrabbleAdditionalWordRules {
    return Intl.message(
      'all words must be complete and adhere to language rules.',
      name: 'scrabbleAdditionalWordRules',
      desc: '',
      args: [],
    );
  }

  /// `scrabble® is a registered trademark of hasbro, inc.`
  String get scrabbleTrademarkNotice {
    return Intl.message(
      'scrabble® is a registered trademark of hasbro, inc.',
      name: 'scrabbleTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `be the first to play all your cards and score points from your opponents' remaining cards. the first player to reach 500 points wins.`
  String get unoGameObjectiveDescription {
    return Intl.message(
      'be the first to play all your cards and score points from your opponents\' remaining cards. the first player to reach 500 points wins.',
      name: 'unoGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `deal 7 cards to each player.`
  String get unoPreparationDistributeCards {
    return Intl.message(
      'deal 7 cards to each player.',
      name: 'unoPreparationDistributeCards',
      desc: '',
      args: [],
    );
  }

  /// `place the remaining deck in the center as the draw pile.`
  String get unoPreparationDeckInCenter {
    return Intl.message(
      'place the remaining deck in the center as the draw pile.',
      name: 'unoPreparationDeckInCenter',
      desc: '',
      args: [],
    );
  }

  /// `flip the top card to start the discard pile.`
  String get unoPreparationFlipFirstCard {
    return Intl.message(
      'flip the top card to start the discard pile.',
      name: 'unoPreparationFlipFirstCard',
      desc: '',
      args: [],
    );
  }

  /// `players take turns playing a card that matches the top card by color, number, or symbol.`
  String get unoGameTurnTitle {
    return Intl.message(
      'players take turns playing a card that matches the top card by color, number, or symbol.',
      name: 'unoGameTurnTitle',
      desc: '',
      args: [],
    );
  }

  /// `players take turns playing a card that matches the top card by color, number, or symbol.`
  String get unoTurnRuleMatchCard {
    return Intl.message(
      'players take turns playing a card that matches the top card by color, number, or symbol.',
      name: 'unoTurnRuleMatchCard',
      desc: '',
      args: [],
    );
  }

  /// `if you can't play, draw a card. if it's playable, you can play it immediately.`
  String get unoTurnRuleDrawCard {
    return Intl.message(
      'if you can\'t play, draw a card. if it\'s playable, you can play it immediately.',
      name: 'unoTurnRuleDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `players may draw a card even if they have a playable one, but they can't play it on the same turn.`
  String get unoTurnRuleOptionalDraw {
    return Intl.message(
      'players may draw a card even if they have a playable one, but they can\'t play it on the same turn.',
      name: 'unoTurnRuleOptionalDraw',
      desc: '',
      args: [],
    );
  }

  /// `action cards:`
  String get unoActiveCardsTitle {
    return Intl.message(
      'action cards:',
      name: 'unoActiveCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `'skip': the next player loses their turn.`
  String get unoActiveCardSkipTurn {
    return Intl.message(
      '\'skip\': the next player loses their turn.',
      name: 'unoActiveCardSkipTurn',
      desc: '',
      args: [],
    );
  }

  /// `'draw two': the next player draws 2 cards and loses their turn.`
  String get unoActiveCardDrawTwo {
    return Intl.message(
      '\'draw two\': the next player draws 2 cards and loses their turn.',
      name: 'unoActiveCardDrawTwo',
      desc: '',
      args: [],
    );
  }

  /// `'reverse': reverses the direction of play.`
  String get unoActiveCardReverse {
    return Intl.message(
      '\'reverse\': reverses the direction of play.',
      name: 'unoActiveCardReverse',
      desc: '',
      args: [],
    );
  }

  /// `'wild': allows you to choose the color of play.`
  String get unoActiveCardWild {
    return Intl.message(
      '\'wild\': allows you to choose the color of play.',
      name: 'unoActiveCardWild',
      desc: '',
      args: [],
    );
  }

  /// `'wild draw four': choose the color, and the next player draws 4 cards. you can only play it if you have no matching cards.`
  String get unoActiveCardWildDrawFour {
    return Intl.message(
      '\'wild draw four\': choose the color, and the next player draws 4 cards. you can only play it if you have no matching cards.',
      name: 'unoActiveCardWildDrawFour',
      desc: '',
      args: [],
    );
  }

  /// `special cards:`
  String get specialCardsTitle {
    return Intl.message(
      'special cards:',
      name: 'specialCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `'swap hands': swap hands with any player and choose the color.`
  String get unoSpecialCardSwap {
    return Intl.message(
      '\'swap hands\': swap hands with any player and choose the color.',
      name: 'unoSpecialCardSwap',
      desc: '',
      args: [],
    );
  }

  /// `'blank card': make a rule before starting the game.`
  String get unoSpecialCardBlank {
    return Intl.message(
      '\'blank card\': make a rule before starting the game.',
      name: 'unoSpecialCardBlank',
      desc: '',
      args: [],
    );
  }

  /// `forget to say 'uno'? draw 2 cards if caught before the next player's turn.`
  String get unoSpecialRuleUnoCall {
    return Intl.message(
      'forget to say \'uno\'? draw 2 cards if caught before the next player\'s turn.',
      name: 'unoSpecialRuleUnoCall',
      desc: '',
      args: [],
    );
  }

  /// `if the draw pile is empty, reshuffle the discard pile.`
  String get unoSpecialRuleReshuffle {
    return Intl.message(
      'if the draw pile is empty, reshuffle the discard pile.',
      name: 'unoSpecialRuleReshuffle',
      desc: '',
      args: [],
    );
  }

  /// `scoring:`
  String get unoScoringTitle {
    return Intl.message(
      'scoring:',
      name: 'unoScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `number cards: face value.`
  String get unoScoringNumberCards {
    return Intl.message(
      'number cards: face value.',
      name: 'unoScoringNumberCards',
      desc: '',
      args: [],
    );
  }

  /// `'skip', 'draw two', 'reverse': 20 points.`
  String get unoScoring20PointsCards {
    return Intl.message(
      '\'skip\', \'draw two\', \'reverse\': 20 points.',
      name: 'unoScoring20PointsCards',
      desc: '',
      args: [],
    );
  }

  /// `'wild', 'wild draw four': 50 points.`
  String get unoScoring50PointsCards {
    return Intl.message(
      '\'wild\', \'wild draw four\': 50 points.',
      name: 'unoScoring50PointsCards',
      desc: '',
      args: [],
    );
  }

  /// `'swap hands', 'blank card': 40 points.`
  String get unoScoring40PointsCards {
    return Intl.message(
      '\'swap hands\', \'blank card\': 40 points.',
      name: 'unoScoring40PointsCards',
      desc: '',
      args: [],
    );
  }

  /// `the first player to reach 500 points wins.`
  String get unoVictory500Points {
    return Intl.message(
      'the first player to reach 500 points wins.',
      name: 'unoVictory500Points',
      desc: '',
      args: [],
    );
  }

  /// `alternative: the player with the lowest score wins after the game ends.`
  String get unoVictoryLowestScoreAlternative {
    return Intl.message(
      'alternative: the player with the lowest score wins after the game ends.',
      name: 'unoVictoryLowestScoreAlternative',
      desc: '',
      args: [],
    );
  }

  /// `uno® is a registered trademark of mattel.`
  String get unoTrademarkNotice {
    return Intl.message(
      'uno® is a registered trademark of mattel.',
      name: 'unoTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `play all your cards and score points from your opponents' remaining cards. the first player to reach 500 points wins.`
  String get unoFlipGameObjectiveDescription {
    return Intl.message(
      'play all your cards and score points from your opponents\' remaining cards. the first player to reach 500 points wins.',
      name: 'unoFlipGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `game start:`
  String get unoFlipGameStartTitle {
    return Intl.message(
      'game start:',
      name: 'unoFlipGameStartTitle',
      desc: '',
      args: [],
    );
  }

  /// `each player receives 7 cards.`
  String get unoFlipGameStartDealCards {
    return Intl.message(
      'each player receives 7 cards.',
      name: 'unoFlipGameStartDealCards',
      desc: '',
      args: [],
    );
  }

  /// `start the game on the light side of the deck.`
  String get unoFlipGameStartLightSide {
    return Intl.message(
      'start the game on the light side of the deck.',
      name: 'unoFlipGameStartLightSide',
      desc: '',
      args: [],
    );
  }

  /// `play a card matching the top card by color, number, or symbol.`
  String get unoFlipTurnRuleMatchCard {
    return Intl.message(
      'play a card matching the top card by color, number, or symbol.',
      name: 'unoFlipTurnRuleMatchCard',
      desc: '',
      args: [],
    );
  }

  /// `if no matching card is available, draw from the pile.`
  String get unoFlipTurnRuleDrawCard {
    return Intl.message(
      'if no matching card is available, draw from the pile.',
      name: 'unoFlipTurnRuleDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `'flip' card switches the game to the other side of the deck.`
  String get unoFlipTurnRuleFlipCard {
    return Intl.message(
      '\'flip\' card switches the game to the other side of the deck.',
      name: 'unoFlipTurnRuleFlipCard',
      desc: '',
      args: [],
    );
  }

  /// `light side:`
  String get unoFlipLightSideCardsTitle {
    return Intl.message(
      'light side:',
      name: 'unoFlipLightSideCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `'draw one'`
  String get unoFlipLightSideDrawOne {
    return Intl.message(
      '\'draw one\'',
      name: 'unoFlipLightSideDrawOne',
      desc: '',
      args: [],
    );
  }

  /// `'reverse'`
  String get unoFlipLightSideReverse {
    return Intl.message(
      '\'reverse\'',
      name: 'unoFlipLightSideReverse',
      desc: '',
      args: [],
    );
  }

  /// `'skip turn'`
  String get unoFlipLightSideSkipTurn {
    return Intl.message(
      '\'skip turn\'',
      name: 'unoFlipLightSideSkipTurn',
      desc: '',
      args: [],
    );
  }

  /// `'wild'`
  String get unoFlipLightSideWildCard {
    return Intl.message(
      '\'wild\'',
      name: 'unoFlipLightSideWildCard',
      desc: '',
      args: [],
    );
  }

  /// `'wild draw two'`
  String get unoFlipLightSideWildDrawTwo {
    return Intl.message(
      '\'wild draw two\'',
      name: 'unoFlipLightSideWildDrawTwo',
      desc: '',
      args: [],
    );
  }

  /// `dark side:`
  String get unoFlipDarkSideCardsTitle {
    return Intl.message(
      'dark side:',
      name: 'unoFlipDarkSideCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `'draw five'`
  String get unoFlipDarkSideDrawFive {
    return Intl.message(
      '\'draw five\'',
      name: 'unoFlipDarkSideDrawFive',
      desc: '',
      args: [],
    );
  }

  /// `'reverse'`
  String get unoFlipDarkSideReverse {
    return Intl.message(
      '\'reverse\'',
      name: 'unoFlipDarkSideReverse',
      desc: '',
      args: [],
    );
  }

  /// `'skip all'`
  String get unoFlipDarkSideSkipAll {
    return Intl.message(
      '\'skip all\'',
      name: 'unoFlipDarkSideSkipAll',
      desc: '',
      args: [],
    );
  }

  /// `'wild'`
  String get unoFlipDarkSideWildCard {
    return Intl.message(
      '\'wild\'',
      name: 'unoFlipDarkSideWildCard',
      desc: '',
      args: [],
    );
  }

  /// `'draw until matching color'`
  String get unoFlipDarkSideDrawUntilColor {
    return Intl.message(
      '\'draw until matching color\'',
      name: 'unoFlipDarkSideDrawUntilColor',
      desc: '',
      args: [],
    );
  }

  /// `after a 'flip' card, the entire game switches sides.`
  String get unoFlipKeyMomentFlipCardEffect {
    return Intl.message(
      'after a \'flip\' card, the entire game switches sides.',
      name: 'unoFlipKeyMomentFlipCardEffect',
      desc: '',
      args: [],
    );
  }

  /// `key moments:`
  String get unoFlipKeyMoment {
    return Intl.message(
      'key moments:',
      name: 'unoFlipKeyMoment',
      desc: '',
      args: [],
    );
  }

  /// `when playing your second-to-last card, call 'uno!' if you forget and are caught, draw 2 cards.`
  String get unoFlipKeyMomentUnoCall {
    return Intl.message(
      'when playing your second-to-last card, call \'uno!\' if you forget and are caught, draw 2 cards.',
      name: 'unoFlipKeyMomentUnoCall',
      desc: '',
      args: [],
    );
  }

  /// `scoring:`
  String get unoFlipScoringTitle {
    return Intl.message(
      'scoring:',
      name: 'unoFlipScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `round winner scores points for opponents' remaining cards:`
  String get unoFlipScoringRoundWinnerPoints {
    return Intl.message(
      'round winner scores points for opponents\' remaining cards:',
      name: 'unoFlipScoringRoundWinnerPoints',
      desc: '',
      args: [],
    );
  }

  /// `number cards: face value.`
  String get unoFlipScoringNumberCards {
    return Intl.message(
      'number cards: face value.',
      name: 'unoFlipScoringNumberCards',
      desc: '',
      args: [],
    );
  }

  /// `action cards: 20–60 points depending on type.`
  String get unoFlipScoringActiveCards {
    return Intl.message(
      'action cards: 20–60 points depending on type.',
      name: 'unoFlipScoringActiveCards',
      desc: '',
      args: [],
    );
  }

  /// `the first player to reach 500 points wins.`
  String get unoFlipVictory500Points {
    return Intl.message(
      'the first player to reach 500 points wins.',
      name: 'unoFlipVictory500Points',
      desc: '',
      args: [],
    );
  }

  /// `alternative: the player with the lowest score wins after the game ends.`
  String get unoFlipVictoryLowestScoreAlternative {
    return Intl.message(
      'alternative: the player with the lowest score wins after the game ends.',
      name: 'unoFlipVictoryLowestScoreAlternative',
      desc: '',
      args: [],
    );
  }

  /// `uno flip® is a registered trademark of mattel.`
  String get unoFlipTrademarkNotice {
    return Intl.message(
      'uno flip® is a registered trademark of mattel.',
      name: 'unoFlipTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `objective:`
  String get dosGameObjectiveTitle {
    return Intl.message(
      'objective:',
      name: 'dosGameObjectiveTitle',
      desc: '',
      args: [],
    );
  }

  /// `play all your cards and score points from your opponents' remaining cards. the first player to reach 200 points wins.`
  String get dosGameObjectiveDescription {
    return Intl.message(
      'play all your cards and score points from your opponents\' remaining cards. the first player to reach 200 points wins.',
      name: 'dosGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `deal 7 cards to each player.`
  String get dosPreparationDealCards {
    return Intl.message(
      'deal 7 cards to each player.',
      name: 'dosPreparationDealCards',
      desc: '',
      args: [],
    );
  }

  /// `place 2 cards in the 'center row'`
  String get dosPreparationCentralRow {
    return Intl.message(
      'place 2 cards in the \'center row\'',
      name: 'dosPreparationCentralRow',
      desc: '',
      args: [],
    );
  }

  /// `put the rest of the deck next to it as the draw pile.`
  String get dosPreparationDrawPile {
    return Intl.message(
      'put the rest of the deck next to it as the draw pile.',
      name: 'dosPreparationDrawPile',
      desc: '',
      args: [],
    );
  }

  /// `players take turns matching cards from their hand to cards in the center row:`
  String get dosTurnRulePickCards {
    return Intl.message(
      'players take turns matching cards from their hand to cards in the center row:',
      name: 'dosTurnRulePickCards',
      desc: '',
      args: [],
    );
  }

  /// `single match: a card matches by number.`
  String get dosTurnRuleSingleMatch {
    return Intl.message(
      'single match: a card matches by number.',
      name: 'dosTurnRuleSingleMatch',
      desc: '',
      args: [],
    );
  }

  /// `double match: two cards add up to the number on a center row card.`
  String get dosTurnRuleDoubleMatch {
    return Intl.message(
      'double match: two cards add up to the number on a center row card.',
      name: 'dosTurnRuleDoubleMatch',
      desc: '',
      args: [],
    );
  }

  /// `if no match is possible, draw a card. if it matches, you can play it.`
  String get dosTurnRuleDrawCard {
    return Intl.message(
      'if no match is possible, draw a card. if it matches, you can play it.',
      name: 'dosTurnRuleDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `at the end of your turn, refill the center row to 2 cards.`
  String get dosTurnRuleEndTurn {
    return Intl.message(
      'at the end of your turn, refill the center row to 2 cards.',
      name: 'dosTurnRuleEndTurn',
      desc: '',
      args: [],
    );
  }

  /// `bonuses:`
  String get dosBonusNumberColorMatchAddCard {
    return Intl.message(
      'bonuses:',
      name: 'dosBonusNumberColorMatchAddCard',
      desc: '',
      args: [],
    );
  }

  /// `bonuses:`
  String get dosBonus {
    return Intl.message(
      'bonuses:',
      name: 'dosBonus',
      desc: '',
      args: [],
    );
  }

  /// `double color match: all other players draw 1 card.`
  String get dosBonusDoubleColorMatchDrawCard {
    return Intl.message(
      'double color match: all other players draw 1 card.',
      name: 'dosBonusDoubleColorMatchDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `'wild dos': substitutes for two cards of any color.`
  String get dosSpecialCardWildDos {
    return Intl.message(
      '\'wild dos\': substitutes for two cards of any color.',
      name: 'dosSpecialCardWildDos',
      desc: '',
      args: [],
    );
  }

  /// `'wild #': substitutes for any number (1–10) of its color.`
  String get dosSpecialCardWildNumber {
    return Intl.message(
      '\'wild #\': substitutes for any number (1–10) of its color.',
      name: 'dosSpecialCardWildNumber',
      desc: '',
      args: [],
    );
  }

  /// `when you have 2 cards left, call 'dos!' if you forget and are caught, draw 2 cards.`
  String get dosSpecialRuleDosCall {
    return Intl.message(
      'when you have 2 cards left, call \'dos!\' if you forget and are caught, draw 2 cards.',
      name: 'dosSpecialRuleDosCall',
      desc: '',
      args: [],
    );
  }

  /// `special rule:`
  String get dosSpecialRule {
    return Intl.message(
      'special rule:',
      name: 'dosSpecialRule',
      desc: '',
      args: [],
    );
  }

  /// `number cards: face value.`
  String get dosScoringNumberCards {
    return Intl.message(
      'number cards: face value.',
      name: 'dosScoringNumberCards',
      desc: '',
      args: [],
    );
  }

  /// `scoring:`
  String get dosScoring {
    return Intl.message(
      'scoring:',
      name: 'dosScoring',
      desc: '',
      args: [],
    );
  }

  /// `'wild dos': 20 points.`
  String get dosScoringWildDos {
    return Intl.message(
      '\'wild dos\': 20 points.',
      name: 'dosScoringWildDos',
      desc: '',
      args: [],
    );
  }

  /// `'wild #': 40 points.`
  String get dosScoringWildNumber {
    return Intl.message(
      '\'wild #\': 40 points.',
      name: 'dosScoringWildNumber',
      desc: '',
      args: [],
    );
  }

  /// `the first player to reach 200 points wins.`
  String get dosVictory200Points {
    return Intl.message(
      'the first player to reach 200 points wins.',
      name: 'dosVictory200Points',
      desc: '',
      args: [],
    );
  }

  /// `dos® is a registered trademark of mattel.`
  String get dosTrademarkNotice {
    return Intl.message(
      'dos® is a registered trademark of mattel.',
      name: 'dosTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `the game continues.`
  String get setGameTurnStepFour {
    return Intl.message(
      'the game continues.',
      name: 'setGameTurnStepFour',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `light`
  String get light {
    return Intl.message(
      'light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `dark`
  String get dark {
    return Intl.message(
      'dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `results`
  String get results {
    return Intl.message(
      'results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `players`
  String get players {
    return Intl.message(
      'players',
      name: 'players',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `round`
  String get round {
    return Intl.message(
      'round',
      name: 'round',
      desc: '',
      args: [],
    );
  }

  /// `gear`
  String get gear {
    return Intl.message(
      'gear',
      name: 'gear',
      desc: '',
      args: [],
    );
  }

  /// `level`
  String get level {
    return Intl.message(
      'level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `total strength: `
  String get totalStrength {
    return Intl.message(
      'total strength: ',
      name: 'totalStrength',
      desc: '',
      args: [],
    );
  }

  /// `modifiers`
  String get modifiers {
    return Intl.message(
      'modifiers',
      name: 'modifiers',
      desc: '',
      args: [],
    );
  }

  /// `add player`
  String get addPlayer {
    return Intl.message(
      'add player',
      name: 'addPlayer',
      desc: '',
      args: [],
    );
  }

  /// `race 1`
  String get race1 {
    return Intl.message(
      'race 1',
      name: 'race1',
      desc: '',
      args: [],
    );
  }

  /// `dwarf`
  String get dwarf {
    return Intl.message(
      'dwarf',
      name: 'dwarf',
      desc: '',
      args: [],
    );
  }

  /// `elf`
  String get elf {
    return Intl.message(
      'elf',
      name: 'elf',
      desc: '',
      args: [],
    );
  }

  /// `halfling`
  String get halfling {
    return Intl.message(
      'halfling',
      name: 'halfling',
      desc: '',
      args: [],
    );
  }

  /// `half breed`
  String get halfBreed {
    return Intl.message(
      'half breed',
      name: 'halfBreed',
      desc: '',
      args: [],
    );
  }

  /// `human`
  String get human {
    return Intl.message(
      'human',
      name: 'human',
      desc: '',
      args: [],
    );
  }

  /// `race 2`
  String get secondRace {
    return Intl.message(
      'race 2',
      name: 'secondRace',
      desc: '',
      args: [],
    );
  }

  /// `class 1`
  String get class1 {
    return Intl.message(
      'class 1',
      name: 'class1',
      desc: '',
      args: [],
    );
  }

  /// `cleric`
  String get cleric {
    return Intl.message(
      'cleric',
      name: 'cleric',
      desc: '',
      args: [],
    );
  }

  /// `thief`
  String get thief {
    return Intl.message(
      'thief',
      name: 'thief',
      desc: '',
      args: [],
    );
  }

  /// `warrior`
  String get warrior {
    return Intl.message(
      'warrior',
      name: 'warrior',
      desc: '',
      args: [],
    );
  }

  /// `wizard`
  String get wizard {
    return Intl.message(
      'wizard',
      name: 'wizard',
      desc: '',
      args: [],
    );
  }

  /// `super munch.`
  String get superMunch {
    return Intl.message(
      'super munch.',
      name: 'superMunch',
      desc: '',
      args: [],
    );
  }

  /// `no class`
  String get noClass {
    return Intl.message(
      'no class',
      name: 'noClass',
      desc: '',
      args: [],
    );
  }

  /// `class 2`
  String get class2 {
    return Intl.message(
      'class 2',
      name: 'class2',
      desc: '',
      args: [],
    );
  }

  /// `left hand`
  String get leftHand {
    return Intl.message(
      'left hand',
      name: 'leftHand',
      desc: '',
      args: [],
    );
  }

  /// `no item`
  String get noItem {
    return Intl.message(
      'no item',
      name: 'noItem',
      desc: '',
      args: [],
    );
  }

  /// `sword`
  String get sword {
    return Intl.message(
      'sword',
      name: 'sword',
      desc: '',
      args: [],
    );
  }

  /// `big sword`
  String get bigSword {
    return Intl.message(
      'big sword',
      name: 'bigSword',
      desc: '',
      args: [],
    );
  }

  /// `two handed`
  String get twoHanded {
    return Intl.message(
      'two handed',
      name: 'twoHanded',
      desc: '',
      args: [],
    );
  }

  /// `right hand`
  String get rightHand {
    return Intl.message(
      'right hand',
      name: 'rightHand',
      desc: '',
      args: [],
    );
  }

  /// `first bonus`
  String get firstBonus {
    return Intl.message(
      'first bonus',
      name: 'firstBonus',
      desc: '',
      args: [],
    );
  }

  /// `second bonus`
  String get secondBonus {
    return Intl.message(
      'second bonus',
      name: 'secondBonus',
      desc: '',
      args: [],
    );
  }

  /// `head gear`
  String get headGear {
    return Intl.message(
      'head gear',
      name: 'headGear',
      desc: '',
      args: [],
    );
  }

  /// `armour`
  String get armour {
    return Intl.message(
      'armour',
      name: 'armour',
      desc: '',
      args: [],
    );
  }

  /// `boots`
  String get boots {
    return Intl.message(
      'boots',
      name: 'boots',
      desc: '',
      args: [],
    );
  }

  /// `magic`
  String get magic {
    return Intl.message(
      'magic',
      name: 'magic',
      desc: '',
      args: [],
    );
  }

  /// `big magic`
  String get bigMagic {
    return Intl.message(
      'big magic',
      name: 'bigMagic',
      desc: '',
      args: [],
    );
  }

  /// `helmet`
  String get helmet {
    return Intl.message(
      'helmet',
      name: 'helmet',
      desc: '',
      args: [],
    );
  }

  /// `big helmet`
  String get bigHelmet {
    return Intl.message(
      'big helmet',
      name: 'bigHelmet',
      desc: '',
      args: [],
    );
  }

  /// `big armour`
  String get bigArmour {
    return Intl.message(
      'big armour',
      name: 'bigArmour',
      desc: '',
      args: [],
    );
  }

  /// `big boots`
  String get bigBoots {
    return Intl.message(
      'big boots',
      name: 'bigBoots',
      desc: '',
      args: [],
    );
  }

  /// `enter a word`
  String get enterAWord {
    return Intl.message(
      'enter a word',
      name: 'enterAWord',
      desc: '',
      args: [],
    );
  }

  /// `blank\ntile`
  String get blankTile {
    return Intl.message(
      'blank\ntile',
      name: 'blankTile',
      desc: '',
      args: [],
    );
  }

  /// `\nword`
  String get nWord {
    return Intl.message(
      '\nword',
      name: 'nWord',
      desc: '',
      args: [],
    );
  }

  /// `finish`
  String get finish {
    return Intl.message(
      'finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `each card has a number, determining its value.`
  String get eachCardHasANumberDeterminingItsValue {
    return Intl.message(
      'each card has a number, determining its value.',
      name: 'eachCardHasANumberDeterminingItsValue',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =1{point} other{points}}`
  String pointsCount(int count) {
    return Intl.plural(
      count,
      one: 'point',
      other: 'points',
      name: 'pointsCount',
      desc: '',
      args: [count],
    );
  }

  /// `wild draw two card`
  String get wildDrawTwoCardDosInfo {
    return Intl.message(
      'wild draw two card',
      name: 'wildDrawTwoCardDosInfo',
      desc: '',
      args: [],
    );
  }

  /// `can be any color chosen by the current player. if drawn, the player decides the color.`
  String get canBeAnyColorChosenByTheCurrentPlayerIfDosInfo {
    return Intl.message(
      'can be any color chosen by the current player. if drawn, the player decides the color.',
      name: 'canBeAnyColorChosenByTheCurrentPlayerIfDosInfo',
      desc: '',
      args: [],
    );
  }

  /// `can represent any number for its own particular color.`
  String get canRepresentAnyNumberForItsOwnParticularColorDosInfo {
    return Intl.message(
      'can represent any number for its own particular color.',
      name: 'canRepresentAnyNumberForItsOwnParticularColorDosInfo',
      desc: '',
      args: [],
    );
  }

  /// `wild # card`
  String get wildCardOneDosInfo {
    return Intl.message(
      'wild # card',
      name: 'wildCardOneDosInfo',
      desc: '',
      args: [],
    );
  }

  /// `number cards`
  String get numberCards {
    return Intl.message(
      'number cards',
      name: 'numberCards',
      desc: '',
      args: [],
    );
  }

  /// `reverse card`
  String get reverseCardUnoInfo {
    return Intl.message(
      'reverse card',
      name: 'reverseCardUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `changes the direction of play.`
  String get changesTheDirectionOfPlayUnoInfo {
    return Intl.message(
      'changes the direction of play.',
      name: 'changesTheDirectionOfPlayUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `skip card`
  String get skipCardUnoInfo {
    return Intl.message(
      'skip card',
      name: 'skipCardUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `draw two card`
  String get drawTwoCardUnoInfo {
    return Intl.message(
      'draw two card',
      name: 'drawTwoCardUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `wild card`
  String get wildCardUnoInfo {
    return Intl.message(
      'wild card',
      name: 'wildCardUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `wild shuffle hands card`
  String get wildShuffleHandsCardUnoInfo {
    return Intl.message(
      'wild shuffle hands card',
      name: 'wildShuffleHandsCardUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `wild draw four card`
  String get wildDrawFourCardUnoInfo {
    return Intl.message(
      'wild draw four card',
      name: 'wildDrawFourCardUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `skips the next player's turn.`
  String get skipsTheNextPlayersTurnUnoInfo {
    return Intl.message(
      'skips the next player\'s turn.',
      name: 'skipsTheNextPlayersTurnUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `next player draws two cards and loses their turn.`
  String get nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo {
    return Intl.message(
      'next player draws two cards and loses their turn.',
      name: 'nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `allows the player to choose the color.`
  String get allowsThePlayerToChooseTheColorUnoInfo {
    return Intl.message(
      'allows the player to choose the color.',
      name: 'allowsThePlayerToChooseTheColorUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `changes the color and forces the next player to draw four cards.`
  String get changesTheColorAndForcesTheNextPlayerToDrawUnoInfo {
    return Intl.message(
      'changes the color and forces the next player to draw four cards.',
      name: 'changesTheColorAndForcesTheNextPlayerToDrawUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `swap hands with any player and choose the color.`
  String get swapHandsWithAnyPlayerAndChooseTheColorUnoInfo {
    return Intl.message(
      'swap hands with any player and choose the color.',
      name: 'swapHandsWithAnyPlayerAndChooseTheColorUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `each card has a number from 0 to 9, which determines its value.`
  String get eachCardHasANumberFrom0To9WhichUnoInfo {
    return Intl.message(
      'each card has a number from 0 to 9, which determines its value.',
      name: 'eachCardHasANumberFrom0To9WhichUnoInfo',
      desc: '',
      args: [],
    );
  }

  /// `doubles the value of a letter`
  String get doublesTheValueOfALetterScrabbleInfo {
    return Intl.message(
      'doubles the value of a letter',
      name: 'doublesTheValueOfALetterScrabbleInfo',
      desc: '',
      args: [],
    );
  }

  /// `triple the value of a letter`
  String get tripleTheValueOfALetterScrabbleInfo {
    return Intl.message(
      'triple the value of a letter',
      name: 'tripleTheValueOfALetterScrabbleInfo',
      desc: '',
      args: [],
    );
  }

  /// `bonus tile or special marker`
  String get bonusTileOrSpecialMarkerScrabbleInfo {
    return Intl.message(
      'bonus tile or special marker',
      name: 'bonusTileOrSpecialMarkerScrabbleInfo',
      desc: '',
      args: [],
    );
  }

  /// `doubles the value of an entire word`
  String get doublesTheValueOfAnEntireWordScrabbleInfo {
    return Intl.message(
      'doubles the value of an entire word',
      name: 'doublesTheValueOfAnEntireWordScrabbleInfo',
      desc: '',
      args: [],
    );
  }

  /// `triple the value of an entire word`
  String get tripleTheValueOfAnEntireWordScrabbleInfo {
    return Intl.message(
      'triple the value of an entire word',
      name: 'tripleTheValueOfAnEntireWordScrabbleInfo',
      desc: '',
      args: [],
    );
  }

  /// `next player draws 1 card and skips turn.`
  String get nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo {
    return Intl.message(
      'next player draws 1 card and skips turn.',
      name: 'nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `draw one`
  String get drawOneUnoFlipInfo {
    return Intl.message(
      'draw one',
      name: 'drawOneUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `flip card`
  String get flipCardUnoFlipInfo {
    return Intl.message(
      'flip card',
      name: 'flipCardUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `flips all cards to the opposite side.`
  String get flipsAllCardsToTheOppositeSideUnoFlipInfo {
    return Intl.message(
      'flips all cards to the opposite side.',
      name: 'flipsAllCardsToTheOppositeSideUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `draw five`
  String get drawFiveUnoFlipInfo {
    return Intl.message(
      'draw five',
      name: 'drawFiveUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `next player draws 5 cards and skips turn.`
  String get nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo {
    return Intl.message(
      'next player draws 5 cards and skips turn.',
      name: 'nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `skip everyone card`
  String get skipEveryoneCardUnoFlipInfo {
    return Intl.message(
      'skip everyone card',
      name: 'skipEveryoneCardUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `skips all players and returns turn to the original player.`
  String get skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo {
    return Intl.message(
      'skips all players and returns turn to the original player.',
      name: 'skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `wild draw color`
  String get wildDrawColorUnoFlipInfo {
    return Intl.message(
      'wild draw color',
      name: 'wildDrawColorUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `next player draws until they get the chosen color.`
  String get nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo {
    return Intl.message(
      'next player draws until they get the chosen color.',
      name: 'nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo',
      desc: '',
      args: [],
    );
  }

  /// `marks a dead character`
  String get marksADeadCharacterInfo {
    return Intl.message(
      'marks a dead character',
      name: 'marksADeadCharacterInfo',
      desc: '',
      args: [],
    );
  }

  /// `character's gender: male`
  String get charactersGenderMaleInfo {
    return Intl.message(
      'character\'s gender: male',
      name: 'charactersGenderMaleInfo',
      desc: '',
      args: [],
    );
  }

  /// `character's gender: female`
  String get charactersGenderFemaleInfo {
    return Intl.message(
      'character\'s gender: female',
      name: 'charactersGenderFemaleInfo',
      desc: '',
      args: [],
    );
  }

  /// `cursed`
  String get cursed {
    return Intl.message(
      'cursed',
      name: 'cursed',
      desc: '',
      args: [],
    );
  }

  /// `clearance`
  String get clearance {
    return Intl.message(
      'clearance',
      name: 'clearance',
      desc: '',
      args: [],
    );
  }

  /// `indicates an active curse`
  String get indicatesAnActiveCurse {
    return Intl.message(
      'indicates an active curse',
      name: 'indicatesAnActiveCurse',
      desc: '',
      args: [],
    );
  }

  /// `possibly the removal of curses or debuffs`
  String get possiblyTheRemovalOfCursesOrDebuffs {
    return Intl.message(
      'possibly the removal of curses or debuffs',
      name: 'possiblyTheRemovalOfCursesOrDebuffs',
      desc: '',
      args: [],
    );
  }

  /// `buffs or debuffs affecting characters/items`
  String get buffsOrDebuffsAffectingCharactersitemsInfo {
    return Intl.message(
      'buffs or debuffs affecting characters/items',
      name: 'buffsOrDebuffsAffectingCharactersitemsInfo',
      desc: '',
      args: [],
    );
  }

  /// `thanks to everyone who created`
  String get toAllWhoCreatedThe {
    return Intl.message(
      'thanks to everyone who created',
      name: 'toAllWhoCreatedThe',
      desc: '',
      args: [],
    );
  }

  /// `credits`
  String get appreciation {
    return Intl.message(
      'credits',
      name: 'appreciation',
      desc: '',
      args: [],
    );
  }

  /// `board buddy's contributors`
  String get toBoardBuddysContributors {
    return Intl.message(
      'board buddy\'s contributors',
      name: 'toBoardBuddysContributors',
      desc: '',
      args: [],
    );
  }

  /// `play`
  String get play {
    return Intl.message(
      'play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `mode`
  String get mode {
    return Intl.message(
      'mode',
      name: 'mode',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `lowest score wins`
  String get lowestScoreWins {
    return Intl.message(
      'lowest score wins',
      name: 'lowestScoreWins',
      desc: '',
      args: [],
    );
  }

  /// `highest score wins`
  String get highestScoreWins {
    return Intl.message(
      'highest score wins',
      name: 'highestScoreWins',
      desc: '',
      args: [],
    );
  }

  /// `multiplayer`
  String get multiplayer {
    return Intl.message(
      'multiplayer',
      name: 'multiplayer',
      desc: '',
      args: [],
    );
  }

  /// `singleplayer`
  String get singleplayer {
    return Intl.message(
      'singleplayer',
      name: 'singleplayer',
      desc: '',
      args: [],
    );
  }

  /// `score`
  String get score {
    return Intl.message(
      'score',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `player name`
  String get playerName {
    return Intl.message(
      'player name',
      name: 'playerName',
      desc: '',
      args: [],
    );
  }

  /// `the number of players should be`
  String get theNumberOfPlayersShouldBe {
    return Intl.message(
      'the number of players should be',
      name: 'theNumberOfPlayersShouldBe',
      desc: '',
      args: [],
    );
  }

  /// `game up to: `
  String get gameUpTo {
    return Intl.message(
      'game up to: ',
      name: 'gameUpTo',
      desc: '',
      args: [],
    );
  }

  /// `game over`
  String get gameOver {
    return Intl.message(
      'game over',
      name: 'gameOver',
      desc: '',
      args: [],
    );
  }

  /// `continue game`
  String get continueGame {
    return Intl.message(
      'continue game',
      name: 'continueGame',
      desc: '',
      args: [],
    );
  }

  /// `another round`
  String get newGameWithSamePlayers {
    return Intl.message(
      'another round',
      name: 'newGameWithSamePlayers',
      desc: '',
      args: [],
    );
  }

  /// `new game`
  String get newGame {
    return Intl.message(
      'new game',
      name: 'newGame',
      desc: '',
      args: [],
    );
  }

  /// `return to menu`
  String get returnToMenu {
    return Intl.message(
      'return to menu',
      name: 'returnToMenu',
      desc: '',
      args: [],
    );
  }

  /// `winner: `
  String get winner {
    return Intl.message(
      'winner: ',
      name: 'winner',
      desc: '',
      args: [],
    );
  }

  /// `you have an unfinished game`
  String get youHaveAnUnfinishedGame {
    return Intl.message(
      'you have an unfinished game',
      name: 'youHaveAnUnfinishedGame',
      desc: '',
      args: [],
    );
  }

  /// `return`
  String get doReturn {
    return Intl.message(
      'return',
      name: 'doReturn',
      desc: '',
      args: [],
    );
  }

  /// `each card has a number from 1 to 9, which determines its value.`
  String get eachCardHasANumberFrom1To9Which {
    return Intl.message(
      'each card has a number from 1 to 9, which determines its value.',
      name: 'eachCardHasANumberFrom1To9Which',
      desc: '',
      args: [],
    );
  }

  /// `flip side`
  String get flipSide {
    return Intl.message(
      'flip side',
      name: 'flipSide',
      desc: '',
      args: [],
    );
  }

  /// `dark side cards are replaced with light ones and vice versa.`
  String get darkSideCardsAreReplacedWithLightOnesAndVice {
    return Intl.message(
      'dark side cards are replaced with light ones and vice versa.',
      name: 'darkSideCardsAreReplacedWithLightOnesAndVice',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continueTitle {
    return Intl.message(
      'continue',
      name: 'continueTitle',
      desc: '',
      args: [],
    );
  }

  /// `adding`
  String get adding {
    return Intl.message(
      'adding',
      name: 'adding',
      desc: '',
      args: [],
    );
  }

  /// `subtracting`
  String get subtracting {
    return Intl.message(
      'subtracting',
      name: 'subtracting',
      desc: '',
      args: [],
    );
  }

  /// `move history`
  String get moveHistory {
    return Intl.message(
      'move history',
      name: 'moveHistory',
      desc: '',
      args: [],
    );
  }

  /// `word modifier: `
  String get wordModifier {
    return Intl.message(
      'word modifier: ',
      name: 'wordModifier',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `x2 word`
  String get x2Word {
    return Intl.message(
      'x2 word',
      name: 'x2Word',
      desc: '',
      args: [],
    );
  }

  /// `x3 word`
  String get x3Word {
    return Intl.message(
      'x3 word',
      name: 'x3Word',
      desc: '',
      args: [],
    );
  }

  /// `menu`
  String get menu {
    return Intl.message(
      'menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `could not launch`
  String get couldNotLaunch {
    return Intl.message(
      'could not launch',
      name: 'couldNotLaunch',
      desc: '',
      args: [],
    );
  }

  /// `share with friedns`
  String get shareWithFriedns {
    return Intl.message(
      'share with friedns',
      name: 'shareWithFriedns',
      desc: '',
      args: [],
    );
  }

  /// `board buddy is your ultimate board game companion`
  String get boardBuddyIsYourUltimateBoardGameCompanion {
    return Intl.message(
      'board buddy is your ultimate board game companion',
      name: 'boardBuddyIsYourUltimateBoardGameCompanion',
      desc: '',
      args: [],
    );
  }

  /// `bingo`
  String get bingo {
    return Intl.message(
      'bingo',
      name: 'bingo',
      desc: '',
      args: [],
    );
  }

  /// `score 50 extra points for using all 7 tiles`
  String get score50ExtraPointsForUsingAll7Tiles {
    return Intl.message(
      'score 50 extra points for using all 7 tiles',
      name: 'score50ExtraPointsForUsingAll7Tiles',
      desc: '',
      args: [],
    );
  }

  /// `keep awake mode`
  String get keepAwakeMode {
    return Intl.message(
      'keep awake mode',
      name: 'keepAwakeMode',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `off`
  String get off {
    return Intl.message(
      'off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `my other apps`
  String get myOtherApps {
    return Intl.message(
      'my other apps',
      name: 'myOtherApps',
      desc: '',
      args: [],
    );
  }

  /// `german`
  String get german {
    return Intl.message(
      'german',
      name: 'german',
      desc: '',
      args: [],
    );
  }

  /// `french`
  String get french {
    return Intl.message(
      'french',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `spanish`
  String get spanish {
    return Intl.message(
      'spanish',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `options`
  String get options {
    return Intl.message(
      'options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `contract resolution:`
  String get contractResolution {
    return Intl.message(
      'contract resolution:',
      name: 'contractResolution',
      desc: '',
      args: [],
    );
  }

  /// `marriage:`
  String get marriage {
    return Intl.message(
      'marriage:',
      name: 'marriage',
      desc: '',
      args: [],
    );
  }

  /// `bidding phase:`
  String get biddingPhase {
    return Intl.message(
      'bidding phase:',
      name: 'biddingPhase',
      desc: '',
      args: [],
    );
  }

  /// `the goal is to be the first player to reach 1000 points by winning tricks in a bidding game. players bid on how many points they can score, then try to fulfill their contract.`
  String get thousandGoal {
    return Intl.message(
      'the goal is to be the first player to reach 1000 points by winning tricks in a bidding game. players bid on how many points they can score, then try to fulfill their contract.',
      name: 'thousandGoal',
      desc: '',
      args: [],
    );
  }

  /// `use a 24-card deck: 9, 10, jack, queen, king, ace of all four suits.`
  String get thousandPreparationOne {
    return Intl.message(
      'use a 24-card deck: 9, 10, jack, queen, king, ace of all four suits.',
      name: 'thousandPreparationOne',
      desc: '',
      args: [],
    );
  }

  /// `deal 7 cards to each player (for 3 players), or 8 cards (for 2 players).`
  String get thousandPreparationTwo {
    return Intl.message(
      'deal 7 cards to each player (for 3 players), or 8 cards (for 2 players).',
      name: 'thousandPreparationTwo',
      desc: '',
      args: [],
    );
  }

  /// `place 3 cards face down in the center as the talon (widow).`
  String get thousandPreparationThree {
    return Intl.message(
      'place 3 cards face down in the center as the talon (widow).',
      name: 'thousandPreparationThree',
      desc: '',
      args: [],
    );
  }

  /// `starting with the player after the dealer, players bid on how many points they think they can score (minimum bid is 100). each bid must be higher than the previous bid (in increments of 5 or 10).`
  String get thousandBiddingPhaseOne {
    return Intl.message(
      'starting with the player after the dealer, players bid on how many points they think they can score (minimum bid is 100). each bid must be higher than the previous bid (in increments of 5 or 10).',
      name: 'thousandBiddingPhaseOne',
      desc: '',
      args: [],
    );
  }

  /// `players can pass if they don't want to bid higher.`
  String get thousandBiddingPhaseTwo {
    return Intl.message(
      'players can pass if they don\'t want to bid higher.',
      name: 'thousandBiddingPhaseTwo',
      desc: '',
      args: [],
    );
  }

  /// `the player with the highest bid wins the auction, takes the talon, and declares trump suit. the bidder discards 3 cards face down (but keeps their point value).`
  String get thousandBiddingPhaseThree {
    return Intl.message(
      'the player with the highest bid wins the auction, takes the talon, and declares trump suit. the bidder discards 3 cards face down (but keeps their point value).',
      name: 'thousandBiddingPhaseThree',
      desc: '',
      args: [],
    );
  }

  /// `a marriage is a king and queen of the same suit in your hand.`
  String get thousandMarriageOne {
    return Intl.message(
      'a marriage is a king and queen of the same suit in your hand.',
      name: 'thousandMarriageOne',
      desc: '',
      args: [],
    );
  }

  /// `trump marriage: 100 points (must be declared when playing the first card of the pair).`
  String get thousandMarriageTwo {
    return Intl.message(
      'trump marriage: 100 points (must be declared when playing the first card of the pair).',
      name: 'thousandMarriageTwo',
      desc: '',
      args: [],
    );
  }

  /// `non-trump marriage: 80 points (same rule applies).`
  String get thousandMarriageThree {
    return Intl.message(
      'non-trump marriage: 80 points (same rule applies).',
      name: 'thousandMarriageThree',
      desc: '',
      args: [],
    );
  }

  /// `you can only score marriages if you win at least one trick.`
  String get thousandMarriageFour {
    return Intl.message(
      'you can only score marriages if you win at least one trick.',
      name: 'thousandMarriageFour',
      desc: '',
      args: [],
    );
  }

  /// `the bidder leads the first trick by playing any card. other players must follow suit if possible. if they cannot, they must play a trump card if they have one.`
  String get thousandGameTurnTitleOne {
    return Intl.message(
      'the bidder leads the first trick by playing any card. other players must follow suit if possible. if they cannot, they must play a trump card if they have one.',
      name: 'thousandGameTurnTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `the highest card of the led suit wins, unless a trump is played. the highest trump wins.`
  String get thousandGameTurnTitleTwo {
    return Intl.message(
      'the highest card of the led suit wins, unless a trump is played. the highest trump wins.',
      name: 'thousandGameTurnTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `the winner of the trick leads the next trick. continue until all cards are played.`
  String get thousandGameTurnTitleThree {
    return Intl.message(
      'the winner of the trick leads the next trick. continue until all cards are played.',
      name: 'thousandGameTurnTitleThree',
      desc: '',
      args: [],
    );
  }

  /// `ace: 11 points`
  String get ace11Points {
    return Intl.message(
      'ace: 11 points',
      name: 'ace11Points',
      desc: '',
      args: [],
    );
  }

  /// `ten: 10 points`
  String get ten10Points {
    return Intl.message(
      'ten: 10 points',
      name: 'ten10Points',
      desc: '',
      args: [],
    );
  }

  /// `king: 4 points`
  String get king4Points {
    return Intl.message(
      'king: 4 points',
      name: 'king4Points',
      desc: '',
      args: [],
    );
  }

  /// `queen: 3 points`
  String get queen3Points {
    return Intl.message(
      'queen: 3 points',
      name: 'queen3Points',
      desc: '',
      args: [],
    );
  }

  /// `jack: 2 points`
  String get jack2Points {
    return Intl.message(
      'jack: 2 points',
      name: 'jack2Points',
      desc: '',
      args: [],
    );
  }

  /// `nine: 0 points`
  String get nine0Points {
    return Intl.message(
      'nine: 0 points',
      name: 'nine0Points',
      desc: '',
      args: [],
    );
  }

  /// `total points in deck: 120. add marriage bonuses if applicable.`
  String get thousandTotalPoints {
    return Intl.message(
      'total points in deck: 120. add marriage bonuses if applicable.',
      name: 'thousandTotalPoints',
      desc: '',
      args: [],
    );
  }

  /// `if the bidder scores at least their bid amount: they add their actual score to their total.`
  String get thousandContractResolutionOne {
    return Intl.message(
      'if the bidder scores at least their bid amount: they add their actual score to their total.',
      name: 'thousandContractResolutionOne',
      desc: '',
      args: [],
    );
  }

  /// `if the bidder fails to meet their bid: their bid amount is subtracted from their total (they can go negative).`
  String get thousandContractResolutionTwo {
    return Intl.message(
      'if the bidder fails to meet their bid: their bid amount is subtracted from their total (they can go negative).',
      name: 'thousandContractResolutionTwo',
      desc: '',
      args: [],
    );
  }

  /// `other players add the points from tricks they won to their totals.`
  String get thousandContractResolutionThree {
    return Intl.message(
      'other players add the points from tricks they won to their totals.',
      name: 'thousandContractResolutionThree',
      desc: '',
      args: [],
    );
  }

  /// `barrel rule: if a player reaches 880+ points, they are "on the barrel" and must score exactly to 1000, or else drop back to 880.`
  String get thousandSpecialRulesTitleOne {
    return Intl.message(
      'barrel rule: if a player reaches 880+ points, they are "on the barrel" and must score exactly to 1000, or else drop back to 880.',
      name: 'thousandSpecialRulesTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `some variants require exactly 1000 points to win. going over resets you to 880 or previous score.`
  String get thousandSpecialRulesTitleTwo {
    return Intl.message(
      'some variants require exactly 1000 points to win. going over resets you to 880 or previous score.',
      name: 'thousandSpecialRulesTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `the first player to reach 1000 points (or exactly 1000, depending on house rules) wins the game.`
  String get thousandVictoryRule {
    return Intl.message(
      'the first player to reach 1000 points (or exactly 1000, depending on house rules) wins the game.',
      name: 'thousandVictoryRule',
      desc: '',
      args: [],
    );
  }

  /// `current count:`
  String get currentCount {
    return Intl.message(
      'current count:',
      name: 'currentCount',
      desc: '',
      args: [],
    );
  }

  /// `current bet:`
  String get currentBet {
    return Intl.message(
      'current bet:',
      name: 'currentBet',
      desc: '',
      args: [],
    );
  }

  /// `pass`
  String get pass {
    return Intl.message(
      'pass',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `ace`
  String get ace {
    return Intl.message(
      'ace',
      name: 'ace',
      desc: '',
      args: [],
    );
  }

  /// `king`
  String get king {
    return Intl.message(
      'king',
      name: 'king',
      desc: '',
      args: [],
    );
  }

  /// `queen`
  String get queen {
    return Intl.message(
      'queen',
      name: 'queen',
      desc: '',
      args: [],
    );
  }

  /// `jack`
  String get jack {
    return Intl.message(
      'jack',
      name: 'jack',
      desc: '',
      args: [],
    );
  }

  /// `did reach`
  String get didYouEnter {
    return Intl.message(
      'did reach',
      name: 'didYouEnter',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `your bet`
  String get yourBet {
    return Intl.message(
      'your bet',
      name: 'yourBet',
      desc: '',
      args: [],
    );
  }

  /// `clear`
  String get clear {
    return Intl.message(
      'clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `points confirmed`
  String get pointsConfirmed {
    return Intl.message(
      'points confirmed',
      name: 'pointsConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `who deals first?`
  String get whoGoesFirst {
    return Intl.message(
      'who deals first?',
      name: 'whoGoesFirst',
      desc: '',
      args: [],
    );
  }

  /// `did {playerName} reach their bid ({winningBid} points)?`
  String didPlayerReachBid(String playerName, int winningBid) {
    return Intl.message(
      'did $playerName reach their bid ($winningBid points)?',
      name: 'didPlayerReachBid',
      desc: '',
      args: [playerName, winningBid],
    );
  }

  /// `player on barrel:`
  String get playerOnBarrel {
    return Intl.message(
      'player on barrel:',
      name: 'playerOnBarrel',
      desc: '',
      args: [],
    );
  }

  /// `players on barrel:`
  String get playersOnBarrel {
    return Intl.message(
      'players on barrel:',
      name: 'playersOnBarrel',
      desc: '',
      args: [],
    );
  }

  /// `catan`
  String get catan {
    return Intl.message(
      'catan',
      name: 'catan',
      desc: '',
      args: [],
    );
  }

  /// `be the first player to reach 10 victory points by building settlements, cities, roads, and earning special cards.`
  String get catanGameGoal {
    return Intl.message(
      'be the first player to reach 10 victory points by building settlements, cities, roads, and earning special cards.',
      name: 'catanGameGoal',
      desc: '',
      args: [],
    );
  }

  /// `19 terrain hexes (4 forest, 4 grain, 4 pasture, 3 mountains, 3 hills, 1 desert)`
  String get catanComponentsOne {
    return Intl.message(
      '19 terrain hexes (4 forest, 4 grain, 4 pasture, 3 mountains, 3 hills, 1 desert)',
      name: 'catanComponentsOne',
      desc: '',
      args: [],
    );
  }

  /// `6 sea frame pieces`
  String get catanComponentsTwo {
    return Intl.message(
      '6 sea frame pieces',
      name: 'catanComponentsTwo',
      desc: '',
      args: [],
    );
  }

  /// `9 harbor pieces`
  String get catanComponentsThree {
    return Intl.message(
      '9 harbor pieces',
      name: 'catanComponentsThree',
      desc: '',
      args: [],
    );
  }

  /// `18 number tokens`
  String get catanComponentsFour {
    return Intl.message(
      '18 number tokens',
      name: 'catanComponentsFour',
      desc: '',
      args: [],
    );
  }

  /// `95 resource cards (19 each: lumber, brick, wool, grain, ore)`
  String get catanComponentsFive {
    return Intl.message(
      '95 resource cards (19 each: lumber, brick, wool, grain, ore)',
      name: 'catanComponentsFive',
      desc: '',
      args: [],
    );
  }

  /// `25 development cards`
  String get catanComponentsSix {
    return Intl.message(
      '25 development cards',
      name: 'catanComponentsSix',
      desc: '',
      args: [],
    );
  }

  /// `player pieces: 5 settlements, 4 cities, 15 roads per player`
  String get catanComponentsSeven {
    return Intl.message(
      'player pieces: 5 settlements, 4 cities, 15 roads per player',
      name: 'catanComponentsSeven',
      desc: '',
      args: [],
    );
  }

  /// `2 special cards: longest road, largest army`
  String get catanComponentsEight {
    return Intl.message(
      '2 special cards: longest road, largest army',
      name: 'catanComponentsEight',
      desc: '',
      args: [],
    );
  }

  /// `1 robber, 2 dice`
  String get catanComponentsNine {
    return Intl.message(
      '1 robber, 2 dice',
      name: 'catanComponentsNine',
      desc: '',
      args: [],
    );
  }

  /// `assemble the board with terrain hexes inside the sea frame`
  String get catanPreparationOne {
    return Intl.message(
      'assemble the board with terrain hexes inside the sea frame',
      name: 'catanPreparationOne',
      desc: '',
      args: [],
    );
  }

  /// `place number tokens on hexes (except desert)`
  String get catanPreparationTwo {
    return Intl.message(
      'place number tokens on hexes (except desert)',
      name: 'catanPreparationTwo',
      desc: '',
      args: [],
    );
  }

  /// `place the robber on the desert hex`
  String get catanPreparationThree {
    return Intl.message(
      'place the robber on the desert hex',
      name: 'catanPreparationThree',
      desc: '',
      args: [],
    );
  }

  /// `each player places 2 settlements and 2 roads in reverse turn order`
  String get catanPreparationFour {
    return Intl.message(
      'each player places 2 settlements and 2 roads in reverse turn order',
      name: 'catanPreparationFour',
      desc: '',
      args: [],
    );
  }

  /// `resources:`
  String get resources {
    return Intl.message(
      'resources:',
      name: 'resources',
      desc: '',
      args: [],
    );
  }

  /// `forest – lumber (wood)`
  String get catanResourcesOne {
    return Intl.message(
      'forest – lumber (wood)',
      name: 'catanResourcesOne',
      desc: '',
      args: [],
    );
  }

  /// `hills – brick (clay)`
  String get catanResourcesTwo {
    return Intl.message(
      'hills – brick (clay)',
      name: 'catanResourcesTwo',
      desc: '',
      args: [],
    );
  }

  /// `pasture – wool (sheep)`
  String get catanResourcesTree {
    return Intl.message(
      'pasture – wool (sheep)',
      name: 'catanResourcesTree',
      desc: '',
      args: [],
    );
  }

  /// `fields – grain (wheat)`
  String get catanResourcesFour {
    return Intl.message(
      'fields – grain (wheat)',
      name: 'catanResourcesFour',
      desc: '',
      args: [],
    );
  }

  /// `mountains – ore`
  String get catanResourcesFive {
    return Intl.message(
      'mountains – ore',
      name: 'catanResourcesFive',
      desc: '',
      args: [],
    );
  }

  /// `desert – no resources`
  String get catanResourcesSix {
    return Intl.message(
      'desert – no resources',
      name: 'catanResourcesSix',
      desc: '',
      args: [],
    );
  }

  /// `roll dice: all players with settlements/cities on hexes matching the number receive resources`
  String get catanGameTurnOne {
    return Intl.message(
      'roll dice: all players with settlements/cities on hexes matching the number receive resources',
      name: 'catanGameTurnOne',
      desc: '',
      args: [],
    );
  }

  /// `trade: exchange resources with other players or use harbors (4:1 or special rates)`
  String get catanGameTurnTwo {
    return Intl.message(
      'trade: exchange resources with other players or use harbors (4:1 or special rates)',
      name: 'catanGameTurnTwo',
      desc: '',
      args: [],
    );
  }

  /// `build: spend resources to construct roads, settlements, cities, or buy development cards`
  String get catanGameTurnThree {
    return Intl.message(
      'build: spend resources to construct roads, settlements, cities, or buy development cards',
      name: 'catanGameTurnThree',
      desc: '',
      args: [],
    );
  }

  /// `building costs:`
  String get buildingCosts {
    return Intl.message(
      'building costs:',
      name: 'buildingCosts',
      desc: '',
      args: [],
    );
  }

  /// `road: 1 lumber + 1 brick`
  String get catanBuildingCostsOne {
    return Intl.message(
      'road: 1 lumber + 1 brick',
      name: 'catanBuildingCostsOne',
      desc: '',
      args: [],
    );
  }

  /// `settlement: 1 lumber + 1 brick + 1 wool + 1 grain (1)`
  String get catanBuildingCostsTwo {
    return Intl.message(
      'settlement: 1 lumber + 1 brick + 1 wool + 1 grain (1)',
      name: 'catanBuildingCostsTwo',
      desc: '',
      args: [],
    );
  }

  /// `city (upgrade): 2 grain + 3 ore (2)`
  String get catanBuildingCostsThree {
    return Intl.message(
      'city (upgrade): 2 grain + 3 ore (2)',
      name: 'catanBuildingCostsThree',
      desc: '',
      args: [],
    );
  }

  /// `development card: 1 wool + 1 grain + 1 ore`
  String get catanBuildingCostsFour {
    return Intl.message(
      'development card: 1 wool + 1 grain + 1 ore',
      name: 'catanBuildingCostsFour',
      desc: '',
      args: [],
    );
  }

  /// `development cards:`
  String get developmentCards {
    return Intl.message(
      'development cards:',
      name: 'developmentCards',
      desc: '',
      args: [],
    );
  }

  /// `knight (14): move robber, steal 1 resource from adjacent player`
  String get catanDevelopmentCardsOne {
    return Intl.message(
      'knight (14): move robber, steal 1 resource from adjacent player',
      name: 'catanDevelopmentCardsOne',
      desc: '',
      args: [],
    );
  }

  /// `victory point (5): worth 1, keep hidden until winning`
  String get catanDevelopmentCardsTwo {
    return Intl.message(
      'victory point (5): worth 1, keep hidden until winning',
      name: 'catanDevelopmentCardsTwo',
      desc: '',
      args: [],
    );
  }

  /// `road building (2): build 2 roads for free`
  String get catanDevelopmentCardsThree {
    return Intl.message(
      'road building (2): build 2 roads for free',
      name: 'catanDevelopmentCardsThree',
      desc: '',
      args: [],
    );
  }

  /// `monopoly (2): name a resource, all players give you theirs`
  String get catanDevelopmentCardsFour {
    return Intl.message(
      'monopoly (2): name a resource, all players give you theirs',
      name: 'catanDevelopmentCardsFour',
      desc: '',
      args: [],
    );
  }

  /// `the robber (rolling 7):`
  String get theRobberRolling7 {
    return Intl.message(
      'the robber (rolling 7):',
      name: 'theRobberRolling7',
      desc: '',
      args: [],
    );
  }

  /// `any player with more than 7 cards must discard half (rounded down)`
  String get catanTheRobberRolling7One {
    return Intl.message(
      'any player with more than 7 cards must discard half (rounded down)',
      name: 'catanTheRobberRolling7One',
      desc: '',
      args: [],
    );
  }

  /// `move the robber to any hex (except desert)`
  String get catanTheRobberRolling7Two {
    return Intl.message(
      'move the robber to any hex (except desert)',
      name: 'catanTheRobberRolling7Two',
      desc: '',
      args: [],
    );
  }

  /// `steal 1 random resource from a player with a settlement/city on that hex`
  String get catanTheRobberRolling7Three {
    return Intl.message(
      'steal 1 random resource from a player with a settlement/city on that hex',
      name: 'catanTheRobberRolling7Three',
      desc: '',
      args: [],
    );
  }

  /// `the blocked hex produces no resources while robber is there`
  String get catanTheRobberRolling7Four {
    return Intl.message(
      'the blocked hex produces no resources while robber is there',
      name: 'catanTheRobberRolling7Four',
      desc: '',
      args: [],
    );
  }

  /// `special cards (2 each):`
  String get specialCards2VpEach {
    return Intl.message(
      'special cards (2 each):',
      name: 'specialCards2VpEach',
      desc: '',
      args: [],
    );
  }

  /// `longest road: first player with 5+ continuous roads (can be stolen)`
  String get catanSpecialCards2VpEachOne {
    return Intl.message(
      'longest road: first player with 5+ continuous roads (can be stolen)',
      name: 'catanSpecialCards2VpEachOne',
      desc: '',
      args: [],
    );
  }

  /// `largest army: first player with 3+ played knight cards (can be stolen)`
  String get catanSpecialCards2VpEachTwo {
    return Intl.message(
      'largest army: first player with 3+ played knight cards (can be stolen)',
      name: 'catanSpecialCards2VpEachTwo',
      desc: '',
      args: [],
    );
  }

  /// `building rules:`
  String get buildingRules {
    return Intl.message(
      'building rules:',
      name: 'buildingRules',
      desc: '',
      args: [],
    );
  }

  /// `roads must connect to your existing roads, settlements, or cities`
  String get catanBuildingRulesOne {
    return Intl.message(
      'roads must connect to your existing roads, settlements, or cities',
      name: 'catanBuildingRulesOne',
      desc: '',
      args: [],
    );
  }

  /// `settlements must be at least 2 intersections away from any other settlement/city`
  String get catanBuildingRulesTwo {
    return Intl.message(
      'settlements must be at least 2 intersections away from any other settlement/city',
      name: 'catanBuildingRulesTwo',
      desc: '',
      args: [],
    );
  }

  /// `settlements must connect to your road network`
  String get catanBuildingRulesThree {
    return Intl.message(
      'settlements must connect to your road network',
      name: 'catanBuildingRulesThree',
      desc: '',
      args: [],
    );
  }

  /// `cities replace existing settlements`
  String get catanBuildingRulesFour {
    return Intl.message(
      'cities replace existing settlements',
      name: 'catanBuildingRulesFour',
      desc: '',
      args: [],
    );
  }

  /// `trading:`
  String get trading {
    return Intl.message(
      'trading:',
      name: 'trading',
      desc: '',
      args: [],
    );
  }

  /// `domestic trade: negotiate any exchange with other players on your turn`
  String get catanTradingOne {
    return Intl.message(
      'domestic trade: negotiate any exchange with other players on your turn',
      name: 'catanTradingOne',
      desc: '',
      args: [],
    );
  }

  /// `maritime trade: 4:1 with bank (any 4 same resources for 1)`
  String get catanTradingTwo {
    return Intl.message(
      'maritime trade: 4:1 with bank (any 4 same resources for 1)',
      name: 'catanTradingTwo',
      desc: '',
      args: [],
    );
  }

  /// `harbor trade: 3:1 generic or 2:1 specific resource harbors`
  String get catanTradingThree {
    return Intl.message(
      'harbor trade: 3:1 generic or 2:1 specific resource harbors',
      name: 'catanTradingThree',
      desc: '',
      args: [],
    );
  }

  /// `settlement: 1`
  String get catanScoringOne {
    return Intl.message(
      'settlement: 1',
      name: 'catanScoringOne',
      desc: '',
      args: [],
    );
  }

  /// `city: 2`
  String get catanScoringTwo {
    return Intl.message(
      'city: 2',
      name: 'catanScoringTwo',
      desc: '',
      args: [],
    );
  }

  /// `longest road: 2`
  String get catanScoringThree {
    return Intl.message(
      'longest road: 2',
      name: 'catanScoringThree',
      desc: '',
      args: [],
    );
  }

  /// `largest army: 2`
  String get catanScoringFour {
    return Intl.message(
      'largest army: 2',
      name: 'catanScoringFour',
      desc: '',
      args: [],
    );
  }

  /// `victory point cards: 1 each`
  String get catanScoringFive {
    return Intl.message(
      'victory point cards: 1 each',
      name: 'catanScoringFive',
      desc: '',
      args: [],
    );
  }

  /// `the first player to reach 10 victory points on their turn wins the game. you must announce your victory on your turn.`
  String get catanVictoryRule {
    return Intl.message(
      'the first player to reach 10 victory points on their turn wins the game. you must announce your victory on your turn.',
      name: 'catanVictoryRule',
      desc: '',
      args: [],
    );
  }

  /// `catan® is a trademark of catan gmbh.`
  String get catanTrademarkNotice {
    return Intl.message(
      'catan® is a trademark of catan gmbh.',
      name: 'catanTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `word is too long. maximum 15 letters allowed`
  String get wordIsTooLongMaximum15LettersAllowed {
    return Intl.message(
      'word is too long. maximum 15 letters allowed',
      name: 'wordIsTooLongMaximum15LettersAllowed',
      desc: '',
      args: [],
    );
  }

  /// `settlement`
  String get settlement {
    return Intl.message(
      'settlement',
      name: 'settlement',
      desc: '',
      args: [],
    );
  }

  /// `build a new settlement on an intersection`
  String get buildANewSettlementOnAnIntersection {
    return Intl.message(
      'build a new settlement on an intersection',
      name: 'buildANewSettlementOnAnIntersection',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `upgrade a settlement to a city (+1 point)`
  String get upgradeASettlementToACity1Point {
    return Intl.message(
      'upgrade a settlement to a city (+1 point)',
      name: 'upgradeASettlementToACity1Point',
      desc: '',
      args: [],
    );
  }

  /// `victory point card`
  String get victoryPointCard {
    return Intl.message(
      'victory point card',
      name: 'victoryPointCard',
      desc: '',
      args: [],
    );
  }

  /// `development card worth 1 victory point`
  String get developmentCardWorth1VictoryPoint {
    return Intl.message(
      'development card worth 1 victory point',
      name: 'developmentCardWorth1VictoryPoint',
      desc: '',
      args: [],
    );
  }

  /// `longest road`
  String get longestRoad {
    return Intl.message(
      'longest road',
      name: 'longestRoad',
      desc: '',
      args: [],
    );
  }

  /// `awarded to the player with 5+ connected roads`
  String get awardedToThePlayerWith5ConnectedRoads {
    return Intl.message(
      'awarded to the player with 5+ connected roads',
      name: 'awardedToThePlayerWith5ConnectedRoads',
      desc: '',
      args: [],
    );
  }

  /// `largest army`
  String get largestArmy {
    return Intl.message(
      'largest army',
      name: 'largestArmy',
      desc: '',
      args: [],
    );
  }

  /// `awarded to the player with 3+ knight cards played`
  String get awardedToThePlayerWith3KnightCardsPlayed {
    return Intl.message(
      'awarded to the player with 3+ knight cards played',
      name: 'awardedToThePlayerWith3KnightCardsPlayed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
