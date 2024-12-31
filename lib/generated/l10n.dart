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

  /// `common`
  String get common {
    return Intl.message(
      'common',
      name: 'common',
      desc: '',
      args: [],
    );
  }

  /// `цель игры:`
  String get gameGoal {
    return Intl.message(
      'цель игры:',
      name: 'gameGoal',
      desc: '',
      args: [],
    );
  }

  /// `подготовка:`
  String get preparation {
    return Intl.message(
      'подготовка:',
      name: 'preparation',
      desc: '',
      args: [],
    );
  }

  /// `первым достичь 10 уровня, сражаясь с монстрами, используя карты снаряжения, проклятия и умения.`
  String get munchkinGameObjectiveDescription {
    return Intl.message(
      'первым достичь 10 уровня, сражаясь с монстрами, используя карты снаряжения, проклятия и умения.',
      name: 'munchkinGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `перемешайте карты дверей и сокровищ и разложите их в две отдельные колоды.`
  String get munchkinShuffleCardsInstruction {
    return Intl.message(
      'перемешайте карты дверей и сокровищ и разложите их в две отдельные колоды.',
      name: 'munchkinShuffleCardsInstruction',
      desc: '',
      args: [],
    );
  }

  /// `каждый игрок берет по: 4 карты из колоды дверей и 4 карты из колоды сокровищ.`
  String get munchkinInitialCardsInstruction {
    return Intl.message(
      'каждый игрок берет по: 4 карты из колоды дверей и 4 карты из колоды сокровищ.',
      name: 'munchkinInitialCardsInstruction',
      desc: '',
      args: [],
    );
  }

  /// `игроки выкладывают на стол начальные карты снаряжения, если таковые есть.`
  String get munchkinStartingGearInstruction {
    return Intl.message(
      'игроки выкладывают на стол начальные карты снаряжения, если таковые есть.',
      name: 'munchkinStartingGearInstruction',
      desc: '',
      args: [],
    );
  }

  /// `ход игры:`
  String get gameTurnTitle {
    return Intl.message(
      'ход игры:',
      name: 'gameTurnTitle',
      desc: '',
      args: [],
    );
  }

  /// `игрок открывает верхнюю карту из колоды дверей. возможные ситуации:`
  String get munchkinTurnDescription {
    return Intl.message(
      'игрок открывает верхнюю карту из колоды дверей. возможные ситуации:',
      name: 'munchkinTurnDescription',
      desc: '',
      args: [],
    );
  }

  /// `монстр: сразитесь с ним (см. «бой»).`
  String get munchkinMonsterEncounter {
    return Intl.message(
      'монстр: сразитесь с ним (см. «бой»).',
      name: 'munchkinMonsterEncounter',
      desc: '',
      args: [],
    );
  }

  /// `проклятие: немедленно примените его к себе.`
  String get munchkinCurseEncounter {
    return Intl.message(
      'проклятие: немедленно примените его к себе.',
      name: 'munchkinCurseEncounter',
      desc: '',
      args: [],
    );
  }

  /// `любая другая карта: оставьте ее в руке.`
  String get munchkinOtherCardEncounter {
    return Intl.message(
      'любая другая карта: оставьте ее в руке.',
      name: 'munchkinOtherCardEncounter',
      desc: '',
      args: [],
    );
  }

  /// `если монстра нет, игрок может:`
  String get munchkinNoMonsterActionsTitle {
    return Intl.message(
      'если монстра нет, игрок может:',
      name: 'munchkinNoMonsterActionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `выложить монстра из руки для боя (опционально) или залезть в «поиск неприятностей» (взять карту из колоды дверей в руку).`
  String get munchkinNoMonsterActionsDescription {
    return Intl.message(
      'выложить монстра из руки для боя (опционально) или залезть в «поиск неприятностей» (взять карту из колоды дверей в руку).',
      name: 'munchkinNoMonsterActionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `бой (если есть монстр):`
  String get munchkinCombatTitle {
    return Intl.message(
      'бой (если есть монстр):',
      name: 'munchkinCombatTitle',
      desc: '',
      args: [],
    );
  }

  /// `сравните уровень вашего персонажа (с учетом бонусов) с уровнем монстра.`
  String get munchkinCombatCompareLevels {
    return Intl.message(
      'сравните уровень вашего персонажа (с учетом бонусов) с уровнем монстра.',
      name: 'munchkinCombatCompareLevels',
      desc: '',
      args: [],
    );
  }

  /// `если ваш уровень выше или равен — вы побеждаете и получаете сокровища, а также уровень.`
  String get munchkinCombatWinCondition {
    return Intl.message(
      'если ваш уровень выше или равен — вы побеждаете и получаете сокровища, а также уровень.',
      name: 'munchkinCombatWinCondition',
      desc: '',
      args: [],
    );
  }

  /// `если ваш уровень меньше, можно: попросить помощи у другого игрока (по договоренности) или использовать карты из руки для усиления.`
  String get munchkinCombatHelpOrBoost {
    return Intl.message(
      'если ваш уровень меньше, можно: попросить помощи у другого игрока (по договоренности) или использовать карты из руки для усиления.',
      name: 'munchkinCombatHelpOrBoost',
      desc: '',
      args: [],
    );
  }

  /// `если вы не смогли победить, убегайте (киньте кубик). успешный побег на 5 или 6. если не сбежали, применяются последствия, указанные на карте монстра.`
  String get munchkinCombatEscapeRules {
    return Intl.message(
      'если вы не смогли победить, убегайте (киньте кубик). успешный побег на 5 или 6. если не сбежали, применяются последствия, указанные на карте монстра.',
      name: 'munchkinCombatEscapeRules',
      desc: '',
      args: [],
    );
  }

  /// `в конце хода сбросьте лишние карты, если их больше 5. отдайте их игроку с самым низким уровнем.`
  String get munchkinEndTurnDiscardRules {
    return Intl.message(
      'в конце хода сбросьте лишние карты, если их больше 5. отдайте их игроку с самым низким уровнем.',
      name: 'munchkinEndTurnDiscardRules',
      desc: '',
      args: [],
    );
  }

  /// `типы карт:`
  String get cardTypesTitle {
    return Intl.message(
      'типы карт:',
      name: 'cardTypesTitle',
      desc: '',
      args: [],
    );
  }

  /// `монстры — сражайтесь с ними, чтобы повышать уровень.`
  String get munchkinMonstersCardType {
    return Intl.message(
      'монстры — сражайтесь с ними, чтобы повышать уровень.',
      name: 'munchkinMonstersCardType',
      desc: '',
      args: [],
    );
  }

  /// `снаряжение — дает бонусы к уровню в бою.`
  String get munchkinEquipmentCardType {
    return Intl.message(
      'снаряжение — дает бонусы к уровню в бою.',
      name: 'munchkinEquipmentCardType',
      desc: '',
      args: [],
    );
  }

  /// `проклятия — ухудшают персонажа или мешают другим игрокам.`
  String get munchkinCursesCardType {
    return Intl.message(
      'проклятия — ухудшают персонажа или мешают другим игрокам.',
      name: 'munchkinCursesCardType',
      desc: '',
      args: [],
    );
  }

  /// `усилители монстров — увеличивают силу монстра.`
  String get munchkinMonsterEnhancersCardType {
    return Intl.message(
      'усилители монстров — увеличивают силу монстра.',
      name: 'munchkinMonsterEnhancersCardType',
      desc: '',
      args: [],
    );
  }

  /// `одноразовые предметы — используются в бою или для других эффектов.`
  String get munchkinOneTimeItemsCardType {
    return Intl.message(
      'одноразовые предметы — используются в бою или для других эффектов.',
      name: 'munchkinOneTimeItemsCardType',
      desc: '',
      args: [],
    );
  }

  /// `особые правила:`
  String get specialRulesTitle {
    return Intl.message(
      'особые правила:',
      name: 'specialRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `победа над монстром: за победу над монстром получаете уровень и сокровища.`
  String get munchkinMonsterVictoryReward {
    return Intl.message(
      'победа над монстром: за победу над монстром получаете уровень и сокровища.',
      name: 'munchkinMonsterVictoryReward',
      desc: '',
      args: [],
    );
  }

  /// `уровень 10: последний уровень можно достичь только победой над монстром.`
  String get munchkinLevel10Condition {
    return Intl.message(
      'уровень 10: последний уровень можно достичь только победой над монстром.',
      name: 'munchkinLevel10Condition',
      desc: '',
      args: [],
    );
  }

  /// `смерть: игрок теряет все карты, кроме уровня и рас (или классов).`
  String get munchkinDeathRules {
    return Intl.message(
      'смерть: игрок теряет все карты, кроме уровня и рас (или классов).',
      name: 'munchkinDeathRules',
      desc: '',
      args: [],
    );
  }

  /// `победа:`
  String get victoryTitle {
    return Intl.message(
      'победа:',
      name: 'victoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `игрок, первым достигший 10 уровня, побеждает!`
  String get munchkinVictoryCondition {
    return Intl.message(
      'игрок, первым достигший 10 уровня, побеждает!',
      name: 'munchkinVictoryCondition',
      desc: '',
      args: [],
    );
  }

  /// `munchkin® является зарегистрированной торговой маркой компании steve jackson games`
  String get munchkinTrademarkNotice {
    return Intl.message(
      'munchkin® является зарегистрированной торговой маркой компании steve jackson games',
      name: 'munchkinTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `найти сет (набор из 3 карт), где каждый признак: полностью совпадает на всех картах, или полностью различается на всех картах.`
  String get setGameObjectiveDescription {
    return Intl.message(
      'найти сет (набор из 3 карт), где каждый признак: полностью совпадает на всех картах, или полностью различается на всех картах.',
      name: 'setGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `признаки карт:`
  String get setCardAttributesTitle {
    return Intl.message(
      'признаки карт:',
      name: 'setCardAttributesTitle',
      desc: '',
      args: [],
    );
  }

  /// `каждая карта уникальна и имеет 4 признака:`
  String get setCardAttributesDescription {
    return Intl.message(
      'каждая карта уникальна и имеет 4 признака:',
      name: 'setCardAttributesDescription',
      desc: '',
      args: [],
    );
  }

  /// `количество символов: 1, 2 или 3.`
  String get setCardAttributeNumberOfSymbols {
    return Intl.message(
      'количество символов: 1, 2 или 3.',
      name: 'setCardAttributeNumberOfSymbols',
      desc: '',
      args: [],
    );
  }

  /// `тип символов: овал, ромб, волна.`
  String get setCardAttributeSymbolType {
    return Intl.message(
      'тип символов: овал, ромб, волна.',
      name: 'setCardAttributeSymbolType',
      desc: '',
      args: [],
    );
  }

  /// `цвет символов: красный, зеленый, фиолетовый.`
  String get setCardAttributeSymbolColor {
    return Intl.message(
      'цвет символов: красный, зеленый, фиолетовый.',
      name: 'setCardAttributeSymbolColor',
      desc: '',
      args: [],
    );
  }

  /// `заполнение: пустое, заштрихованное, закрашенное.`
  String get setCardAttributeFillType {
    return Intl.message(
      'заполнение: пустое, заштрихованное, закрашенное.',
      name: 'setCardAttributeFillType',
      desc: '',
      args: [],
    );
  }

  /// `раздающий выкладывает 12 карт.`
  String get setGameTurnStepDealerSetup {
    return Intl.message(
      'раздающий выкладывает 12 карт.',
      name: 'setGameTurnStepDealerSetup',
      desc: '',
      args: [],
    );
  }

  /// `игроки одновременно ищут сет. кто первым находит, объявляет: «сет!».`
  String get setGameTurnStepFindingSet {
    return Intl.message(
      'игроки одновременно ищут сет. кто первым находит, объявляет: «сет!».',
      name: 'setGameTurnStepFindingSet',
      desc: '',
      args: [],
    );
  }

  /// `проверяется правильность: если верно, игрок забирает карты, раздающий добавляет 3 новые. если ошибка, игрок теряет 1 очко или пропускает ход (по договоренности).`
  String get setGameTurnStepValidation {
    return Intl.message(
      'проверяется правильность: если верно, игрок забирает карты, раздающий добавляет 3 новые. если ошибка, игрок теряет 1 очко или пропускает ход (по договоренности).',
      name: 'setGameTurnStepValidation',
      desc: '',
      args: [],
    );
  }

  /// `пример правильного сета:`
  String get setGameTurnStepContinue {
    return Intl.message(
      'пример правильного сета:',
      name: 'setGameTurnStepContinue',
      desc: '',
      args: [],
    );
  }

  /// `признак «цвет»: разный (красный, зеленый, фиолетовый).`
  String get setExampleOfValidSetTitle {
    return Intl.message(
      'признак «цвет»: разный (красный, зеленый, фиолетовый).',
      name: 'setExampleOfValidSetTitle',
      desc: '',
      args: [],
    );
  }

  /// `признак «количество»: одинаковый (два).`
  String get setExampleOfValidSetColor {
    return Intl.message(
      'признак «количество»: одинаковый (два).',
      name: 'setExampleOfValidSetColor',
      desc: '',
      args: [],
    );
  }

  /// `признак «тип»: разный (овал, ромб, волна).`
  String get setExampleOfValidSetNumber {
    return Intl.message(
      'признак «тип»: разный (овал, ромб, волна).',
      name: 'setExampleOfValidSetNumber',
      desc: '',
      args: [],
    );
  }

  /// `признак «заполнение»: одинаковое (заштрихованное).`
  String get setExampleOfValidSetType {
    return Intl.message(
      'признак «заполнение»: одинаковое (заштрихованное).',
      name: 'setExampleOfValidSetType',
      desc: '',
      args: [],
    );
  }

  /// `что делать, если сет не найден:`
  String get setExampleOfValidSetFill {
    return Intl.message(
      'что делать, если сет не найден:',
      name: 'setExampleOfValidSetFill',
      desc: '',
      args: [],
    );
  }

  /// `что делать, если сет не найден:`
  String get setNoSetFoundTitle {
    return Intl.message(
      'что делать, если сет не найден:',
      name: 'setNoSetFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `если среди 12 карт сета нет, раздающий добавляет 3 карты (максимум до 21 карты). среди 21 карты сет есть всегда.`
  String get setNoSetFoundDescription {
    return Intl.message(
      'если среди 12 карт сета нет, раздающий добавляет 3 карты (максимум до 21 карты). среди 21 карты сет есть всегда.',
      name: 'setNoSetFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `подсчет очков:`
  String get setScoringTitle {
    return Intl.message(
      'подсчет очков:',
      name: 'setScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `за каждый найденный сет — 1 очко.`
  String get setScoringPointPerSet {
    return Intl.message(
      'за каждый найденный сет — 1 очко.',
      name: 'setScoringPointPerSet',
      desc: '',
      args: [],
    );
  }

  /// `игра заканчивается, когда карты в колоде заканчиваются или достигнуто оговоренное количество очков.`
  String get setScoringGameEnd {
    return Intl.message(
      'игра заканчивается, когда карты в колоде заканчиваются или достигнуто оговоренное количество очков.',
      name: 'setScoringGameEnd',
      desc: '',
      args: [],
    );
  }

  /// `важные правила:`
  String get setImportantRulesTitle {
    return Intl.message(
      'важные правила:',
      name: 'setImportantRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `новый сет нельзя объявлять, пока предыдущий не подтвержден.`
  String get setImportantRuleConfirmation {
    return Intl.message(
      'новый сет нельзя объявлять, пока предыдущий не подтвержден.',
      name: 'setImportantRuleConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `карты, образующие сет, могут располагаться как угодно.`
  String get setImportantRuleCardPosition {
    return Intl.message(
      'карты, образующие сет, могут располагаться как угодно.',
      name: 'setImportantRuleCardPosition',
      desc: '',
      args: [],
    );
  }

  /// `для обучения можно упростить игру, используя только 3 признака.`
  String get setImportantRuleSimplifiedMode {
    return Intl.message(
      'для обучения можно упростить игру, используя только 3 признака.',
      name: 'setImportantRuleSimplifiedMode',
      desc: '',
      args: [],
    );
  }

  /// `set® является зарегистрированной торговой маркой компании set enterprises, inc.`
  String get setTrademarkNotice {
    return Intl.message(
      'set® является зарегистрированной торговой маркой компании set enterprises, inc.',
      name: 'setTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `комплект игры:`
  String get scrabbleGameSetTitle {
    return Intl.message(
      'комплект игры:',
      name: 'scrabbleGameSetTitle',
      desc: '',
      args: [],
    );
  }

  /// `составляйте слова на игровом поле по принципу кроссворда. заработайте больше очков, чем соперники.`
  String get scrabbleGameObjectiveDescription {
    return Intl.message(
      'составляйте слова на игровом поле по принципу кроссворда. заработайте больше очков, чем соперники.',
      name: 'scrabbleGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `поле 15 на 15 клеток.`
  String get scrabbleGameSetBoard {
    return Intl.message(
      'поле 15 на 15 клеток.',
      name: 'scrabbleGameSetBoard',
      desc: '',
      args: [],
    );
  }

  /// `104 буквы (включая 2 пустышки).`
  String get scrabbleGameSetLetters {
    return Intl.message(
      '104 буквы (включая 2 пустышки).',
      name: 'scrabbleGameSetLetters',
      desc: '',
      args: [],
    );
  }

  /// `4 подставки, мешочек для букв.`
  String get scrabbleGameSetAccessories {
    return Intl.message(
      '4 подставки, мешочек для букв.',
      name: 'scrabbleGameSetAccessories',
      desc: '',
      args: [],
    );
  }

  /// `перемешайте буквы в мешочке.`
  String get scrabblePreparationShuffle {
    return Intl.message(
      'перемешайте буквы в мешочке.',
      name: 'scrabblePreparationShuffle',
      desc: '',
      args: [],
    );
  }

  /// `каждый игрок берет 7 букв.`
  String get scrabblePreparationDrawTiles {
    return Intl.message(
      'каждый игрок берет 7 букв.',
      name: 'scrabblePreparationDrawTiles',
      desc: '',
      args: [],
    );
  }

  /// `первый ход делает тот, чья случайно вытянутая буква ближе к началу алфавита.`
  String get scrabblePreparationFirstTurnRule {
    return Intl.message(
      'первый ход делает тот, чья случайно вытянутая буква ближе к началу алфавита.',
      name: 'scrabblePreparationFirstTurnRule',
      desc: '',
      args: [],
    );
  }

  /// `правила хода:`
  String get scrabbleTurnRulesTitle {
    return Intl.message(
      'правила хода:',
      name: 'scrabbleTurnRulesTitle',
      desc: '',
      args: [],
    );
  }

  /// `первый ход: слово должно проходить через центральную клетку (звездочка).`
  String get scrabbleTurnRuleFirstWord {
    return Intl.message(
      'первый ход: слово должно проходить через центральную клетку (звездочка).',
      name: 'scrabbleTurnRuleFirstWord',
      desc: '',
      args: [],
    );
  }

  /// `все слова выкладываются горизонтально или вертикально.`
  String get scrabbleTurnRuleWordDirection {
    return Intl.message(
      'все слова выкладываются горизонтально или вертикально.',
      name: 'scrabbleTurnRuleWordDirection',
      desc: '',
      args: [],
    );
  }

  /// `каждая новая буква должна быть частью нового или существующего слова.`
  String get scrabbleTurnRuleLetterPlacement {
    return Intl.message(
      'каждая новая буква должна быть частью нового или существующего слова.',
      name: 'scrabbleTurnRuleLetterPlacement',
      desc: '',
      args: [],
    );
  }

  /// `подсчет очков:`
  String get scrabbleScoringTitle {
    return Intl.message(
      'подсчет очков:',
      name: 'scrabbleScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `очки за слово: сумма очков букв + бонусы от клеток.`
  String get scrabbleScoringWordPoints {
    return Intl.message(
      'очки за слово: сумма очков букв + бонусы от клеток.',
      name: 'scrabbleScoringWordPoints',
      desc: '',
      args: [],
    );
  }

  /// `синий цвет удваивает/утраивает очки за букву.`
  String get scrabbleScoringBlueBonus {
    return Intl.message(
      'синий цвет удваивает/утраивает очки за букву.',
      name: 'scrabbleScoringBlueBonus',
      desc: '',
      args: [],
    );
  }

  /// `красный цвет удваивает/утраивает очки за слово.`
  String get scrabbleScoringRedBonus {
    return Intl.message(
      'красный цвет удваивает/утраивает очки за слово.',
      name: 'scrabbleScoringRedBonus',
      desc: '',
      args: [],
    );
  }

  /// `особенности:`
  String get scrabbleFeaturesTitle {
    return Intl.message(
      'особенности:',
      name: 'scrabbleFeaturesTitle',
      desc: '',
      args: [],
    );
  }

  /// `пустышка заменяет любую букву, но не дает очков.`
  String get scrabbleFeatureBlankTile {
    return Intl.message(
      'пустышка заменяет любую букву, но не дает очков.',
      name: 'scrabbleFeatureBlankTile',
      desc: '',
      args: [],
    );
  }

  /// `если использованы все 7 букв за ход, игрок получает 50 бонусных очков.`
  String get scrabbleFeatureSevenTileBonus {
    return Intl.message(
      'если использованы все 7 букв за ход, игрок получает 50 бонусных очков.',
      name: 'scrabbleFeatureSevenTileBonus',
      desc: '',
      args: [],
    );
  }

  /// `каждый ход игрок добирает буквы, чтобы снова иметь 7.`
  String get scrabbleFeatureRefillTiles {
    return Intl.message(
      'каждый ход игрок добирает буквы, чтобы снова иметь 7.',
      name: 'scrabbleFeatureRefillTiles',
      desc: '',
      args: [],
    );
  }

  /// `конец игры:`
  String get endGameTitle {
    return Intl.message(
      'конец игры:',
      name: 'endGameTitle',
      desc: '',
      args: [],
    );
  }

  /// `закончились буквы в мешочке, и никто не может сделать ход.`
  String get scrabbleEndGameNoTiles {
    return Intl.message(
      'закончились буквы в мешочке, и никто не может сделать ход.',
      name: 'scrabbleEndGameNoTiles',
      desc: '',
      args: [],
    );
  }

  /// `все игроки пропустили ходы дважды.`
  String get scrabbleEndGameSkippedTurns {
    return Intl.message(
      'все игроки пропустили ходы дважды.',
      name: 'scrabbleEndGameSkippedTurns',
      desc: '',
      args: [],
    );
  }

  /// `оставшиеся буквы на подставках вычитаются из очков.`
  String get scrabbleEndGameRemainingTilesPenalty {
    return Intl.message(
      'оставшиеся буквы на подставках вычитаются из очков.',
      name: 'scrabbleEndGameRemainingTilesPenalty',
      desc: '',
      args: [],
    );
  }

  /// `дополнительные моменты:`
  String get scrabbleAdditionalPointsTitle {
    return Intl.message(
      'дополнительные моменты:',
      name: 'scrabbleAdditionalPointsTitle',
      desc: '',
      args: [],
    );
  }

  /// `можно заменить буквы, пропустив ход.`
  String get scrabbleAdditionalReplaceTiles {
    return Intl.message(
      'можно заменить буквы, пропустив ход.',
      name: 'scrabbleAdditionalReplaceTiles',
      desc: '',
      args: [],
    );
  }

  /// `спорные слова проверяются в согласованном словаре.`
  String get scrabbleAdditionalDisputedWords {
    return Intl.message(
      'спорные слова проверяются в согласованном словаре.',
      name: 'scrabbleAdditionalDisputedWords',
      desc: '',
      args: [],
    );
  }

  /// `все слова должны быть завершенными и соответствовать правилам языка.`
  String get scrabbleAdditionalWordRules {
    return Intl.message(
      'все слова должны быть завершенными и соответствовать правилам языка.',
      name: 'scrabbleAdditionalWordRules',
      desc: '',
      args: [],
    );
  }

  /// `scrabble® является зарегистрированной торговой маркой компании hasbro, inc.`
  String get scrabbleTrademarkNotice {
    return Intl.message(
      'scrabble® является зарегистрированной торговой маркой компании hasbro, inc.',
      name: 'scrabbleTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `первым избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 500 очков.`
  String get unoGameObjectiveDescription {
    return Intl.message(
      'первым избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 500 очков.',
      name: 'unoGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `каждому игроку раздается по 7 карт.`
  String get unoPreparationDistributeCards {
    return Intl.message(
      'каждому игроку раздается по 7 карт.',
      name: 'unoPreparationDistributeCards',
      desc: '',
      args: [],
    );
  }

  /// `остальная колода кладется в центр (это колода для добора).`
  String get unoPreparationDeckInCenter {
    return Intl.message(
      'остальная колода кладется в центр (это колода для добора).',
      name: 'unoPreparationDeckInCenter',
      desc: '',
      args: [],
    );
  }

  /// `верхняя карта переворачивается (это начальная карта сброса).`
  String get unoPreparationFlipFirstCard {
    return Intl.message(
      'верхняя карта переворачивается (это начальная карта сброса).',
      name: 'unoPreparationFlipFirstCard',
      desc: '',
      args: [],
    );
  }

  /// `игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.`
  String get unoGameTurnTitle {
    return Intl.message(
      'игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.',
      name: 'unoGameTurnTitle',
      desc: '',
      args: [],
    );
  }

  /// `игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.`
  String get unoTurnRuleMatchCard {
    return Intl.message(
      'игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.',
      name: 'unoTurnRuleMatchCard',
      desc: '',
      args: [],
    );
  }

  /// `если подходящей карты нет, берется карта из колоды. если она подходит, можно сыграть.`
  String get unoTurnRuleDrawCard {
    return Intl.message(
      'если подходящей карты нет, берется карта из колоды. если она подходит, можно сыграть.',
      name: 'unoTurnRuleDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `игрок может взять карту, даже если у него есть подходящая, но использовать ее в этом ходу нельзя.`
  String get unoTurnRuleOptionalDraw {
    return Intl.message(
      'игрок может взять карту, даже если у него есть подходящая, но использовать ее в этом ходу нельзя.',
      name: 'unoTurnRuleOptionalDraw',
      desc: '',
      args: [],
    );
  }

  /// `активные карты:`
  String get unoActiveCardsTitle {
    return Intl.message(
      'активные карты:',
      name: 'unoActiveCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `«пропусти ход»: следующий игрок пропускает ход.`
  String get unoActiveCardSkipTurn {
    return Intl.message(
      '«пропусти ход»: следующий игрок пропускает ход.',
      name: 'unoActiveCardSkipTurn',
      desc: '',
      args: [],
    );
  }

  /// `«возьми две»: следующий игрок берет 2 карты и пропускает ход.`
  String get unoActiveCardDrawTwo {
    return Intl.message(
      '«возьми две»: следующий игрок берет 2 карты и пропускает ход.',
      name: 'unoActiveCardDrawTwo',
      desc: '',
      args: [],
    );
  }

  /// `«смени направление»: меняет направление игры.`
  String get unoActiveCardReverse {
    return Intl.message(
      '«смени направление»: меняет направление игры.',
      name: 'unoActiveCardReverse',
      desc: '',
      args: [],
    );
  }

  /// `дикая карта: позволяет выбрать цвет игры.`
  String get unoActiveCardWild {
    return Intl.message(
      'дикая карта: позволяет выбрать цвет игры.',
      name: 'unoActiveCardWild',
      desc: '',
      args: [],
    );
  }

  /// `дикая карта «возьми четыре»: позволяет выбрать цвет, а следующий игрок берет 4 карты. можно сыграть, только если нет других карт того же цвета.`
  String get unoActiveCardWildDrawFour {
    return Intl.message(
      'дикая карта «возьми четыре»: позволяет выбрать цвет, а следующий игрок берет 4 карты. можно сыграть, только если нет других карт того же цвета.',
      name: 'unoActiveCardWildDrawFour',
      desc: '',
      args: [],
    );
  }

  /// `особые карты:`
  String get specialCardsTitle {
    return Intl.message(
      'особые карты:',
      name: 'specialCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `«обмен»: обмен картами с любым игроком и выбор цвета.`
  String get unoSpecialCardSwap {
    return Intl.message(
      '«обмен»: обмен картами с любым игроком и выбор цвета.',
      name: 'unoSpecialCardSwap',
      desc: '',
      args: [],
    );
  }

  /// `пустая карта: придумайте правило перед игрой.`
  String get unoSpecialCardBlank {
    return Intl.message(
      'пустая карта: придумайте правило перед игрой.',
      name: 'unoSpecialCardBlank',
      desc: '',
      args: [],
    );
  }

  /// `забыл крикнуть «уно»? возьми 2 карты, если заметили до хода следующего игрока.`
  String get unoSpecialRuleUnoCall {
    return Intl.message(
      'забыл крикнуть «уно»? возьми 2 карты, если заметили до хода следующего игрока.',
      name: 'unoSpecialRuleUnoCall',
      desc: '',
      args: [],
    );
  }

  /// `если кончилась колода добора, сброс перетасовывается.`
  String get unoSpecialRuleReshuffle {
    return Intl.message(
      'если кончилась колода добора, сброс перетасовывается.',
      name: 'unoSpecialRuleReshuffle',
      desc: '',
      args: [],
    );
  }

  /// `подсчет очков:`
  String get unoScoringTitle {
    return Intl.message(
      'подсчет очков:',
      name: 'unoScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `цифровые карты: их номинал.`
  String get unoScoringNumberCards {
    return Intl.message(
      'цифровые карты: их номинал.',
      name: 'unoScoringNumberCards',
      desc: '',
      args: [],
    );
  }

  /// `«пропусти ход», «возьми две», «смени направление»: 20 очков.`
  String get unoScoring20PointsCards {
    return Intl.message(
      '«пропусти ход», «возьми две», «смени направление»: 20 очков.',
      name: 'unoScoring20PointsCards',
      desc: '',
      args: [],
    );
  }

  /// `дикая карта, «возьми четыре»: 50 очков.`
  String get unoScoring50PointsCards {
    return Intl.message(
      'дикая карта, «возьми четыре»: 50 очков.',
      name: 'unoScoring50PointsCards',
      desc: '',
      args: [],
    );
  }

  /// `«обмен», пустая карта: 40 очков.`
  String get unoScoring40PointsCards {
    return Intl.message(
      '«обмен», пустая карта: 40 очков.',
      name: 'unoScoring40PointsCards',
      desc: '',
      args: [],
    );
  }

  /// `игрок выигрывает, набрав 500 очков.`
  String get unoVictory500Points {
    return Intl.message(
      'игрок выигрывает, набрав 500 очков.',
      name: 'unoVictory500Points',
      desc: '',
      args: [],
    );
  }

  /// `альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.`
  String get unoVictoryLowestScoreAlternative {
    return Intl.message(
      'альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.',
      name: 'unoVictoryLowestScoreAlternative',
      desc: '',
      args: [],
    );
  }

  /// `uno® является зарегистрированной торговой маркой компании mattel`
  String get unoTrademarkNotice {
    return Intl.message(
      'uno® является зарегистрированной торговой маркой компании mattel',
      name: 'unoTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `избавьтесь от всех своих карт и наберите очки за карты соперников. побеждает игрок, набравший 500 очков.`
  String get unoFlipGameObjectiveDescription {
    return Intl.message(
      'избавьтесь от всех своих карт и наберите очки за карты соперников. побеждает игрок, набравший 500 очков.',
      name: 'unoFlipGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `начало игры:`
  String get unoFlipGameStartTitle {
    return Intl.message(
      'начало игры:',
      name: 'unoFlipGameStartTitle',
      desc: '',
      args: [],
    );
  }

  /// `каждый игрок получает 7 карт.`
  String get unoFlipGameStartDealCards {
    return Intl.message(
      'каждый игрок получает 7 карт.',
      name: 'unoFlipGameStartDealCards',
      desc: '',
      args: [],
    );
  }

  /// `игру начинают светлой стороной колоды.`
  String get unoFlipGameStartLightSide {
    return Intl.message(
      'игру начинают светлой стороной колоды.',
      name: 'unoFlipGameStartLightSide',
      desc: '',
      args: [],
    );
  }

  /// `сыграйте карту, совпадающую по цвету, числу или символу с верхней картой сброса.`
  String get unoFlipTurnRuleMatchCard {
    return Intl.message(
      'сыграйте карту, совпадающую по цвету, числу или символу с верхней картой сброса.',
      name: 'unoFlipTurnRuleMatchCard',
      desc: '',
      args: [],
    );
  }

  /// `если подходящей карты нет, возьмите карту из колоды.`
  String get unoFlipTurnRuleDrawCard {
    return Intl.message(
      'если подходящей карты нет, возьмите карту из колоды.',
      name: 'unoFlipTurnRuleDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `карта «переверните» меняет сторону игры с «светлой» на «тёмную» и наоборот.`
  String get unoFlipTurnRuleFlipCard {
    return Intl.message(
      'карта «переверните» меняет сторону игры с «светлой» на «тёмную» и наоборот.',
      name: 'unoFlipTurnRuleFlipCard',
      desc: '',
      args: [],
    );
  }

  /// `светлая сторона:`
  String get unoFlipLightSideCardsTitle {
    return Intl.message(
      'светлая сторона:',
      name: 'unoFlipLightSideCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `«возьми одну».`
  String get unoFlipLightSideDrawOne {
    return Intl.message(
      '«возьми одну».',
      name: 'unoFlipLightSideDrawOne',
      desc: '',
      args: [],
    );
  }

  /// `«смени направление».`
  String get unoFlipLightSideReverse {
    return Intl.message(
      '«смени направление».',
      name: 'unoFlipLightSideReverse',
      desc: '',
      args: [],
    );
  }

  /// `«пропусти ход».`
  String get unoFlipLightSideSkipTurn {
    return Intl.message(
      '«пропусти ход».',
      name: 'unoFlipLightSideSkipTurn',
      desc: '',
      args: [],
    );
  }

  /// `«дикая карта».`
  String get unoFlipLightSideWildCard {
    return Intl.message(
      '«дикая карта».',
      name: 'unoFlipLightSideWildCard',
      desc: '',
      args: [],
    );
  }

  /// `«дикая +2».`
  String get unoFlipLightSideWildDrawTwo {
    return Intl.message(
      '«дикая +2».',
      name: 'unoFlipLightSideWildDrawTwo',
      desc: '',
      args: [],
    );
  }

  /// `тёмная сторона:`
  String get unoFlipDarkSideCardsTitle {
    return Intl.message(
      'тёмная сторона:',
      name: 'unoFlipDarkSideCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `«возьми пять».`
  String get unoFlipDarkSideDrawFive {
    return Intl.message(
      '«возьми пять».',
      name: 'unoFlipDarkSideDrawFive',
      desc: '',
      args: [],
    );
  }

  /// `«смени направление».`
  String get unoFlipDarkSideReverse {
    return Intl.message(
      '«смени направление».',
      name: 'unoFlipDarkSideReverse',
      desc: '',
      args: [],
    );
  }

  /// `«все пропускают ход».`
  String get unoFlipDarkSideSkipAll {
    return Intl.message(
      '«все пропускают ход».',
      name: 'unoFlipDarkSideSkipAll',
      desc: '',
      args: [],
    );
  }

  /// `«дикая карта».`
  String get unoFlipDarkSideWildCard {
    return Intl.message(
      '«дикая карта».',
      name: 'unoFlipDarkSideWildCard',
      desc: '',
      args: [],
    );
  }

  /// `«бери, пока не вытянешь нужный цвет».`
  String get unoFlipDarkSideDrawUntilColor {
    return Intl.message(
      '«бери, пока не вытянешь нужный цвет».',
      name: 'unoFlipDarkSideDrawUntilColor',
      desc: '',
      args: [],
    );
  }

  /// `после карты «переверните» вся игра меняет сторону.`
  String get unoFlipKeyMomentFlipCardEffect {
    return Intl.message(
      'после карты «переверните» вся игра меняет сторону.',
      name: 'unoFlipKeyMomentFlipCardEffect',
      desc: '',
      args: [],
    );
  }

  /// `ключевые моменты:`
  String get unoFlipKeyMoment {
    return Intl.message(
      'ключевые моменты:',
      name: 'unoFlipKeyMoment',
      desc: '',
      args: [],
    );
  }

  /// `если игрок играет предпоследней картой, он должен сказать «уно!». если забыл, берёт 2 карты.`
  String get unoFlipKeyMomentUnoCall {
    return Intl.message(
      'если игрок играет предпоследней картой, он должен сказать «уно!». если забыл, берёт 2 карты.',
      name: 'unoFlipKeyMomentUnoCall',
      desc: '',
      args: [],
    );
  }

  /// `подсчёт очков:`
  String get unoFlipScoringTitle {
    return Intl.message(
      'подсчёт очков:',
      name: 'unoFlipScoringTitle',
      desc: '',
      args: [],
    );
  }

  /// `победитель раунда получает очки за оставшиеся карты соперников:`
  String get unoFlipScoringRoundWinnerPoints {
    return Intl.message(
      'победитель раунда получает очки за оставшиеся карты соперников:',
      name: 'unoFlipScoringRoundWinnerPoints',
      desc: '',
      args: [],
    );
  }

  /// `карты с цифрами: по их номиналу.`
  String get unoFlipScoringNumberCards {
    return Intl.message(
      'карты с цифрами: по их номиналу.',
      name: 'unoFlipScoringNumberCards',
      desc: '',
      args: [],
    );
  }

  /// `активные карты: 20–60 очков в зависимости от типа.`
  String get unoFlipScoringActiveCards {
    return Intl.message(
      'активные карты: 20–60 очков в зависимости от типа.',
      name: 'unoFlipScoringActiveCards',
      desc: '',
      args: [],
    );
  }

  /// `игрок, набравший 500 очков, выигрывает игру.`
  String get unoFlipVictory500Points {
    return Intl.message(
      'игрок, набравший 500 очков, выигрывает игру.',
      name: 'unoFlipVictory500Points',
      desc: '',
      args: [],
    );
  }

  /// `альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.`
  String get unoFlipVictoryLowestScoreAlternative {
    return Intl.message(
      'альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.',
      name: 'unoFlipVictoryLowestScoreAlternative',
      desc: '',
      args: [],
    );
  }

  /// `uno flip® является зарегистрированной торговой маркой компании mattel`
  String get unoFlipTrademarkNotice {
    return Intl.message(
      'uno flip® является зарегистрированной торговой маркой компании mattel',
      name: 'unoFlipTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `цель игры:`
  String get dosGameObjectiveTitle {
    return Intl.message(
      'цель игры:',
      name: 'dosGameObjectiveTitle',
      desc: '',
      args: [],
    );
  }

  /// `избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 200 очков.`
  String get dosGameObjectiveDescription {
    return Intl.message(
      'избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 200 очков.',
      name: 'dosGameObjectiveDescription',
      desc: '',
      args: [],
    );
  }

  /// `каждому игроку раздается по 7 карт.`
  String get dosPreparationDealCards {
    return Intl.message(
      'каждому игроку раздается по 7 карт.',
      name: 'dosPreparationDealCards',
      desc: '',
      args: [],
    );
  }

  /// `выкладываются 2 карты в «центральный ряд».`
  String get dosPreparationCentralRow {
    return Intl.message(
      'выкладываются 2 карты в «центральный ряд».',
      name: 'dosPreparationCentralRow',
      desc: '',
      args: [],
    );
  }

  /// `остальная колода кладется рядом (колода для добора).`
  String get dosPreparationDrawPile {
    return Intl.message(
      'остальная колода кладется рядом (колода для добора).',
      name: 'dosPreparationDrawPile',
      desc: '',
      args: [],
    );
  }

  /// `игроки по очереди подбирают карты из руки к картам в «центральном ряду»:`
  String get dosTurnRulePickCards {
    return Intl.message(
      'игроки по очереди подбирают карты из руки к картам в «центральном ряду»:',
      name: 'dosTurnRulePickCards',
      desc: '',
      args: [],
    );
  }

  /// `одиночное совпадение: карта совпадает по числу.`
  String get dosTurnRuleSingleMatch {
    return Intl.message(
      'одиночное совпадение: карта совпадает по числу.',
      name: 'dosTurnRuleSingleMatch',
      desc: '',
      args: [],
    );
  }

  /// `двойное совпадение: сумма двух ваших карт равна числу карты из ряда.`
  String get dosTurnRuleDoubleMatch {
    return Intl.message(
      'двойное совпадение: сумма двух ваших карт равна числу карты из ряда.',
      name: 'dosTurnRuleDoubleMatch',
      desc: '',
      args: [],
    );
  }

  /// `если подходящих карт нет, возьмите карту из колоды. если она подходит, можно сыграть.`
  String get dosTurnRuleDrawCard {
    return Intl.message(
      'если подходящих карт нет, возьмите карту из колоды. если она подходит, можно сыграть.',
      name: 'dosTurnRuleDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `в конце хода дополните «центральный ряд» до 2 карт.`
  String get dosTurnRuleEndTurn {
    return Intl.message(
      'в конце хода дополните «центральный ряд» до 2 карт.',
      name: 'dosTurnRuleEndTurn',
      desc: '',
      args: [],
    );
  }

  /// `бонусы:`
  String get dosBonusNumberColorMatchAddCard {
    return Intl.message(
      'бонусы:',
      name: 'dosBonusNumberColorMatchAddCard',
      desc: '',
      args: [],
    );
  }

  /// `бонусы:`
  String get dosBonus {
    return Intl.message(
      'бонусы:',
      name: 'dosBonus',
      desc: '',
      args: [],
    );
  }

  /// `за двойное совпадение цвета: остальные игроки берут по 1 карте из колоды.`
  String get dosBonusDoubleColorMatchDrawCard {
    return Intl.message(
      'за двойное совпадение цвета: остальные игроки берут по 1 карте из колоды.',
      name: 'dosBonusDoubleColorMatchDrawCard',
      desc: '',
      args: [],
    );
  }

  /// `«дикая карта dos»: заменяет две карты любого цвета.`
  String get dosSpecialCardWildDos {
    return Intl.message(
      '«дикая карта dos»: заменяет две карты любого цвета.',
      name: 'dosSpecialCardWildDos',
      desc: '',
      args: [],
    );
  }

  /// `«дикая карта #»: заменяет любое число (1–10) своего цвета.`
  String get dosSpecialCardWildNumber {
    return Intl.message(
      '«дикая карта #»: заменяет любое число (1–10) своего цвета.',
      name: 'dosSpecialCardWildNumber',
      desc: '',
      args: [],
    );
  }

  /// `если у вас осталось 2 карты, крикните «дос!». если забудете и другой игрок заметит, возьмите 2 карты.`
  String get dosSpecialRuleDosCall {
    return Intl.message(
      'если у вас осталось 2 карты, крикните «дос!». если забудете и другой игрок заметит, возьмите 2 карты.',
      name: 'dosSpecialRuleDosCall',
      desc: '',
      args: [],
    );
  }

  /// `особое правило:`
  String get dosSpecialRule {
    return Intl.message(
      'особое правило:',
      name: 'dosSpecialRule',
      desc: '',
      args: [],
    );
  }

  /// `цифровые карты: номинал.`
  String get dosScoringNumberCards {
    return Intl.message(
      'цифровые карты: номинал.',
      name: 'dosScoringNumberCards',
      desc: '',
      args: [],
    );
  }

  /// `подсчет очков:`
  String get dosScoring {
    return Intl.message(
      'подсчет очков:',
      name: 'dosScoring',
      desc: '',
      args: [],
    );
  }

  /// `«дикая карта dos»: 20 очков.`
  String get dosScoringWildDos {
    return Intl.message(
      '«дикая карта dos»: 20 очков.',
      name: 'dosScoringWildDos',
      desc: '',
      args: [],
    );
  }

  /// `«дикая карта #»: 40 очков.`
  String get dosScoringWildNumber {
    return Intl.message(
      '«дикая карта #»: 40 очков.',
      name: 'dosScoringWildNumber',
      desc: '',
      args: [],
    );
  }

  /// `игрок выигрывает, набрав 200 очков.`
  String get dosVictory200Points {
    return Intl.message(
      'игрок выигрывает, набрав 200 очков.',
      name: 'dosVictory200Points',
      desc: '',
      args: [],
    );
  }

  /// `dos® является зарегистрированной торговой маркой компании mattel`
  String get dosTrademarkNotice {
    return Intl.message(
      'dos® является зарегистрированной торговой маркой компании mattel',
      name: 'dosTrademarkNotice',
      desc: '',
      args: [],
    );
  }

  /// `игра продолжается`
  String get setGameTurnStepFour {
    return Intl.message(
      'игра продолжается',
      name: 'setGameTurnStepFour',
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
