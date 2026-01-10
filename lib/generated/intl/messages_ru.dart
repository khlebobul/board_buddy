// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(playerName, winningBid) =>
      "набрал ли ${playerName} свою ставку (${winningBid} очков)?";

  static String m1(count) =>
      "${Intl.plural(count, one: 'очко', few: 'очка', many: 'очков', other: 'очков')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("о проекте"),
    "ace": MessageLookupByLibrary.simpleMessage("туз"),
    "ace11Points": MessageLookupByLibrary.simpleMessage("туз: 11 очков"),
    "add": MessageLookupByLibrary.simpleMessage("добавить"),
    "addPlayer": MessageLookupByLibrary.simpleMessage("добавить игрока"),
    "adding": MessageLookupByLibrary.simpleMessage("прибавление"),
    "allowsThePlayerToChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage("позволяет игроку выбрать цвет."),
    "appreciation": MessageLookupByLibrary.simpleMessage("благодарность"),
    "armour": MessageLookupByLibrary.simpleMessage("броня"),
    "awardedToThePlayerWith3KnightCardsPlayed":
        MessageLookupByLibrary.simpleMessage(
          "присуждается игроку с 3+ сыгранными картами рыцарей",
        ),
    "awardedToThePlayerWith5ConnectedRoads":
        MessageLookupByLibrary.simpleMessage(
          "присуждается игроку с 5+ соединёнными дорогами",
        ),
    "back": MessageLookupByLibrary.simpleMessage("назад"),
    "biddingPhase": MessageLookupByLibrary.simpleMessage("фаза торговли:"),
    "bigArmour": MessageLookupByLibrary.simpleMessage("большая броня"),
    "bigBoots": MessageLookupByLibrary.simpleMessage("большие ботинки"),
    "bigHelmet": MessageLookupByLibrary.simpleMessage("большой шлем"),
    "bigMagic": MessageLookupByLibrary.simpleMessage("большая магия"),
    "bigSword": MessageLookupByLibrary.simpleMessage("большой меч"),
    "bingo": MessageLookupByLibrary.simpleMessage("бинго"),
    "blankTile": MessageLookupByLibrary.simpleMessage("пустая\nклетка"),
    "boardBuddy": MessageLookupByLibrary.simpleMessage("board buddy"),
    "boardBuddyIsYourUltimateBoardGameCompanion":
        MessageLookupByLibrary.simpleMessage(
          "board buddy - ваш лучший помощник для настольных игр",
        ),
    "bonusTileOrSpecialMarkerScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "бонусная клетка или специальный маркер",
        ),
    "boots": MessageLookupByLibrary.simpleMessage("ботинки"),
    "buffsOrDebuffsAffectingCharactersitemsInfo":
        MessageLookupByLibrary.simpleMessage(
          "усиления или ослабления персонажа/предметов",
        ),
    "buildANewSettlementOnAnIntersection": MessageLookupByLibrary.simpleMessage(
      "постройте новое поселение на перекрёстке",
    ),
    "buildingCosts": MessageLookupByLibrary.simpleMessage(
      "стоимость строительства:",
    ),
    "buildingRules": MessageLookupByLibrary.simpleMessage(
      "правила строительства:",
    ),
    "canBeAnyColorChosenByTheCurrentPlayerIfDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "может быть любого цвета по выбору текущего игрока. если вытянута, игрок выбирает цвет.",
        ),
    "canRepresentAnyNumberForItsOwnParticularColorDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "может представлять любое число своего цвета.",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("отмена"),
    "cardTypesTitle": MessageLookupByLibrary.simpleMessage("типы карт:"),
    "catan": MessageLookupByLibrary.simpleMessage("колонизаторы"),
    "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
      "карта развития: 1 шерсть + 1 зерно + 1 руда",
    ),
    "catanBuildingCostsOne": MessageLookupByLibrary.simpleMessage(
      "дорога: 1 древесина + 1 кирпич",
    ),
    "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
      "город (улучшение): 2 зерна + 3 руды (2)",
    ),
    "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
      "поселение: 1 древесина + 1 кирпич + 1 шерсть + 1 зерно (1)",
    ),
    "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
      "города заменяют существующие поселения",
    ),
    "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
      "дороги должны соединяться с вашими существующими дорогами, поселениями или городами",
    ),
    "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
      "поселения должны соединяться с вашей сетью дорог",
    ),
    "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
      "поселения должны находиться минимум в 2 перекрёстках от любого другого поселения/города",
    ),
    "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
      "2 специальные карты: самый длинный торговый путь, самая большая армия",
    ),
    "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
      "95 карт ресурсов (по 19: древесина, кирпич, шерсть, зерно, руда)",
    ),
    "catanComponentsFour": MessageLookupByLibrary.simpleMessage(
      "18 жетонов с числами",
    ),
    "catanComponentsNine": MessageLookupByLibrary.simpleMessage(
      "1 разбойник, 2 кубика",
    ),
    "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
      "19 гексов местности (4 леса, 4 поля пшеницы, 4 пастбища, 3 горы, 3 холма, 1 пустыня)",
    ),
    "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
      "фигурки игроков: 5 поселений, 4 города, 15 дорог на игрока",
    ),
    "catanComponentsSix": MessageLookupByLibrary.simpleMessage(
      "25 карт развития",
    ),
    "catanComponentsThree": MessageLookupByLibrary.simpleMessage(
      "9 частей портов",
    ),
    "catanComponentsTwo": MessageLookupByLibrary.simpleMessage(
      "6 частей морской рамки",
    ),
    "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
      "монополия (2): назовите ресурс, все игроки отдают вам свои",
    ),
    "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
      "рыцарь (14): переместите разбойника, украдите 1 ресурс у соседнего игрока",
    ),
    "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
      "строительство дорог (2): постройте 2 дороги бесплатно",
    ),
    "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
      "победное очко (5): даёт 1, держите скрытой до победы",
    ),
    "catanGameGoal": MessageLookupByLibrary.simpleMessage(
      "первым набрать 10 победных очков, строя поселения, города, дороги и получая специальные карты.",
    ),
    "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
      "бросок кубиков: все игроки с поселениями/городами на гексах с выпавшим числом получают ресурсы",
    ),
    "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
      "строительство: тратьте ресурсы на строительство дорог, поселений, городов или покупку карт развития",
    ),
    "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
      "торговля: обменивайте ресурсы с другими игроками или используйте порты (4:1 или специальные курсы)",
    ),
    "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
      "каждый игрок размещает 2 поселения и 2 дороги в обратном порядке хода",
    ),
    "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
      "соберите поле из гексов местности внутри морской рамки",
    ),
    "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
      "поставьте разбойника на гекс пустыни",
    ),
    "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "разместите жетоны с числами на гексах (кроме пустыни)",
    ),
    "catanResourcesFive": MessageLookupByLibrary.simpleMessage("горы – руда"),
    "catanResourcesFour": MessageLookupByLibrary.simpleMessage(
      "поля – зерно (пшеница)",
    ),
    "catanResourcesOne": MessageLookupByLibrary.simpleMessage(
      "лес – древесина",
    ),
    "catanResourcesSix": MessageLookupByLibrary.simpleMessage(
      "пустыня – без ресурсов",
    ),
    "catanResourcesTree": MessageLookupByLibrary.simpleMessage(
      "пастбище – шерсть (овца)",
    ),
    "catanResourcesTwo": MessageLookupByLibrary.simpleMessage(
      "холмы – кирпич (глина)",
    ),
    "catanScoringFive": MessageLookupByLibrary.simpleMessage(
      "карты победных очков: 1 каждая",
    ),
    "catanScoringFour": MessageLookupByLibrary.simpleMessage(
      "самая большая армия: 2",
    ),
    "catanScoringOne": MessageLookupByLibrary.simpleMessage("поселение: 1"),
    "catanScoringThree": MessageLookupByLibrary.simpleMessage(
      "самый длинный торговый путь: 2",
    ),
    "catanScoringTwo": MessageLookupByLibrary.simpleMessage("город: 2"),
    "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
      "самый длинный торговый путь: первый игрок с 5+ непрерывными дорогами (может быть украдена)",
    ),
    "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
      "самая большая армия: первый игрок с 3+ сыгранными картами рыцарей (может быть украдена)",
    ),
    "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
      "заблокированный гекс не производит ресурсы, пока там разбойник",
    ),
    "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
      "любой игрок с более чем 7 картами должен сбросить половину (округляя вниз)",
    ),
    "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
      "украдите 1 случайный ресурс у игрока с поселением/городом на этом гексе",
    ),
    "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
      "переместите разбойника на любой гекс (кроме пустыни)",
    ),
    "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "catan® является торговой маркой catan gmbh.",
    ),
    "catanTradingOne": MessageLookupByLibrary.simpleMessage(
      "внутренняя торговля: договаривайтесь об обмене с другими игроками в свой ход",
    ),
    "catanTradingThree": MessageLookupByLibrary.simpleMessage(
      "портовая торговля: общие порты 3:1 или специализированные 2:1",
    ),
    "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
      "морская торговля: 4:1 с банком (любые 4 одинаковых ресурса за 1)",
    ),
    "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
      "первый игрок, набравший 10 победных очков в свой ход, выигрывает игру. вы должны объявить о своей победе в свой ход.",
    ),
    "changesTheColorAndForcesTheNextPlayerToDrawUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "меняет цвет и заставляет следующего игрока взять четыре карты.",
        ),
    "changesTheDirectionOfPlayUnoInfo": MessageLookupByLibrary.simpleMessage(
      "меняет направление игры.",
    ),
    "charactersGenderFemaleInfo": MessageLookupByLibrary.simpleMessage(
      "пол персонажа: женский",
    ),
    "charactersGenderMaleInfo": MessageLookupByLibrary.simpleMessage(
      "пол персонажа: мужской",
    ),
    "checkMyWebsite": MessageLookupByLibrary.simpleMessage("мой сайт"),
    "city": MessageLookupByLibrary.simpleMessage("город"),
    "class1": MessageLookupByLibrary.simpleMessage("класс 1"),
    "class2": MessageLookupByLibrary.simpleMessage("класс 2"),
    "clear": MessageLookupByLibrary.simpleMessage("очистить"),
    "clearance": MessageLookupByLibrary.simpleMessage("очистка"),
    "cleric": MessageLookupByLibrary.simpleMessage("клирик"),
    "close": MessageLookupByLibrary.simpleMessage("закрыть"),
    "common": MessageLookupByLibrary.simpleMessage("счетчик"),
    "confirm": MessageLookupByLibrary.simpleMessage("подтвердить"),
    "continueGame": MessageLookupByLibrary.simpleMessage("продолжить игру"),
    "continueTitle": MessageLookupByLibrary.simpleMessage("продолжить"),
    "contractResolution": MessageLookupByLibrary.simpleMessage(
      "подсчёт контракта:",
    ),
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage(
      "не удалось запустить",
    ),
    "currentBet": MessageLookupByLibrary.simpleMessage("текущая ставка:"),
    "currentCount": MessageLookupByLibrary.simpleMessage("текущий счет:"),
    "cursed": MessageLookupByLibrary.simpleMessage("проклятие"),
    "dark": MessageLookupByLibrary.simpleMessage("темная"),
    "darkSideCardsAreReplacedWithLightOnesAndVice":
        MessageLookupByLibrary.simpleMessage(
          "карточки темной стороны заменяться на светлые и наоборот.",
        ),
    "developmentCardWorth1VictoryPoint": MessageLookupByLibrary.simpleMessage(
      "карта развития, дающая 1 победное очко",
    ),
    "developmentCards": MessageLookupByLibrary.simpleMessage("карты развития:"),
    "didPlayerReachBid": m0,
    "didYouEnter": MessageLookupByLibrary.simpleMessage("набрал ли"),
    "doReturn": MessageLookupByLibrary.simpleMessage("вернуться"),
    "dontHaveYourFavouriteGameEmailMe": MessageLookupByLibrary.simpleMessage(
      "нет вашей любимой игры? напишите мне!",
    ),
    "dos": MessageLookupByLibrary.simpleMessage("дос"),
    "dosBonus": MessageLookupByLibrary.simpleMessage("бонусы:"),
    "dosBonusDoubleColorMatchDrawCard": MessageLookupByLibrary.simpleMessage(
      "за двойное совпадение цвета: остальные игроки берут по 1 карте из колоды.",
    ),
    "dosBonusNumberColorMatchAddCard": MessageLookupByLibrary.simpleMessage(
      "за совпадение по числу и цвету: добавьте 1 карту из руки в «центральный ряд».",
    ),
    "dosGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 200 очков.",
    ),
    "dosGameObjectiveTitle": MessageLookupByLibrary.simpleMessage("цель игры:"),
    "dosPreparationCentralRow": MessageLookupByLibrary.simpleMessage(
      "выкладываются 2 карты в «центральный ряд».",
    ),
    "dosPreparationDealCards": MessageLookupByLibrary.simpleMessage(
      "каждому игроку раздается по 7 карт.",
    ),
    "dosPreparationDrawPile": MessageLookupByLibrary.simpleMessage(
      "остальная колода кладется рядом (колода для добора).",
    ),
    "dosScoring": MessageLookupByLibrary.simpleMessage("подсчет очков:"),
    "dosScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "цифровые карты: номинал.",
    ),
    "dosScoringWildDos": MessageLookupByLibrary.simpleMessage(
      "«дикая карта dos»: 20 очков.",
    ),
    "dosScoringWildNumber": MessageLookupByLibrary.simpleMessage(
      "«дикая карта #»: 40 очков.",
    ),
    "dosSpecialCardWildDos": MessageLookupByLibrary.simpleMessage(
      "«дикая карта dos»: заменяет две карты любого цвета.",
    ),
    "dosSpecialCardWildNumber": MessageLookupByLibrary.simpleMessage(
      "«дикая карта #»: заменяет любое число (1–10) своего цвета.",
    ),
    "dosSpecialRule": MessageLookupByLibrary.simpleMessage("особое правило:"),
    "dosSpecialRuleDosCall": MessageLookupByLibrary.simpleMessage(
      "если у вас осталось 2 карты, крикните «дос!». если забудете и другой игрок заметит, возьмите 2 карты.",
    ),
    "dosTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "dos® является зарегистрированной торговой маркой компании mattel",
    ),
    "dosTurnRuleDoubleMatch": MessageLookupByLibrary.simpleMessage(
      "двойное совпадение: сумма двух ваших карт равна числу карты из ряда.",
    ),
    "dosTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "если подходящих карт нет, возьмите карту из колоды. если она подходит, можно сыграть.",
    ),
    "dosTurnRuleEndTurn": MessageLookupByLibrary.simpleMessage(
      "в конце хода дополните «центральный ряд» до 2 карт.",
    ),
    "dosTurnRulePickCards": MessageLookupByLibrary.simpleMessage(
      "игроки по очереди подбирают карты из руки к картам в «центральном ряду»:",
    ),
    "dosTurnRuleSingleMatch": MessageLookupByLibrary.simpleMessage(
      "одиночное совпадение: карта совпадает по числу.",
    ),
    "dosVictory200Points": MessageLookupByLibrary.simpleMessage(
      "игрок выигрывает, набрав 200 очков.",
    ),
    "doublesTheValueOfALetterScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("удваивает значение буквы"),
    "doublesTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("удваивает значение всего слова"),
    "drawFiveUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "карта «возьми пять»",
    ),
    "drawOneUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "карта «возьми одну»",
    ),
    "drawTwoCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "карта «возьми две»",
    ),
    "dwarf": MessageLookupByLibrary.simpleMessage("гном"),
    "eachCardHasANumberDeterminingItsValue":
        MessageLookupByLibrary.simpleMessage(
          "у каждой карты есть число, определяющее её значение.",
        ),
    "eachCardHasANumberFrom0To9WhichUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "каждая карта имеет число от 0 до 9, которое определяет её значение.",
        ),
    "eachCardHasANumberFrom1To9Which": MessageLookupByLibrary.simpleMessage(
      "каждая карта имеет число от 1 до 9, которое определяет её значение.",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("изменить"),
    "elf": MessageLookupByLibrary.simpleMessage("эльф"),
    "emailCopied": MessageLookupByLibrary.simpleMessage(
      "электронная почта скопирована",
    ),
    "endGameTitle": MessageLookupByLibrary.simpleMessage("конец игры:"),
    "english": MessageLookupByLibrary.simpleMessage("англиский"),
    "enterAWord": MessageLookupByLibrary.simpleMessage("введите слово"),
    "featureRequest": MessageLookupByLibrary.simpleMessage("новый функционал"),
    "finish": MessageLookupByLibrary.simpleMessage("завершить"),
    "firstBonus": MessageLookupByLibrary.simpleMessage("первый бонус"),
    "flipCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "карта «переверните»",
    ),
    "flipSide": MessageLookupByLibrary.simpleMessage("переворот стороны"),
    "flipsAllCardsToTheOppositeSideUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "переворачивает все карты на противоположную сторону.",
        ),
    "followMeOnXTwitter": MessageLookupByLibrary.simpleMessage(
      "мой x (twitter)",
    ),
    "french": MessageLookupByLibrary.simpleMessage("французский"),
    "gameGoal": MessageLookupByLibrary.simpleMessage("цель игры:"),
    "gameOver": MessageLookupByLibrary.simpleMessage("игра окончена"),
    "gameTurnTitle": MessageLookupByLibrary.simpleMessage("ход игры:"),
    "gameUpTo": MessageLookupByLibrary.simpleMessage("игра до: "),
    "games": MessageLookupByLibrary.simpleMessage("игры"),
    "gear": MessageLookupByLibrary.simpleMessage("снаряжение"),
    "german": MessageLookupByLibrary.simpleMessage("немецкий"),
    "githubRepository": MessageLookupByLibrary.simpleMessage(
      "репозиторий github",
    ),
    "halfBreed": MessageLookupByLibrary.simpleMessage("полукровка"),
    "halfling": MessageLookupByLibrary.simpleMessage("хоббит"),
    "headGear": MessageLookupByLibrary.simpleMessage("головной убор"),
    "helmet": MessageLookupByLibrary.simpleMessage("шлем"),
    "heyMyNameIsGleb": MessageLookupByLibrary.simpleMessage(
      "привет! меня зовут глеб",
    ),
    "highestScoreWins": MessageLookupByLibrary.simpleMessage(
      "побеждает высокий счет",
    ),
    "human": MessageLookupByLibrary.simpleMessage("человек"),
    "indicatesAnActiveCurse": MessageLookupByLibrary.simpleMessage(
      "указывает на наложенное проклятие",
    ),
    "jack": MessageLookupByLibrary.simpleMessage("валет"),
    "jack2Points": MessageLookupByLibrary.simpleMessage("валет: 2 очка"),
    "keepAwakeMode": MessageLookupByLibrary.simpleMessage(
      "режим \'бодрствования\' экрана",
    ),
    "king": MessageLookupByLibrary.simpleMessage("король"),
    "king4Points": MessageLookupByLibrary.simpleMessage("король: 4 очка"),
    "languages": MessageLookupByLibrary.simpleMessage("языки"),
    "largestArmy": MessageLookupByLibrary.simpleMessage("самая большая армия"),
    "leftHand": MessageLookupByLibrary.simpleMessage("левая рука"),
    "letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour":
        MessageLookupByLibrary.simpleMessage(
          " позволяет легко отслеживать счета и ключевые моменты, оставаясь сосредоточенным на игре",
        ),
    "level": MessageLookupByLibrary.simpleMessage("уровень"),
    "light": MessageLookupByLibrary.simpleMessage("светлая"),
    "longestRoad": MessageLookupByLibrary.simpleMessage(
      "самый длинный торговый путь",
    ),
    "lowestScoreWins": MessageLookupByLibrary.simpleMessage(
      "побеждает низкий счет",
    ),
    "magic": MessageLookupByLibrary.simpleMessage("магия"),
    "mapGenerator": MessageLookupByLibrary.simpleMessage("генератор карты"),
    "marksADeadCharacterInfo": MessageLookupByLibrary.simpleMessage(
      "отмечает мёртвого персонажа",
    ),
    "marriage": MessageLookupByLibrary.simpleMessage("марьяж:"),
    "menu": MessageLookupByLibrary.simpleMessage("меню"),
    "mode": MessageLookupByLibrary.simpleMessage("режим"),
    "modifiers": MessageLookupByLibrary.simpleMessage("модификаторы"),
    "moveHistory": MessageLookupByLibrary.simpleMessage("история ходов"),
    "multiplayer": MessageLookupByLibrary.simpleMessage("мультиплеер"),
    "munchkin": MessageLookupByLibrary.simpleMessage("манчкин"),
    "munchkinCombatCompareLevels": MessageLookupByLibrary.simpleMessage(
      "сравните уровень вашего персонажа (с учетом бонусов) с уровнем монстра.",
    ),
    "munchkinCombatEscapeRules": MessageLookupByLibrary.simpleMessage(
      "если вы не смогли победить, убегайте (киньте кубик). успешный побег на 5 или 6. если не сбежали, применяются последствия, указанные на карте монстра.",
    ),
    "munchkinCombatHelpOrBoost": MessageLookupByLibrary.simpleMessage(
      "если ваш уровень меньше, можно: попросить помощи у другого игрока (по договоренности) или использовать карты из руки для усиления.",
    ),
    "munchkinCombatTitle": MessageLookupByLibrary.simpleMessage(
      "бой (если есть монстр):",
    ),
    "munchkinCombatWinCondition": MessageLookupByLibrary.simpleMessage(
      "если ваш уровень выше или равен — вы побеждаете и получаете сокровища, а также уровень.",
    ),
    "munchkinCurseEncounter": MessageLookupByLibrary.simpleMessage(
      "проклятие: немедленно примените его к себе.",
    ),
    "munchkinCursesCardType": MessageLookupByLibrary.simpleMessage(
      "проклятия — ухудшают персонажа или мешают другим игрокам.",
    ),
    "munchkinDeathRules": MessageLookupByLibrary.simpleMessage(
      "смерть: игрок теряет все карты, кроме уровня и рас (или классов).",
    ),
    "munchkinEndTurnDiscardRules": MessageLookupByLibrary.simpleMessage(
      "в конце хода сбросьте лишние карты, если их больше 5. отдайте их игроку с самым низким уровнем.",
    ),
    "munchkinEquipmentCardType": MessageLookupByLibrary.simpleMessage(
      "снаряжение — дает бонусы к уровню в бою.",
    ),
    "munchkinGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "первым достичь 10 уровня, сражаясь с монстрами, используя карты снаряжения, проклятия и умения.",
    ),
    "munchkinInitialCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "каждый игрок берет по: 4 карты из колоды дверей и 4 карты из колоды сокровищ.",
    ),
    "munchkinLevel10Condition": MessageLookupByLibrary.simpleMessage(
      "уровень 10: последний уровень можно достичь только победой над монстром.",
    ),
    "munchkinMonsterEncounter": MessageLookupByLibrary.simpleMessage(
      "монстр: сразитесь с ним (см. «бой»).",
    ),
    "munchkinMonsterEnhancersCardType": MessageLookupByLibrary.simpleMessage(
      "усилители монстров — увеличивают силу монстра.",
    ),
    "munchkinMonsterVictoryReward": MessageLookupByLibrary.simpleMessage(
      "победа над монстром: за победу над монстром получаете уровень и сокровища.",
    ),
    "munchkinMonstersCardType": MessageLookupByLibrary.simpleMessage(
      "монстры — сражайтесь с ними, чтобы повышать уровень.",
    ),
    "munchkinNoMonsterActionsDescription": MessageLookupByLibrary.simpleMessage(
      "выложить монстра из руки для боя (опционально) или залезть в «поиск неприятностей» (взять карту из колоды дверей в руку).",
    ),
    "munchkinNoMonsterActionsTitle": MessageLookupByLibrary.simpleMessage(
      "если монстра нет, игрок может:",
    ),
    "munchkinOneTimeItemsCardType": MessageLookupByLibrary.simpleMessage(
      "одноразовые предметы — используются в бою или для других эффектов.",
    ),
    "munchkinOtherCardEncounter": MessageLookupByLibrary.simpleMessage(
      "любая другая карта: оставьте ее в руке.",
    ),
    "munchkinShuffleCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "перемешайте карты дверей и сокровищ и разложите их в две отдельные колоды.",
    ),
    "munchkinStartingGearInstruction": MessageLookupByLibrary.simpleMessage(
      "игроки выкладывают на стол начальные карты снаряжения, если таковые есть.",
    ),
    "munchkinTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "munchkin® является зарегистрированной торговой маркой компании steve jackson games",
    ),
    "munchkinTurnDescription": MessageLookupByLibrary.simpleMessage(
      "игрок открывает верхнюю карту из колоды дверей. возможные ситуации:",
    ),
    "munchkinVictoryCondition": MessageLookupByLibrary.simpleMessage(
      "игрок, первым достигший 10 уровня, побеждает!",
    ),
    "myOtherApps": MessageLookupByLibrary.simpleMessage(
      "мои другие приложения",
    ),
    "nWord": MessageLookupByLibrary.simpleMessage("\nслово"),
    "name": MessageLookupByLibrary.simpleMessage("имя"),
    "newGame": MessageLookupByLibrary.simpleMessage("новая игра"),
    "newGameWithSamePlayers": MessageLookupByLibrary.simpleMessage("еще раунд"),
    "nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "следующий игрок берет 1 карту и пропускает ход.",
        ),
    "nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "следующий игрок берет 5 карт и пропускает ход.",
        ),
    "nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "следующий игрок берет две карты и пропускает ход.",
        ),
    "nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "следующий игрок берёт карты, пока не вытянет карту выбранного цвета.",
        ),
    "nine0Points": MessageLookupByLibrary.simpleMessage("девятка: 0 очков"),
    "no": MessageLookupByLibrary.simpleMessage("нет"),
    "noClass": MessageLookupByLibrary.simpleMessage("без класса"),
    "noItem": MessageLookupByLibrary.simpleMessage("без предмета"),
    "numberCards": MessageLookupByLibrary.simpleMessage("номерные карты"),
    "off": MessageLookupByLibrary.simpleMessage("выкл."),
    "on": MessageLookupByLibrary.simpleMessage("вкл."),
    "options": MessageLookupByLibrary.simpleMessage("опции"),
    "others": MessageLookupByLibrary.simpleMessage("другое"),
    "pass": MessageLookupByLibrary.simpleMessage("пас"),
    "play": MessageLookupByLibrary.simpleMessage("играть"),
    "playerName": MessageLookupByLibrary.simpleMessage("имя игрока"),
    "playerOnBarrel": MessageLookupByLibrary.simpleMessage("игрок на бочке:"),
    "players": MessageLookupByLibrary.simpleMessage("игроки"),
    "playersOnBarrel": MessageLookupByLibrary.simpleMessage("игроки на бочке:"),
    "points": MessageLookupByLibrary.simpleMessage("очков"),
    "pointsConfirmed": MessageLookupByLibrary.simpleMessage(
      "очки подтверждены",
    ),
    "pointsCount": m1,
    "possiblyTheRemovalOfCursesOrDebuffs": MessageLookupByLibrary.simpleMessage(
      "снятие проклятий или дебафов",
    ),
    "preparation": MessageLookupByLibrary.simpleMessage("подготовка:"),
    "projectWebsite": MessageLookupByLibrary.simpleMessage("сайт проекта"),
    "queen": MessageLookupByLibrary.simpleMessage("дама"),
    "queen3Points": MessageLookupByLibrary.simpleMessage("дама: 3 очка"),
    "race1": MessageLookupByLibrary.simpleMessage("раса 1"),
    "rateTheApp": MessageLookupByLibrary.simpleMessage("оцените приложение"),
    "reportABug": MessageLookupByLibrary.simpleMessage("сообщить об ошибке"),
    "resources": MessageLookupByLibrary.simpleMessage("ресурсы:"),
    "results": MessageLookupByLibrary.simpleMessage("результат"),
    "returnToMenu": MessageLookupByLibrary.simpleMessage("вернуться в меню"),
    "reverseCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "карта «смена направления»",
    ),
    "rightHand": MessageLookupByLibrary.simpleMessage("правая рука"),
    "rollDiceLocale": MessageLookupByLibrary.simpleMessage("бросить кубики"),
    "round": MessageLookupByLibrary.simpleMessage("раунд"),
    "rules": MessageLookupByLibrary.simpleMessage("правила"),
    "russian": MessageLookupByLibrary.simpleMessage("русский"),
    "score": MessageLookupByLibrary.simpleMessage("счет"),
    "score50ExtraPointsForUsingAll7Tiles": MessageLookupByLibrary.simpleMessage(
      "50 дополнительных очков за использование всех 7 букв",
    ),
    "scrabble": MessageLookupByLibrary.simpleMessage("скраббл"),
    "scrabbleAdditionalDisputedWords": MessageLookupByLibrary.simpleMessage(
      "спорные слова проверяются в согласованном словаре.",
    ),
    "scrabbleAdditionalPointsTitle": MessageLookupByLibrary.simpleMessage(
      "дополнительные моменты:",
    ),
    "scrabbleAdditionalReplaceTiles": MessageLookupByLibrary.simpleMessage(
      "можно заменить буквы, пропустив ход.",
    ),
    "scrabbleAdditionalWordRules": MessageLookupByLibrary.simpleMessage(
      "все слова должны быть завершенными и соответствовать правилам языка.",
    ),
    "scrabbleEndGameNoTiles": MessageLookupByLibrary.simpleMessage(
      "закончились буквы в мешочке, и никто не может сделать ход.",
    ),
    "scrabbleEndGameRemainingTilesPenalty":
        MessageLookupByLibrary.simpleMessage(
          "оставшиеся буквы на подставках вычитаются из очков.",
        ),
    "scrabbleEndGameSkippedTurns": MessageLookupByLibrary.simpleMessage(
      "все игроки пропустили ходы дважды.",
    ),
    "scrabbleFeatureBlankTile": MessageLookupByLibrary.simpleMessage(
      "пустышка заменяет любую букву, но не дает очков.",
    ),
    "scrabbleFeatureRefillTiles": MessageLookupByLibrary.simpleMessage(
      "каждый ход игрок добирает буквы, чтобы снова иметь 7.",
    ),
    "scrabbleFeatureSevenTileBonus": MessageLookupByLibrary.simpleMessage(
      "если использованы все 7 букв за ход, игрок получает 50 бонусных очков.",
    ),
    "scrabbleFeaturesTitle": MessageLookupByLibrary.simpleMessage(
      "особенности:",
    ),
    "scrabbleGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "составляйте слова на игровом поле по принципу кроссворда. заработайте больше очков, чем соперники.",
    ),
    "scrabbleGameSetAccessories": MessageLookupByLibrary.simpleMessage(
      "4 подставки, мешочек для букв.",
    ),
    "scrabbleGameSetBoard": MessageLookupByLibrary.simpleMessage(
      "поле 15 на 15 клеток.",
    ),
    "scrabbleGameSetLetters": MessageLookupByLibrary.simpleMessage(
      "104 буквы (включая 2 пустышки).",
    ),
    "scrabbleGameSetTitle": MessageLookupByLibrary.simpleMessage(
      "комплект игры:",
    ),
    "scrabblePreparationDrawTiles": MessageLookupByLibrary.simpleMessage(
      "каждый игрок берет 7 букв.",
    ),
    "scrabblePreparationFirstTurnRule": MessageLookupByLibrary.simpleMessage(
      "первый ход делает тот, чья случайно вытянутая буква ближе к началу алфавита.",
    ),
    "scrabblePreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "перемешайте буквы в мешочке.",
    ),
    "scrabbleScoringBlueBonus": MessageLookupByLibrary.simpleMessage(
      "синий цвет удваивает/утраивает очки за букву.",
    ),
    "scrabbleScoringRedBonus": MessageLookupByLibrary.simpleMessage(
      "красный цвет удваивает/утраивает очки за слово.",
    ),
    "scrabbleScoringTitle": MessageLookupByLibrary.simpleMessage(
      "подсчет очков:",
    ),
    "scrabbleScoringWordPoints": MessageLookupByLibrary.simpleMessage(
      "очки за слово: сумма очков букв + бонусы от клеток.",
    ),
    "scrabbleTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "scrabble® является зарегистрированной торговой маркой компании hasbro, inc.",
    ),
    "scrabbleTurnRuleFirstWord": MessageLookupByLibrary.simpleMessage(
      "первый ход: слово должно проходить через центральную клетку (звездочка).",
    ),
    "scrabbleTurnRuleLetterPlacement": MessageLookupByLibrary.simpleMessage(
      "каждая новая буква должна быть частью нового или существующего слова.",
    ),
    "scrabbleTurnRuleWordDirection": MessageLookupByLibrary.simpleMessage(
      "все слова выкладываются горизонтально или вертикально.",
    ),
    "scrabbleTurnRulesTitle": MessageLookupByLibrary.simpleMessage(
      "правила хода:",
    ),
    "secondBonus": MessageLookupByLibrary.simpleMessage("второй бонус"),
    "secondRace": MessageLookupByLibrary.simpleMessage("раса 2"),
    "set": MessageLookupByLibrary.simpleMessage("сет"),
    "setCardAttributeFillType": MessageLookupByLibrary.simpleMessage(
      "заполнение: пустое, заштрихованное, закрашенное.",
    ),
    "setCardAttributeNumberOfSymbols": MessageLookupByLibrary.simpleMessage(
      "количество символов: 1, 2 или 3.",
    ),
    "setCardAttributeSymbolColor": MessageLookupByLibrary.simpleMessage(
      "цвет символов: красный, зеленый, фиолетовый.",
    ),
    "setCardAttributeSymbolType": MessageLookupByLibrary.simpleMessage(
      "тип символов: овал, ромб, волна.",
    ),
    "setCardAttributesDescription": MessageLookupByLibrary.simpleMessage(
      "каждая карта уникальна и имеет 4 признака:",
    ),
    "setCardAttributesTitle": MessageLookupByLibrary.simpleMessage(
      "признаки карт:",
    ),
    "setExampleOfValidSetColor": MessageLookupByLibrary.simpleMessage(
      "признак «количество»: одинаковый (два).",
    ),
    "setExampleOfValidSetFill": MessageLookupByLibrary.simpleMessage(
      "что делать, если сет не найден:",
    ),
    "setExampleOfValidSetNumber": MessageLookupByLibrary.simpleMessage(
      "признак «тип»: разный (овал, ромб, волна).",
    ),
    "setExampleOfValidSetTitle": MessageLookupByLibrary.simpleMessage(
      "признак «цвет»: разный (красный, зеленый, фиолетовый).",
    ),
    "setExampleOfValidSetType": MessageLookupByLibrary.simpleMessage(
      "признак «заполнение»: одинаковое (заштрихованное).",
    ),
    "setGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "найти сет (набор из 3 карт), где каждый признак: полностью совпадает на всех картах, или полностью различается на всех картах.",
    ),
    "setGameTurnStepContinue": MessageLookupByLibrary.simpleMessage(
      "пример правильного сета:",
    ),
    "setGameTurnStepDealerSetup": MessageLookupByLibrary.simpleMessage(
      "раздающий выкладывает 12 карт.",
    ),
    "setGameTurnStepFindingSet": MessageLookupByLibrary.simpleMessage(
      "игроки одновременно ищут сет. кто первым находит, объявляет: «сет!».",
    ),
    "setGameTurnStepFour": MessageLookupByLibrary.simpleMessage(
      "игра продолжается",
    ),
    "setGameTurnStepValidation": MessageLookupByLibrary.simpleMessage(
      "проверяется правильность: если верно, игрок забирает карты, раздающий добавляет 3 новые. если ошибка, игрок теряет 1 очко или пропускает ход (по договоренности).",
    ),
    "setImportantRuleCardPosition": MessageLookupByLibrary.simpleMessage(
      "карты, образующие сет, могут располагаться как угодно.",
    ),
    "setImportantRuleConfirmation": MessageLookupByLibrary.simpleMessage(
      "новый сет нельзя объявлять, пока предыдущий не подтвержден.",
    ),
    "setImportantRuleSimplifiedMode": MessageLookupByLibrary.simpleMessage(
      "для обучения можно упростить игру, используя только 3 признака.",
    ),
    "setImportantRulesTitle": MessageLookupByLibrary.simpleMessage(
      "важные правила:",
    ),
    "setNoSetFoundDescription": MessageLookupByLibrary.simpleMessage(
      "если среди 12 карт сета нет, раздающий добавляет 3 карты (максимум до 21 карты). среди 21 карты сет есть всегда.",
    ),
    "setNoSetFoundTitle": MessageLookupByLibrary.simpleMessage(
      "что делать, если сет не найден:",
    ),
    "setScoringGameEnd": MessageLookupByLibrary.simpleMessage(
      "игра заканчивается, когда карты в колоде заканчиваются или достигнуто оговоренное количество очков.",
    ),
    "setScoringPointPerSet": MessageLookupByLibrary.simpleMessage(
      "за каждый найденный сет — 1 очко.",
    ),
    "setScoringTitle": MessageLookupByLibrary.simpleMessage("подсчет очков:"),
    "setTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "set® является зарегистрированной торговой маркой компании set enterprises, inc.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("настройки"),
    "settlement": MessageLookupByLibrary.simpleMessage("поселение"),
    "shareFeedback": MessageLookupByLibrary.simpleMessage("обратная связь"),
    "shareWithFriedns": MessageLookupByLibrary.simpleMessage(
      "поделиться с друзьями",
    ),
    "shareWithFriends": MessageLookupByLibrary.simpleMessage(
      "поделитесь с друзьями",
    ),
    "sinceThisIsAnOpenSourceProjectYouCanLeave":
        MessageLookupByLibrary.simpleMessage(
          "так как это проект с открытым исходным кодом, вы можете внести свой вклад",
        ),
    "singleplayer": MessageLookupByLibrary.simpleMessage("одиночная игра"),
    "skip": MessageLookupByLibrary.simpleMessage("пропуск"),
    "skipCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "карта «пропусти ход»",
    ),
    "skipEveryoneCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "карта «пропустить всех»",
    ),
    "skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "пропускает всех игроков и возвращает ход первоначальному игроку.",
        ),
    "skipsTheNextPlayersTurnUnoInfo": MessageLookupByLibrary.simpleMessage(
      "следующий игрок пропускает ход.",
    ),
    "spanish": MessageLookupByLibrary.simpleMessage("испанский"),
    "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
      "специальные карты (по 2 каждая):",
    ),
    "specialCardsTitle": MessageLookupByLibrary.simpleMessage("особые карты:"),
    "specialRulesTitle": MessageLookupByLibrary.simpleMessage(
      "особые правила:",
    ),
    "subtracting": MessageLookupByLibrary.simpleMessage("вычитание"),
    "superMunch": MessageLookupByLibrary.simpleMessage("супер-жор"),
    "swapHandsWithAnyPlayerAndChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "обменяйтесь картами с любым игроком и выберите цвет.",
        ),
    "sword": MessageLookupByLibrary.simpleMessage("меч"),
    "telegram": MessageLookupByLibrary.simpleMessage("телеграм"),
    "ten10Points": MessageLookupByLibrary.simpleMessage("десятка: 10 очков"),
    "theNumberOfPlayersShouldBe": MessageLookupByLibrary.simpleMessage(
      "количество игроков должно быть",
    ),
    "theRobberRolling7": MessageLookupByLibrary.simpleMessage(
      "разбойник (при выпадении 7):",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("тема"),
    "thief": MessageLookupByLibrary.simpleMessage("вор"),
    "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
      "начиная с игрока после сдающего, игроки торгуются, объявляя сколько очков они смогут набрать (минимальная ставка 100). каждая ставка должна быть выше предыдущей (с шагом 5 или 10 очков).",
    ),
    "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
      "игрок с наибольшей ставкой выигрывает торги, забирает прикуп и объявляет козырную масть. победитель торгов сбрасывает 3 карты рубашкой вверх (но сохраняет их очки).",
    ),
    "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
      "игроки могут спасовать, если не хотят повышать ставку.",
    ),
    "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
      "если победитель торгов набрал свою ставку или больше: он добавляет реально набранные очки к своему счёту.",
    ),
    "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
      "остальные игроки добавляют очки из взятых ими взяток к своему счёту.",
    ),
    "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
      "если победитель торгов не выполнил контракт: его ставка вычитается из счёта (счёт может стать отрицательным).",
    ),
    "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
      "победитель торгов ходит первым, сыграв любую карту. остальные игроки обязаны идти в масть, если могут. если не могут, должны бить козырем, если он есть.",
    ),
    "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
      "взявший взятку ходит следующим. продолжайте, пока все карты не будут разыграны.",
    ),
    "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
      "взятку берёт старшая карта в масти хода, либо старший козырь.",
    ),
    "thousandGoal": MessageLookupByLibrary.simpleMessage(
      "цель игры - первым набрать 1000 очков, выигрывая взятки в игре с торгами. игроки делают ставки на количество очков, которое они смогут набрать, затем пытаются выполнить свой контракт.",
    ),
    "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
      "марьяж засчитывается только если вы взяли хотя бы одну взятку.",
    ),
    "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
      "марьяж - это король и дама одной масти на руках.",
    ),
    "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
      "некозырной марьяж: 80 очков (действует то же правило).",
    ),
    "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
      "козырной марьяж: 100 очков (должен быть объявлен при розыгрыше первой карты из пары).",
    ),
    "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
      "используйте колоду из 24 карт: 9, 10, валет, дама, король, туз всех четырёх мастей.",
    ),
    "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
      "положите 3 карты рубашкой вверх в центр стола - это прикуп (талон).",
    ),
    "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "сдайте по 7 карт каждому игроку (для 3 игроков) или по 8 карт (для 2 игроков).",
    ),
    "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
      "правило «бочки»: если игрок набрал 880+ очков, он «на бочке» и должен набрать ровно 1000, иначе опускается обратно до 880.",
    ),
    "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
      "в некоторых вариантах нужно набрать ровно 1000 очков. перебор возвращает вас на 880 или предыдущий счёт.",
    ),
    "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
      "всего очков в колоде: 120. добавляйте бонусы за марьяжи, если применимо.",
    ),
    "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
      "первый игрок, набравший 1000 очков (или ровно 1000, в зависимости от домашних правил), выигрывает игру.",
    ),
    "toAllWhoCreatedThe": MessageLookupByLibrary.simpleMessage(
      "спасибо всем, кто создал",
    ),
    "toBoardBuddysContributors": MessageLookupByLibrary.simpleMessage(
      "всем, кто внес вклад в разработку board buddy",
    ),
    "total": MessageLookupByLibrary.simpleMessage("всего"),
    "totalStrength": MessageLookupByLibrary.simpleMessage("общая сила: "),
    "trading": MessageLookupByLibrary.simpleMessage("торговля:"),
    "tripleTheValueOfALetterScrabbleInfo": MessageLookupByLibrary.simpleMessage(
      "утраивает значение буквы",
    ),
    "tripleTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("утраивает значение всего слова"),
    "twoHanded": MessageLookupByLibrary.simpleMessage("двуручный"),
    "uno": MessageLookupByLibrary.simpleMessage("уно"),
    "unoActiveCardDrawTwo": MessageLookupByLibrary.simpleMessage(
      "«возьми две»: следующий игрок берет 2 карты и пропускает ход.",
    ),
    "unoActiveCardReverse": MessageLookupByLibrary.simpleMessage(
      "«смени направление»: меняет направление игры.",
    ),
    "unoActiveCardSkipTurn": MessageLookupByLibrary.simpleMessage(
      "«пропусти ход»: следующий игрок пропускает ход.",
    ),
    "unoActiveCardWild": MessageLookupByLibrary.simpleMessage(
      "дикая карта: позволяет выбрать цвет игры.",
    ),
    "unoActiveCardWildDrawFour": MessageLookupByLibrary.simpleMessage(
      "дикая карта «возьми четыре»: позволяет выбрать цвет, а следующий игрок берет 4 карты. можно сыграть, только если нет других карт того же цвета.",
    ),
    "unoActiveCardsTitle": MessageLookupByLibrary.simpleMessage(
      "активные карты:",
    ),
    "unoFlip": MessageLookupByLibrary.simpleMessage("уно флип"),
    "unoFlipDarkSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "тёмная сторона:",
    ),
    "unoFlipDarkSideDrawFive": MessageLookupByLibrary.simpleMessage(
      "«возьми пять»",
    ),
    "unoFlipDarkSideDrawUntilColor": MessageLookupByLibrary.simpleMessage(
      "«бери, пока не вытянешь нужный цвет»",
    ),
    "unoFlipDarkSideReverse": MessageLookupByLibrary.simpleMessage(
      "«смени направление»",
    ),
    "unoFlipDarkSideSkipAll": MessageLookupByLibrary.simpleMessage(
      "«все пропускают ход»",
    ),
    "unoFlipDarkSideWildCard": MessageLookupByLibrary.simpleMessage(
      "«дикая карта»",
    ),
    "unoFlipGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "избавьтесь от всех своих карт и наберите очки за карты соперников. побеждает игрок, набравший 500 очков.",
    ),
    "unoFlipGameStartDealCards": MessageLookupByLibrary.simpleMessage(
      "каждый игрок получает 7 карт.",
    ),
    "unoFlipGameStartLightSide": MessageLookupByLibrary.simpleMessage(
      "игру начинают светлой стороной колоды.",
    ),
    "unoFlipGameStartTitle": MessageLookupByLibrary.simpleMessage(
      "начало игры:",
    ),
    "unoFlipKeyMoment": MessageLookupByLibrary.simpleMessage(
      "ключевые моменты:",
    ),
    "unoFlipKeyMomentFlipCardEffect": MessageLookupByLibrary.simpleMessage(
      "после карты «переверните» вся игра меняет сторону.",
    ),
    "unoFlipKeyMomentUnoCall": MessageLookupByLibrary.simpleMessage(
      "если игрок играет предпоследней картой, он должен сказать «уно!». если забыл, берёт 2 карты.",
    ),
    "unoFlipLightSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "светлая сторона:",
    ),
    "unoFlipLightSideDrawOne": MessageLookupByLibrary.simpleMessage(
      "«возьми одну»",
    ),
    "unoFlipLightSideReverse": MessageLookupByLibrary.simpleMessage(
      "«смени направление»",
    ),
    "unoFlipLightSideSkipTurn": MessageLookupByLibrary.simpleMessage(
      "«пропусти ход»",
    ),
    "unoFlipLightSideWildCard": MessageLookupByLibrary.simpleMessage(
      "«дикая карта»",
    ),
    "unoFlipLightSideWildDrawTwo": MessageLookupByLibrary.simpleMessage(
      "«дикая +2»",
    ),
    "unoFlipScoringActiveCards": MessageLookupByLibrary.simpleMessage(
      "активные карты: 20–60 очков в зависимости от типа.",
    ),
    "unoFlipScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "карты с цифрами: по их номиналу.",
    ),
    "unoFlipScoringRoundWinnerPoints": MessageLookupByLibrary.simpleMessage(
      "победитель раунда получает очки за оставшиеся карты соперников:",
    ),
    "unoFlipScoringTitle": MessageLookupByLibrary.simpleMessage(
      "подсчёт очков:",
    ),
    "unoFlipTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno flip® является зарегистрированной торговой маркой компании mattel",
    ),
    "unoFlipTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "если подходящей карты нет, возьмите карту из колоды.",
    ),
    "unoFlipTurnRuleFlipCard": MessageLookupByLibrary.simpleMessage(
      "карта «переверните» меняет сторону игры с «светлой» на «тёмную» и наоборот.",
    ),
    "unoFlipTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "сыграйте карту, совпадающую по цвету, числу или символу с верхней картой сброса.",
    ),
    "unoFlipVictory500Points": MessageLookupByLibrary.simpleMessage(
      "игрок, набравший 500 очков, выигрывает игру.",
    ),
    "unoFlipVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.",
    ),
    "unoGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "первым избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 500 очков.",
    ),
    "unoGameTurnTitle": MessageLookupByLibrary.simpleMessage(
      "игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.",
    ),
    "unoPreparationDeckInCenter": MessageLookupByLibrary.simpleMessage(
      "остальная колода кладется в центр (это колода для добора).",
    ),
    "unoPreparationDistributeCards": MessageLookupByLibrary.simpleMessage(
      "каждому игроку раздается по 7 карт.",
    ),
    "unoPreparationFlipFirstCard": MessageLookupByLibrary.simpleMessage(
      "верхняя карта переворачивается (это начальная карта сброса).",
    ),
    "unoScoring20PointsCards": MessageLookupByLibrary.simpleMessage(
      "«пропусти ход», «возьми две», «смени направление»: 20 очков.",
    ),
    "unoScoring40PointsCards": MessageLookupByLibrary.simpleMessage(
      "«обмен», пустая карта: 40 очков.",
    ),
    "unoScoring50PointsCards": MessageLookupByLibrary.simpleMessage(
      "дикая карта, «возьми четыре»: 50 очков.",
    ),
    "unoScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "цифровые карты: их номинал.",
    ),
    "unoScoringTitle": MessageLookupByLibrary.simpleMessage("подсчет очков:"),
    "unoSpecialCardBlank": MessageLookupByLibrary.simpleMessage(
      "пустая карта: придумайте правило перед игрой.",
    ),
    "unoSpecialCardSwap": MessageLookupByLibrary.simpleMessage(
      "«обмен»: обмен картами с любым игроком и выбор цвета.",
    ),
    "unoSpecialRuleReshuffle": MessageLookupByLibrary.simpleMessage(
      "если кончилась колода добора, сброс перетасовывается.",
    ),
    "unoSpecialRuleUnoCall": MessageLookupByLibrary.simpleMessage(
      "забыл крикнуть «уно»? возьми 2 карты, если заметили до хода следующего игрока.",
    ),
    "unoTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno® является зарегистрированной торговой маркой компании mattel",
    ),
    "unoTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "если подходящей карты нет, берется карта из колоды. если она подходит, можно сыграть.",
    ),
    "unoTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.",
    ),
    "unoTurnRuleOptionalDraw": MessageLookupByLibrary.simpleMessage(
      "игрок может взять карту, даже если у него есть подходящая, но использовать ее в этом ходу нельзя.",
    ),
    "unoVictory500Points": MessageLookupByLibrary.simpleMessage(
      "игрок выигрывает, набрав 500 очков.",
    ),
    "unoVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.",
    ),
    "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
      "улучшите поселение до города (+1 очко)",
    ),
    "victoryPointCard": MessageLookupByLibrary.simpleMessage(
      "карта победного очка",
    ),
    "victoryTitle": MessageLookupByLibrary.simpleMessage("победа:"),
    "warrior": MessageLookupByLibrary.simpleMessage("воин"),
    "whoGoesFirst": MessageLookupByLibrary.simpleMessage("кто раздает первым?"),
    "wildCardOneDosInfo": MessageLookupByLibrary.simpleMessage(
      "дикая карта «#»",
    ),
    "wildCardUnoInfo": MessageLookupByLibrary.simpleMessage("дикая карта"),
    "wildDrawColorUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "дикая карта «возьми до цвета»",
    ),
    "wildDrawFourCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "дикая карта «возьми четыре»",
    ),
    "wildDrawTwoCardDosInfo": MessageLookupByLibrary.simpleMessage(
      "дикая карта «возьми две»",
    ),
    "wildShuffleHandsCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "дикая карта «перетасовка рук»",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("победитель: "),
    "wizard": MessageLookupByLibrary.simpleMessage("маг"),
    "wordIsTooLongMaximum15LettersAllowed":
        MessageLookupByLibrary.simpleMessage(
          "слово слишком длинное. максимум 15 букв",
        ),
    "wordModifier": MessageLookupByLibrary.simpleMessage("модификатор: "),
    "x2Word": MessageLookupByLibrary.simpleMessage("x2 слово"),
    "x3Word": MessageLookupByLibrary.simpleMessage("x3 слово"),
    "yes": MessageLookupByLibrary.simpleMessage("да"),
    "youHaveAnUnfinishedGame": MessageLookupByLibrary.simpleMessage(
      "игра не завершена",
    ),
    "yourBet": MessageLookupByLibrary.simpleMessage("свою ставку"),
  };
}
