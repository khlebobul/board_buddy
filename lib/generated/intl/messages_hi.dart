// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
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
  String get localeName => 'hi';

  static String m0(playerName, winningBid) =>
      "क्या ${playerName} ने अपनी बोली (${winningBid} अंक) पूरी की?";

  static String m1(count) => "${Intl.plural(count, one: 'अंक', other: 'अंक')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("के बारे में"),
    "ace": MessageLookupByLibrary.simpleMessage("इक्का"),
    "ace11Points": MessageLookupByLibrary.simpleMessage("इक्का: 11 अंक"),
    "add": MessageLookupByLibrary.simpleMessage("जोड़ें"),
    "addPlayer": MessageLookupByLibrary.simpleMessage("खिलाड़ी जोड़ें"),
    "adding": MessageLookupByLibrary.simpleMessage("जोड़ना"),
    "allowsThePlayerToChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "खिलाड़ी को रंग चुनने की अनुमति देता है।",
        ),
    "appreciation": MessageLookupByLibrary.simpleMessage("श्रेय"),
    "armour": MessageLookupByLibrary.simpleMessage("कवच"),
    "awardedToThePlayerWith3KnightCardsPlayed":
        MessageLookupByLibrary.simpleMessage(
          "3+ नाइट कार्ड खेलने वाले खिलाड़ी को दिया जाता है",
        ),
    "awardedToThePlayerWith5ConnectedRoads":
        MessageLookupByLibrary.simpleMessage(
          "5+ जुड़ी सड़कों वाले खिलाड़ी को दिया जाता है",
        ),
    "back": MessageLookupByLibrary.simpleMessage("वापस"),
    "biddingPhase": MessageLookupByLibrary.simpleMessage("बोली चरण:"),
    "bigArmour": MessageLookupByLibrary.simpleMessage("बड़ा कवच"),
    "bigBoots": MessageLookupByLibrary.simpleMessage("बड़े जूते"),
    "bigHelmet": MessageLookupByLibrary.simpleMessage("बड़ा हेलमेट"),
    "bigMagic": MessageLookupByLibrary.simpleMessage("बड़ा जादू"),
    "bigSword": MessageLookupByLibrary.simpleMessage("बड़ी तलवार"),
    "bingo": MessageLookupByLibrary.simpleMessage("bingo"),
    "blankTile": MessageLookupByLibrary.simpleMessage("खाली\nटाइल"),
    "boardBuddy": MessageLookupByLibrary.simpleMessage("board buddy"),
    "boardBuddyIsYourUltimateBoardGameCompanion":
        MessageLookupByLibrary.simpleMessage(
          "board buddy आपका परम बोर्ड गेम साथी है",
        ),
    "bonusTileOrSpecialMarkerScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("बोनस टाइल या विशेष मार्कर"),
    "boots": MessageLookupByLibrary.simpleMessage("जूते"),
    "buffsOrDebuffsAffectingCharactersitemsInfo":
        MessageLookupByLibrary.simpleMessage(
          "किरदारों/वस्तुओं को प्रभावित करने वाले बफ या डिबफ",
        ),
    "buildANewSettlementOnAnIntersection": MessageLookupByLibrary.simpleMessage(
      "एक चौराहे पर नई बस्ती बनाएँ",
    ),
    "buildingCosts": MessageLookupByLibrary.simpleMessage("निर्माण लागत:"),
    "buildingRules": MessageLookupByLibrary.simpleMessage("निर्माण नियम:"),
    "canBeAnyColorChosenByTheCurrentPlayerIfDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "वर्तमान खिलाड़ी द्वारा चुना गया कोई भी रंग हो सकता है। अगर खींचा जाता है, तो खिलाड़ी रंग तय करता है।",
        ),
    "canRepresentAnyNumberForItsOwnParticularColorDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "अपने विशेष रंग के लिए किसी भी संख्या का प्रतिनिधित्व कर सकता है।",
        ),
    "cancel": MessageLookupByLibrary.simpleMessage("रद्द करें"),
    "card": MessageLookupByLibrary.simpleMessage("कार्ड"),
    "cardTypesTitle": MessageLookupByLibrary.simpleMessage("कार्ड के प्रकार:"),
    "cards": MessageLookupByLibrary.simpleMessage("कार्ड"),
    "catan": MessageLookupByLibrary.simpleMessage("catan"),
    "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
      "विकास कार्ड: 1 ऊन + 1 अनाज + 1 अयस्क",
    ),
    "catanBuildingCostsOne": MessageLookupByLibrary.simpleMessage(
      "सड़क: 1 लकड़ी + 1 ईंट",
    ),
    "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
      "शहर (अपग्रेड): 2 अनाज + 3 अयस्क (2)",
    ),
    "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
      "बस्ती: 1 लकड़ी + 1 ईंट + 1 ऊन + 1 अनाज (1)",
    ),
    "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
      "शहर मौजूदा बस्तियों की जगह लेते हैं",
    ),
    "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
      "सड़कें आपकी मौजूदा सड़कों, बस्तियों या शहरों से जुड़ी होनी चाहिए",
    ),
    "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
      "बस्तियाँ आपके सड़क नेटवर्क से जुड़ी होनी चाहिए",
    ),
    "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
      "बस्तियाँ किसी भी अन्य बस्ती/शहर से कम से कम 2 चौराहे दूर होनी चाहिए",
    ),
    "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
      "2 विशेष कार्ड: सबसे लंबी सड़क, सबसे बड़ी सेना",
    ),
    "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
      "95 संसाधन कार्ड (प्रत्येक 19: लकड़ी, ईंट, ऊन, अनाज, अयस्क)",
    ),
    "catanComponentsFour": MessageLookupByLibrary.simpleMessage("18 नंबर टोकन"),
    "catanComponentsNine": MessageLookupByLibrary.simpleMessage(
      "1 लुटेरा, 2 पासे",
    ),
    "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
      "19 भूभाग हेक्स (4 जंगल, 4 अनाज, 4 चरागाह, 3 पहाड़, 3 पहाड़ी, 1 रेगिस्तान)",
    ),
    "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी के टुकड़े: प्रति खिलाड़ी 5 बस्तियाँ, 4 शहर, 15 सड़कें",
    ),
    "catanComponentsSix": MessageLookupByLibrary.simpleMessage(
      "25 विकास कार्ड",
    ),
    "catanComponentsThree": MessageLookupByLibrary.simpleMessage(
      "9 बंदरगाह के टुकड़े",
    ),
    "catanComponentsTwo": MessageLookupByLibrary.simpleMessage(
      "6 समुद्री फ्रेम के टुकड़े",
    ),
    "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
      "एकाधिकार (2): एक संसाधन का नाम लें, सभी खिलाड़ी आपको वह दें",
    ),
    "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
      "नाइट (14): लुटेरे को हिलाएँ, आसपास के खिलाड़ी से 1 संसाधन चुराएँ",
    ),
    "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
      "सड़क निर्माण (2): मुफ्त में 2 सड़कें बनाएँ",
    ),
    "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
      "विजय अंक (5): 1 मूल्य, जीतने तक छिपा कर रखें",
    ),
    "catanGameGoal": MessageLookupByLibrary.simpleMessage(
      "बस्तियाँ, शहर, सड़कें बनाकर और विशेष कार्ड अर्जित करके 10 विजय अंक तक सबसे पहले पहुँचें।",
    ),
    "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
      "पासा फेंकें: संख्या से मेल खाने वाले हेक्स पर बस्तियों/शहरों वाले सभी खिलाड़ियों को संसाधन मिलते हैं",
    ),
    "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
      "निर्माण: सड़कें, बस्तियाँ, शहर बनाने या विकास कार्ड खरीदने के लिए संसाधन खर्च करें",
    ),
    "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
      "व्यापार: अन्य खिलाड़ियों के साथ संसाधनों का आदान-प्रदान करें या बंदरगाहों का उपयोग करें (4:1 या विशेष दरें)",
    ),
    "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी उल्टे बारी क्रम में 2 बस्तियाँ और 2 सड़कें रखता है",
    ),
    "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
      "समुद्री फ्रेम के अंदर भूभाग हेक्स से बोर्ड बनाएँ",
    ),
    "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
      "रेगिस्तान हेक्स पर लुटेरा रखें",
    ),
    "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "हेक्स पर नंबर टोकन रखें (रेगिस्तान को छोड़कर)",
    ),
    "catanResourcesFive": MessageLookupByLibrary.simpleMessage("पहाड़ – अयस्क"),
    "catanResourcesFour": MessageLookupByLibrary.simpleMessage(
      "खेत – अनाज (गेहूँ)",
    ),
    "catanResourcesOne": MessageLookupByLibrary.simpleMessage("जंगल – लकड़ी"),
    "catanResourcesSix": MessageLookupByLibrary.simpleMessage(
      "रेगिस्तान – कोई संसाधन नहीं",
    ),
    "catanResourcesThree": MessageLookupByLibrary.simpleMessage(
      "चरागाह – ऊन (भेड़)",
    ),
    "catanResourcesTwo": MessageLookupByLibrary.simpleMessage(
      "पहाड़ियाँ – ईंट (मिट्टी)",
    ),
    "catanScoringFive": MessageLookupByLibrary.simpleMessage(
      "विजय अंक कार्ड: प्रत्येक 1",
    ),
    "catanScoringFour": MessageLookupByLibrary.simpleMessage(
      "सबसे बड़ी सेना: 2",
    ),
    "catanScoringOne": MessageLookupByLibrary.simpleMessage("बस्ती: 1"),
    "catanScoringThree": MessageLookupByLibrary.simpleMessage(
      "सबसे लंबी सड़क: 2",
    ),
    "catanScoringTwo": MessageLookupByLibrary.simpleMessage("शहर: 2"),
    "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
      "सबसे लंबी सड़क: 5+ लगातार सड़कों वाला पहला खिलाड़ी (छीना जा सकता है)",
    ),
    "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
      "सबसे बड़ी सेना: 3+ नाइट कार्ड खेलने वाला पहला खिलाड़ी (छीना जा सकता है)",
    ),
    "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
      "लुटेरा वहाँ रहने तक अवरुद्ध हेक्स से कोई संसाधन नहीं मिलता",
    ),
    "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
      "7 से अधिक कार्ड वाले किसी भी खिलाड़ी को आधे (नीचे पूर्णांकित) कार्ड फेंकने होंगे",
    ),
    "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
      "उस हेक्स पर बस्ती/शहर वाले खिलाड़ी से 1 यादृच्छिक संसाधन चुराएँ",
    ),
    "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
      "लुटेरे को किसी भी हेक्स पर ले जाएँ (रेगिस्तान को छोड़कर)",
    ),
    "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "catan® catan gmbh का एक ट्रेडमार्क है।",
    ),
    "catanTradingOne": MessageLookupByLibrary.simpleMessage(
      "घरेलू व्यापार: अपनी बारी में अन्य खिलाड़ियों के साथ कोई भी आदान-प्रदान करें",
    ),
    "catanTradingThree": MessageLookupByLibrary.simpleMessage(
      "बंदरगाह व्यापार: 3:1 सामान्य या 2:1 विशिष्ट संसाधन बंदरगाह",
    ),
    "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
      "समुद्री व्यापार: बैंक के साथ 4:1 (कोई भी 4 समान संसाधन 1 के लिए)",
    ),
    "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
      "अपनी बारी में 10 विजय अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है। आपको अपनी बारी में जीत की घोषणा करनी होगी।",
    ),
    "changesTheColorAndForcesTheNextPlayerToDrawUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "रंग बदलता है और अगले खिलाड़ी को चार कार्ड खींचने पर मजबूर करता है।",
        ),
    "changesTheDirectionOfPlayUnoInfo": MessageLookupByLibrary.simpleMessage(
      "खेल की दिशा बदलता है।",
    ),
    "charactersGenderFemaleInfo": MessageLookupByLibrary.simpleMessage(
      "किरदार का लिंग: महिला",
    ),
    "charactersGenderMaleInfo": MessageLookupByLibrary.simpleMessage(
      "किरदार का लिंग: पुरुष",
    ),
    "checkMyWebsite": MessageLookupByLibrary.simpleMessage(
      "मेरी वेबसाइट देखें",
    ),
    "city": MessageLookupByLibrary.simpleMessage("शहर"),
    "class1": MessageLookupByLibrary.simpleMessage("वर्ग 1"),
    "class2": MessageLookupByLibrary.simpleMessage("वर्ग 2"),
    "clear": MessageLookupByLibrary.simpleMessage("साफ़ करें"),
    "clearance": MessageLookupByLibrary.simpleMessage("निवारण"),
    "cleric": MessageLookupByLibrary.simpleMessage("पुजारी"),
    "close": MessageLookupByLibrary.simpleMessage("बंद करें"),
    "collection": MessageLookupByLibrary.simpleMessage("संग्रह"),
    "collectsFourMermaids": MessageLookupByLibrary.simpleMessage(
      "4 जलपरियाँ इकट्ठा करता है और जीत जाता है!",
    ),
    "colorMajority": MessageLookupByLibrary.simpleMessage("रंग बहुमत"),
    "common": MessageLookupByLibrary.simpleMessage("काउंटर"),
    "confirm": MessageLookupByLibrary.simpleMessage("पुष्टि करें"),
    "continueGame": MessageLookupByLibrary.simpleMessage("खेल जारी रखें"),
    "continueTitle": MessageLookupByLibrary.simpleMessage("जारी रखें"),
    "contractResolution": MessageLookupByLibrary.simpleMessage(
      "अनुबंध समाधान:",
    ),
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage("लॉन्च नहीं हो सका"),
    "currentBet": MessageLookupByLibrary.simpleMessage("वर्तमान बोली:"),
    "currentCount": MessageLookupByLibrary.simpleMessage("वर्तमान गिनती:"),
    "cursed": MessageLookupByLibrary.simpleMessage("अभिशापित"),
    "custom": MessageLookupByLibrary.simpleMessage("(कस्टम)"),
    "dark": MessageLookupByLibrary.simpleMessage("डार्क"),
    "darkSideCardsAreReplacedWithLightOnesAndVice":
        MessageLookupByLibrary.simpleMessage(
          "डार्क साइड कार्ड लाइट कार्डों से बदल जाते हैं और इसके विपरीत।",
        ),
    "developmentCardWorth1VictoryPoint": MessageLookupByLibrary.simpleMessage(
      "1 विजय अंक मूल्य का विकास कार्ड",
    ),
    "developmentCards": MessageLookupByLibrary.simpleMessage("विकास कार्ड:"),
    "didPlayerReachBid": m0,
    "didYouEnter": MessageLookupByLibrary.simpleMessage("पहुँच गए"),
    "doReturn": MessageLookupByLibrary.simpleMessage("वापस जाएँ"),
    "dontHaveYourFavouriteGameEmailMe": MessageLookupByLibrary.simpleMessage(
      "आपका पसंदीदा गेम नहीं है? मुझे ईमेल करें!",
    ),
    "dos": MessageLookupByLibrary.simpleMessage("dos"),
    "dosBonus": MessageLookupByLibrary.simpleMessage("बोनस:"),
    "dosBonusDoubleColorMatchDrawCard": MessageLookupByLibrary.simpleMessage(
      "डबल कलर मैच: अन्य सभी खिलाड़ी 1 कार्ड खींचते हैं।",
    ),
    "dosBonusNumberColorMatchAddCard": MessageLookupByLibrary.simpleMessage(
      "बोनस:",
    ),
    "dosGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "अपने सभी कार्ड खेलें और प्रतिद्वंद्वियों के बचे कार्डों से अंक प्राप्त करें। 200 अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "dosGameObjectiveTitle": MessageLookupByLibrary.simpleMessage("उद्देश्य:"),
    "dosPreparationCentralRow": MessageLookupByLibrary.simpleMessage(
      "\'सेंटर रो\' में 2 कार्ड रखें",
    ),
    "dosPreparationDealCards": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी को 7 कार्ड बाँटें।",
    ),
    "dosPreparationDrawPile": MessageLookupByLibrary.simpleMessage(
      "बाकी डेक को ड्रॉ पाइल के रूप में बगल में रखें।",
    ),
    "dosScoring": MessageLookupByLibrary.simpleMessage("स्कोरिंग:"),
    "dosScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "नंबर कार्ड: अंकित मूल्य।",
    ),
    "dosScoringWildDos": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड dos\': 20 अंक।",
    ),
    "dosScoringWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड #\': 40 अंक।",
    ),
    "dosSpecialCardWildDos": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड dos\': किसी भी रंग के दो कार्डों का विकल्प।",
    ),
    "dosSpecialCardWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड #\': अपने रंग की किसी भी संख्या (1-10) का विकल्प।",
    ),
    "dosSpecialRule": MessageLookupByLibrary.simpleMessage("विशेष नियम:"),
    "dosSpecialRuleDosCall": MessageLookupByLibrary.simpleMessage(
      "जब आपके पास 2 कार्ड बचें, तो \'dos!\' बोलें। अगर भूल गए और पकड़े गए, तो 2 कार्ड खींचें।",
    ),
    "dosTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "dos® mattel का एक पंजीकृत ट्रेडमार्क है।",
    ),
    "dosTurnRuleDoubleMatch": MessageLookupByLibrary.simpleMessage(
      "डबल मैच: दो कार्डों का जोड़ सेंटर रो कार्ड की संख्या के बराबर होता है।",
    ),
    "dosTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "अगर कोई मिलान संभव नहीं है, तो एक कार्ड खींचें। अगर वह मेल खाता है, तो आप उसे खेल सकते हैं।",
    ),
    "dosTurnRuleEndTurn": MessageLookupByLibrary.simpleMessage(
      "अपनी बारी के अंत में, सेंटर रो को 2 कार्डों तक फिर से भरें।",
    ),
    "dosTurnRulePickCards": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी बारी-बारी से अपने हाथ के कार्डों को सेंटर रो के कार्डों से मिलाते हैं:",
    ),
    "dosTurnRuleSingleMatch": MessageLookupByLibrary.simpleMessage(
      "सिंगल मैच: एक कार्ड संख्या से मेल खाता है।",
    ),
    "dosVictory200Points": MessageLookupByLibrary.simpleMessage(
      "200 अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "doublesTheValueOfALetterScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "एक अक्षर का मूल्य दोगुना करता है",
        ),
    "doublesTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "पूरे शब्द का मूल्य दोगुना करता है",
        ),
    "drawFiveUnoFlipInfo": MessageLookupByLibrary.simpleMessage("ड्रॉ फाइव"),
    "drawOneUnoFlipInfo": MessageLookupByLibrary.simpleMessage("ड्रॉ वन"),
    "drawTwoCardUnoInfo": MessageLookupByLibrary.simpleMessage("ड्रॉ टू कार्ड"),
    "dwarf": MessageLookupByLibrary.simpleMessage("बौना"),
    "eachCardHasANumberDeterminingItsValue": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक कार्ड में एक संख्या होती है, जो उसका मूल्य निर्धारित करती है।",
    ),
    "eachCardHasANumberFrom0To9WhichUnoInfo": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक कार्ड में 0 से 9 तक एक संख्या होती है, जो उसका मूल्य निर्धारित करती है।",
    ),
    "eachCardHasANumberFrom1To9Which": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक कार्ड में 1 से 9 तक एक संख्या होती है, जो उसका मूल्य निर्धारित करती है।",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("संपादित करें"),
    "elf": MessageLookupByLibrary.simpleMessage("एल्फ"),
    "emailCopied": MessageLookupByLibrary.simpleMessage("ईमेल कॉपी हो गया"),
    "endGameTitle": MessageLookupByLibrary.simpleMessage("खेल का अंत:"),
    "english": MessageLookupByLibrary.simpleMessage("अंग्रेज़ी"),
    "enterAWord": MessageLookupByLibrary.simpleMessage("एक शब्द दर्ज करें"),
    "enterNumberOfCards": MessageLookupByLibrary.simpleMessage(
      "अपने सबसे आम रंग के कार्डों की संख्या दर्ज करें",
    ),
    "featureRequest": MessageLookupByLibrary.simpleMessage("फीचर अनुरोध"),
    "finish": MessageLookupByLibrary.simpleMessage("समाप्त"),
    "firstBonus": MessageLookupByLibrary.simpleMessage("पहला बोनस"),
    "flipCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage("फ्लिप कार्ड"),
    "flipSide": MessageLookupByLibrary.simpleMessage("फ्लिप साइड"),
    "flipsAllCardsToTheOppositeSideUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "सभी कार्डों को विपरीत तरफ पलटता है।",
        ),
    "followMeOnXTwitter": MessageLookupByLibrary.simpleMessage(
      "x (twitter) पर फॉलो करें",
    ),
    "french": MessageLookupByLibrary.simpleMessage("फ्रेंच"),
    "gameGoal": MessageLookupByLibrary.simpleMessage("खेल का लक्ष्य:"),
    "gameOver": MessageLookupByLibrary.simpleMessage("खेल समाप्त"),
    "gameTurnTitle": MessageLookupByLibrary.simpleMessage("खेल की बारी:"),
    "gameUpTo": MessageLookupByLibrary.simpleMessage("खेल इस तक: "),
    "games": MessageLookupByLibrary.simpleMessage("खेल"),
    "gear": MessageLookupByLibrary.simpleMessage("गियर"),
    "german": MessageLookupByLibrary.simpleMessage("जर्मन"),
    "githubRepository": MessageLookupByLibrary.simpleMessage(
      "github रिपॉजिटरी",
    ),
    "halfBreed": MessageLookupByLibrary.simpleMessage("मिश्र जाति"),
    "halfling": MessageLookupByLibrary.simpleMessage("हाफलिंग"),
    "headGear": MessageLookupByLibrary.simpleMessage("हेड गियर"),
    "helmet": MessageLookupByLibrary.simpleMessage("हेलमेट"),
    "heyMyNameIsGleb": MessageLookupByLibrary.simpleMessage(
      "नमस्ते! मेरा नाम ग्लेब है",
    ),
    "highestScoreWins": MessageLookupByLibrary.simpleMessage(
      "सबसे अधिक स्कोर जीतता है",
    ),
    "human": MessageLookupByLibrary.simpleMessage("मानव"),
    "indicatesAnActiveCurse": MessageLookupByLibrary.simpleMessage(
      "एक सक्रिय अभिशाप को इंगित करता है",
    ),
    "jack": MessageLookupByLibrary.simpleMessage("गुलाम"),
    "jack2Points": MessageLookupByLibrary.simpleMessage("गुलाम: 2 अंक"),
    "keepAwakeMode": MessageLookupByLibrary.simpleMessage("स्क्रीन चालू रखें"),
    "king": MessageLookupByLibrary.simpleMessage("राजा"),
    "king4Points": MessageLookupByLibrary.simpleMessage("राजा: 4 अंक"),
    "languages": MessageLookupByLibrary.simpleMessage("भाषाएँ"),
    "largestArmy": MessageLookupByLibrary.simpleMessage("सबसे बड़ी सेना"),
    "leftHand": MessageLookupByLibrary.simpleMessage("बायाँ हाथ"),
    "letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour":
        MessageLookupByLibrary.simpleMessage(
          " आपको स्कोर और महत्वपूर्ण पलों को आसानी से ट्रैक करने देता है, ताकि आपका ध्यान खेल पर बना रहे",
        ),
    "level": MessageLookupByLibrary.simpleMessage("लेवल"),
    "light": MessageLookupByLibrary.simpleMessage("लाइट"),
    "longestRoad": MessageLookupByLibrary.simpleMessage("सबसे लंबी सड़क"),
    "lowestScoreWins": MessageLookupByLibrary.simpleMessage(
      "सबसे कम स्कोर जीतता है",
    ),
    "magic": MessageLookupByLibrary.simpleMessage("जादू"),
    "mapGenerator": MessageLookupByLibrary.simpleMessage("मानचित्र जनरेटर"),
    "marksADeadCharacterInfo": MessageLookupByLibrary.simpleMessage(
      "मृत किरदार को चिह्नित करता है",
    ),
    "marriage": MessageLookupByLibrary.simpleMessage("शादी:"),
    "menu": MessageLookupByLibrary.simpleMessage("मेनू"),
    "mermaidVictory": MessageLookupByLibrary.simpleMessage("जलपरी जीत"),
    "mode": MessageLookupByLibrary.simpleMessage("मोड"),
    "modifiers": MessageLookupByLibrary.simpleMessage("मॉडिफायर"),
    "moveHistory": MessageLookupByLibrary.simpleMessage("चाल इतिहास"),
    "multiplayer": MessageLookupByLibrary.simpleMessage("मल्टीप्लेयर"),
    "munchkin": MessageLookupByLibrary.simpleMessage("munchkin"),
    "munchkinCombatCompareLevels": MessageLookupByLibrary.simpleMessage(
      "अपने किरदार के लेवल (बोनस सहित) की तुलना राक्षस के लेवल से करें।",
    ),
    "munchkinCombatEscapeRules": MessageLookupByLibrary.simpleMessage(
      "अगर आप जीतने में विफल रहते हैं, तो भागें (पासा फेंकें)। 5 या 6 आने पर सफल होते हैं। अगर भागने में विफल रहते हैं, तो राक्षस कार्ड पर लिखे परिणामों का पालन करें।",
    ),
    "munchkinCombatHelpOrBoost": MessageLookupByLibrary.simpleMessage(
      "अगर आपका लेवल कम है, तो आप: किसी अन्य खिलाड़ी से मदद माँगें (बातचीत से) या अपने हाथ से कार्ड का उपयोग करके खुद को बढ़ावा दें।",
    ),
    "munchkinCombatTitle": MessageLookupByLibrary.simpleMessage(
      "लड़ाई (अगर राक्षस है):",
    ),
    "munchkinCombatWinCondition": MessageLookupByLibrary.simpleMessage(
      "अगर आपका लेवल बराबर या अधिक है, तो आप जीतते हैं और खज़ाना और एक लेवल पाते हैं।",
    ),
    "munchkinCurseEncounter": MessageLookupByLibrary.simpleMessage(
      "अभिशाप: तुरंत इसे अपने ऊपर लागू करें।",
    ),
    "munchkinCursesCardType": MessageLookupByLibrary.simpleMessage(
      "अभिशाप — आपके किरदार या अन्य खिलाड़ियों को बाधित करता है।",
    ),
    "munchkinDeathRules": MessageLookupByLibrary.simpleMessage(
      "मृत्यु: आप अपने लेवल और जातियों (या वर्गों) को छोड़कर सभी कार्ड खो देते हैं।",
    ),
    "munchkinEndTurnDiscardRules": MessageLookupByLibrary.simpleMessage(
      "अपनी बारी के अंत में, अगर आपके पास 5 से अधिक कार्ड हैं तो अतिरिक्त कार्ड फेंक दें। उन्हें सबसे कम लेवल वाले खिलाड़ी को दें।",
    ),
    "munchkinEquipmentCardType": MessageLookupByLibrary.simpleMessage(
      "उपकरण — लड़ाई के दौरान आपके लेवल में बोनस देता है।",
    ),
    "munchkinGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "राक्षसों से लड़कर, उपकरण, अभिशाप और क्षमता कार्ड का उपयोग करके सबसे पहले लेवल 10 तक पहुँचें।",
    ),
    "munchkinInitialCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी लेता है: दरवाज़े के डेक से 4 कार्ड और खज़ाने के डेक से 4 कार्ड।",
    ),
    "munchkinLevel10Condition": MessageLookupByLibrary.simpleMessage(
      "लेवल 10: अंतिम लेवल केवल राक्षस को हराकर ही प्राप्त किया जा सकता है।",
    ),
    "munchkinMonsterEncounter": MessageLookupByLibrary.simpleMessage(
      "राक्षस: उससे लड़ें (\'लड़ाई\' देखें)।",
    ),
    "munchkinMonsterEnhancersCardType": MessageLookupByLibrary.simpleMessage(
      "राक्षस बढ़ाने वाले — राक्षस की ताकत बढ़ाते हैं।",
    ),
    "munchkinMonsterVictoryReward": MessageLookupByLibrary.simpleMessage(
      "राक्षस पर जीत: राक्षस को हराने पर आपको एक लेवल और खज़ाना मिलता है।",
    ),
    "munchkinMonstersCardType": MessageLookupByLibrary.simpleMessage(
      "राक्षस — लेवल बढ़ाने के लिए उनसे लड़ें।",
    ),
    "munchkinNoMonsterActionsDescription": MessageLookupByLibrary.simpleMessage(
      "अपने हाथ से एक राक्षस खेलकर लड़ें (वैकल्पिक) या \'मुसीबत ढूंढें\' (दरवाज़े के डेक से एक कार्ड हाथ में खींचें)।",
    ),
    "munchkinNoMonsterActionsTitle": MessageLookupByLibrary.simpleMessage(
      "अगर कोई राक्षस नहीं है, तो खिलाड़ी कर सकता है:",
    ),
    "munchkinOneTimeItemsCardType": MessageLookupByLibrary.simpleMessage(
      "एक बार उपयोग की वस्तुएँ — लड़ाई में या अन्य प्रभावों के लिए उपयोग की जाती हैं।",
    ),
    "munchkinOtherCardEncounter": MessageLookupByLibrary.simpleMessage(
      "कोई अन्य कार्ड: इसे अपने हाथ में रखें।",
    ),
    "munchkinShuffleCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "दरवाज़े और खज़ाने के कार्डों को शफल करें और उन्हें दो अलग-अलग डेक में बाँटें।",
    ),
    "munchkinStartingGearInstruction": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी अपने शुरुआती उपकरण कार्ड टेबल पर रखें, अगर उनके पास हों।",
    ),
    "munchkinTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "munchkin® steve jackson games का एक पंजीकृत ट्रेडमार्क है।",
    ),
    "munchkinTurnDescription": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी दरवाज़े के डेक से सबसे ऊपर का कार्ड खींचता है। संभावित परिणाम:",
    ),
    "munchkinVictoryCondition": MessageLookupByLibrary.simpleMessage(
      "सबसे पहले लेवल 10 तक पहुँचने वाला खिलाड़ी जीतता है!",
    ),
    "myOtherApps": MessageLookupByLibrary.simpleMessage("मेरे अन्य ऐप्स"),
    "nWord": MessageLookupByLibrary.simpleMessage("\nशब्द"),
    "name": MessageLookupByLibrary.simpleMessage("नाम"),
    "newGame": MessageLookupByLibrary.simpleMessage("नया खेल"),
    "newGameWithSamePlayers": MessageLookupByLibrary.simpleMessage(
      "एक और राउंड",
    ),
    "nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "अगला खिलाड़ी 1 कार्ड खींचता है और बारी छोड़ता है।",
        ),
    "nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "अगला खिलाड़ी 5 कार्ड खींचता है और बारी छोड़ता है।",
        ),
    "nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "अगला खिलाड़ी दो कार्ड खींचता है और अपनी बारी खो देता है।",
        ),
    "nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "अगला खिलाड़ी चुने हुए रंग तक खींचता रहता है।",
        ),
    "nine0Points": MessageLookupByLibrary.simpleMessage("नौ: 0 अंक"),
    "no": MessageLookupByLibrary.simpleMessage("नहीं"),
    "noClass": MessageLookupByLibrary.simpleMessage("कोई वर्ग नहीं"),
    "noItem": MessageLookupByLibrary.simpleMessage("कोई वस्तु नहीं"),
    "numberButtons": MessageLookupByLibrary.simpleMessage("नंबर बटन"),
    "numberButtonsDescription": MessageLookupByLibrary.simpleMessage(
      "बेस कार्ड (क्रैब, बोट, फिश, शार्क, स्विमर, सेलर, कैप्टन, लाइटहाउस) और उनके संयोजनों के लिए उपयोग करें। अपने कुल अंकों से मेल खाने वाला बटन दबाएँ।",
    ),
    "numberCards": MessageLookupByLibrary.simpleMessage("नंबर कार्ड"),
    "off": MessageLookupByLibrary.simpleMessage("बंद"),
    "on": MessageLookupByLibrary.simpleMessage("चालू"),
    "options": MessageLookupByLibrary.simpleMessage("विकल्प"),
    "others": MessageLookupByLibrary.simpleMessage("अन्य"),
    "pass": MessageLookupByLibrary.simpleMessage("पास"),
    "play": MessageLookupByLibrary.simpleMessage("खेलें"),
    "playerName": MessageLookupByLibrary.simpleMessage("खिलाड़ी का नाम"),
    "playerOnBarrel": MessageLookupByLibrary.simpleMessage("बैरल पर खिलाड़ी:"),
    "players": MessageLookupByLibrary.simpleMessage("खिलाड़ी"),
    "playersOnBarrel": MessageLookupByLibrary.simpleMessage("बैरल पर खिलाड़ी:"),
    "points": MessageLookupByLibrary.simpleMessage("अंक"),
    "pointsConfirmed": MessageLookupByLibrary.simpleMessage("अंक पुष्ट हुए"),
    "pointsCount": m1,
    "possiblyTheRemovalOfCursesOrDebuffs": MessageLookupByLibrary.simpleMessage(
      "अभिशाप या डिबफ को संभवतः हटाना",
    ),
    "preparation": MessageLookupByLibrary.simpleMessage("तैयारी:"),
    "projectWebsite": MessageLookupByLibrary.simpleMessage("प्रोजेक्ट वेबसाइट"),
    "queen": MessageLookupByLibrary.simpleMessage("रानी"),
    "queen3Points": MessageLookupByLibrary.simpleMessage("रानी: 3 अंक"),
    "race1": MessageLookupByLibrary.simpleMessage("जाति 1"),
    "rateTheApp": MessageLookupByLibrary.simpleMessage("ऐप को रेट करें"),
    "reportABug": MessageLookupByLibrary.simpleMessage("बग रिपोर्ट करें"),
    "resources": MessageLookupByLibrary.simpleMessage("संसाधन:"),
    "results": MessageLookupByLibrary.simpleMessage("परिणाम"),
    "returnToMenu": MessageLookupByLibrary.simpleMessage("मेनू पर वापस"),
    "reverseCardUnoInfo": MessageLookupByLibrary.simpleMessage("रिवर्स कार्ड"),
    "rightHand": MessageLookupByLibrary.simpleMessage("दायाँ हाथ"),
    "rollDiceLocale": MessageLookupByLibrary.simpleMessage("पासा फेंकें"),
    "round": MessageLookupByLibrary.simpleMessage("राउंड"),
    "rules": MessageLookupByLibrary.simpleMessage("नियम"),
    "russian": MessageLookupByLibrary.simpleMessage("रूसी"),
    "score": MessageLookupByLibrary.simpleMessage("स्कोर"),
    "score50ExtraPointsForUsingAll7Tiles": MessageLookupByLibrary.simpleMessage(
      "सभी 7 टाइलों का उपयोग करने पर 50 अतिरिक्त अंक प्राप्त करें",
    ),
    "scrabble": MessageLookupByLibrary.simpleMessage("scrabble"),
    "scrabbleAdditionalDisputedWords": MessageLookupByLibrary.simpleMessage(
      "विवादित शब्दों की जाँच सहमत शब्दकोश में की जाती है।",
    ),
    "scrabbleAdditionalPointsTitle": MessageLookupByLibrary.simpleMessage(
      "अतिरिक्त नियम:",
    ),
    "scrabbleAdditionalReplaceTiles": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी टाइलें बदल सकते हैं और अपनी बारी पास कर सकते हैं।",
    ),
    "scrabbleAdditionalWordRules": MessageLookupByLibrary.simpleMessage(
      "सभी शब्द पूर्ण होने चाहिए और भाषा के नियमों का पालन करने चाहिए।",
    ),
    "scrabbleEndGameNoTiles": MessageLookupByLibrary.simpleMessage(
      "खेल तब समाप्त होता है जब कोई टाइल नहीं बचती और कोई चाल नहीं बन सकती।",
    ),
    "scrabbleEndGameRemainingTilesPenalty":
        MessageLookupByLibrary.simpleMessage(
          "बचे हुए टाइलें खिलाड़ी के स्कोर से घटाई जाती हैं।",
        ),
    "scrabbleEndGameSkippedTurns": MessageLookupByLibrary.simpleMessage(
      "खेल तब समाप्त होता है जब सभी खिलाड़ी दो बार अपनी बारी पास करते हैं।",
    ),
    "scrabbleFeatureBlankTile": MessageLookupByLibrary.simpleMessage(
      "खाली टाइलें किसी भी अक्षर का प्रतिनिधित्व कर सकती हैं लेकिन कोई अंक नहीं देतीं।",
    ),
    "scrabbleFeatureRefillTiles": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी प्रत्येक बारी के बाद अपने रैक को 7 तक भरने के लिए टाइलें खींचते हैं।",
    ),
    "scrabbleFeatureSevenTileBonus": MessageLookupByLibrary.simpleMessage(
      "एक बारी में सभी 7 टाइलों का उपयोग करने पर 50 अंक का बोनस मिलता है।",
    ),
    "scrabbleFeaturesTitle": MessageLookupByLibrary.simpleMessage("विशेषताएँ:"),
    "scrabbleGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "बोर्ड पर क्रॉसवर्ड शैली में शब्द बनाएँ। अपने प्रतिद्वंद्वियों से अधिक अंक प्राप्त करें।",
    ),
    "scrabbleGameSetAccessories": MessageLookupByLibrary.simpleMessage(
      "4 रैक, टाइल बैग।",
    ),
    "scrabbleGameSetBoard": MessageLookupByLibrary.simpleMessage(
      "15x15 बोर्ड।",
    ),
    "scrabbleGameSetLetters": MessageLookupByLibrary.simpleMessage(
      "104 टाइलें (2 खाली सहित)।",
    ),
    "scrabbleGameSetTitle": MessageLookupByLibrary.simpleMessage(
      "खेल सामग्री:",
    ),
    "scrabblePreparationDrawTiles": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी 7 टाइलें खींचता है।",
    ),
    "scrabblePreparationFirstTurnRule": MessageLookupByLibrary.simpleMessage(
      "पहली बारी उस खिलाड़ी की है जिसकी यादृच्छिक रूप से खींची गई टाइल वर्णमाला की शुरुआत के सबसे करीब है।",
    ),
    "scrabblePreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "बैग में टाइलें शफल करें।",
    ),
    "scrabbleScoringBlueBonus": MessageLookupByLibrary.simpleMessage(
      "नीले स्थान अक्षर के स्कोर को दोगुना/तिगुना करते हैं।",
    ),
    "scrabbleScoringRedBonus": MessageLookupByLibrary.simpleMessage(
      "लाल स्थान शब्द के स्कोर को दोगुना/तिगुना करते हैं।",
    ),
    "scrabbleScoringTitle": MessageLookupByLibrary.simpleMessage("स्कोरिंग:"),
    "scrabbleScoringWordPoints": MessageLookupByLibrary.simpleMessage(
      "शब्द के अंक: टाइल अंकों का योग + बोर्ड स्थानों से बोनस।",
    ),
    "scrabbleTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "scrabble® hasbro, inc. का एक पंजीकृत ट्रेडमार्क है।",
    ),
    "scrabbleTurnRuleFirstWord": MessageLookupByLibrary.simpleMessage(
      "पहला शब्द: केंद्र वर्ग (तारा) से गुज़रना चाहिए।",
    ),
    "scrabbleTurnRuleLetterPlacement": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक नई टाइल को किसी नए या मौजूदा शब्द का हिस्सा बनना चाहिए।",
    ),
    "scrabbleTurnRuleWordDirection": MessageLookupByLibrary.simpleMessage(
      "सभी शब्द क्षैतिज या लंबवत रखे जाने चाहिए।",
    ),
    "scrabbleTurnRulesTitle": MessageLookupByLibrary.simpleMessage(
      "बारी के नियम:",
    ),
    "seaSaltPaper": MessageLookupByLibrary.simpleMessage("sea salt & paper"),
    "seaSaltPaperDuoBoat": MessageLookupByLibrary.simpleMessage(
      "बोट डुओ: तुरंत एक और बारी लें।",
    ),
    "seaSaltPaperDuoCardsDescription": MessageLookupByLibrary.simpleMessage(
      "अपनी कार्रवाई के बाद, आप विशेष प्रभावों के लिए मिलान जोड़े खेल सकते हैं:",
    ),
    "seaSaltPaperDuoCardsTitle": MessageLookupByLibrary.simpleMessage(
      "डुओ कार्ड:",
    ),
    "seaSaltPaperDuoCrab": MessageLookupByLibrary.simpleMessage(
      "क्रैब डुओ: एक डिस्कार्ड पाइल देखें और कोई भी कार्ड लें।",
    ),
    "seaSaltPaperDuoFish": MessageLookupByLibrary.simpleMessage(
      "फिश डुओ: डेक से ऊपरी कार्ड खींचें।",
    ),
    "seaSaltPaperDuoShark": MessageLookupByLibrary.simpleMessage(
      "शार्क + स्विमर डुओ: प्रतिद्वंद्वी के हाथ से एक कार्ड चुराएँ।",
    ),
    "seaSaltPaperEndRoundDescription": MessageLookupByLibrary.simpleMessage(
      "जब आपके पास 7 या अधिक अंक हों, तो आप चुनकर राउंड समाप्त कर सकते हैं:",
    ),
    "seaSaltPaperEndRoundTitle": MessageLookupByLibrary.simpleMessage(
      "राउंड समाप्त करना:",
    ),
    "seaSaltPaperGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "संयोजन बनाने के लिए कार्ड इकट्ठा करें और अंक प्राप्त करें। रणनीतिक रूप से राउंड समाप्त करके लक्ष्य स्कोर तक सबसे पहले पहुँचें।",
    ),
    "seaSaltPaperLastChanceOption": MessageLookupByLibrary.simpleMessage(
      "आखिरी मौका: प्रत्येक प्रतिद्वंद्वी को एक और बारी मिलती है। अगर अभी भी आपका स्कोर सबसे अधिक है, तो आपकी रंग बहुमत के बराबर बोनस अंक मिलते हैं। अगर कोई आपको हरा दे, तो आपको केवल अपनी रंग बहुमत मिलती है।",
    ),
    "seaSaltPaperPreparationDiscard": MessageLookupByLibrary.simpleMessage(
      "डेक के बगल में दो कार्ड सीधे रखकर दो डिस्कार्ड पाइल बनाएँ।",
    ),
    "seaSaltPaperPreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "सभी कार्डों को शफल करें और डेक को बीच में उल्टा करके रखें।",
    ),
    "seaSaltPaperPreparationStartPlayer": MessageLookupByLibrary.simpleMessage(
      "शुरुआती खिलाड़ी चुनें।",
    ),
    "seaSaltPaperScoringCollections": MessageLookupByLibrary.simpleMessage(
      "संग्रह (शंख, पेंगुइन, ऑक्टोपस) अधिक कार्डों के साथ अधिक अंक देते हैं।",
    ),
    "seaSaltPaperScoringColorMajority": MessageLookupByLibrary.simpleMessage(
      "रंग बहुमत: आपके सबसे आम रंग के प्रति कार्ड 1 बोनस अंक।",
    ),
    "seaSaltPaperScoringMermaid": MessageLookupByLibrary.simpleMessage(
      "जलपरी: सभी 4 जलपरी कार्ड इकट्ठा करने पर तुरंत खेल जीत जाते हैं!",
    ),
    "seaSaltPaperScoringPairs": MessageLookupByLibrary.simpleMessage(
      "जोड़े और संयोजन अपने प्रकार के अनुसार अंक देते हैं।",
    ),
    "seaSaltPaperScoringTitle": MessageLookupByLibrary.simpleMessage(
      "स्कोरिंग:",
    ),
    "seaSaltPaperStopOption": MessageLookupByLibrary.simpleMessage(
      "रुकें: राउंड तुरंत समाप्त होता है। सभी खिलाड़ी अपने कार्डों के अंक गिनते हैं।",
    ),
    "seaSaltPaperTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "sea salt & paper® studio bombyx का एक ट्रेडमार्क है। bruno cathala और théo rivière द्वारा डिज़ाइन किया गया।",
    ),
    "seaSaltPaperTurnDescription": MessageLookupByLibrary.simpleMessage(
      "अपनी बारी में, दो कार्रवाइयों में से एक चुनें:",
    ),
    "seaSaltPaperTurnDrawTwo": MessageLookupByLibrary.simpleMessage(
      "डेक से दो कार्ड खींचें, एक रखें, और दूसरा डिस्कार्ड पाइल पर रखें।",
    ),
    "seaSaltPaperTurnTakeDiscard": MessageLookupByLibrary.simpleMessage(
      "किसी एक डिस्कार्ड पाइल से ऊपरी कार्ड लें।",
    ),
    "seaSaltPaperVictory2Players": MessageLookupByLibrary.simpleMessage(
      "2 खिलाड़ी: 40 अंक तक पहुँचने वाला पहला जीतता है।",
    ),
    "seaSaltPaperVictory3Players": MessageLookupByLibrary.simpleMessage(
      "3 खिलाड़ी: 35 अंक तक पहुँचने वाला पहला जीतता है।",
    ),
    "seaSaltPaperVictory4Players": MessageLookupByLibrary.simpleMessage(
      "4 खिलाड़ी: 30 अंक तक पहुँचने वाला पहला जीतता है।",
    ),
    "secondBonus": MessageLookupByLibrary.simpleMessage("दूसरा बोनस"),
    "secondRace": MessageLookupByLibrary.simpleMessage("जाति 2"),
    "set": MessageLookupByLibrary.simpleMessage("set"),
    "setCardAttributeFillType": MessageLookupByLibrary.simpleMessage(
      "भरने का प्रकार: खाली, धारीदार, ठोस।",
    ),
    "setCardAttributeNumberOfSymbols": MessageLookupByLibrary.simpleMessage(
      "चिह्नों की संख्या: 1, 2, या 3।",
    ),
    "setCardAttributeSymbolColor": MessageLookupByLibrary.simpleMessage(
      "चिह्न का रंग: लाल, हरा, बैंगनी।",
    ),
    "setCardAttributeSymbolType": MessageLookupByLibrary.simpleMessage(
      "चिह्न का प्रकार: अंडाकार, हीरा, लहर।",
    ),
    "setCardAttributesDescription": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक कार्ड अद्वितीय है और इसमें 4 विशेषताएँ हैं:",
    ),
    "setCardAttributesTitle": MessageLookupByLibrary.simpleMessage(
      "कार्ड की विशेषताएँ:",
    ),
    "setExampleOfValidSetColor": MessageLookupByLibrary.simpleMessage(
      "विशेषता \'संख्या\': समान (दो)।",
    ),
    "setExampleOfValidSetFill": MessageLookupByLibrary.simpleMessage(
      "अगर कोई set नहीं मिलता:",
    ),
    "setExampleOfValidSetNumber": MessageLookupByLibrary.simpleMessage(
      "विशेषता \'प्रकार\': अलग (अंडाकार, हीरा, लहर)।",
    ),
    "setExampleOfValidSetTitle": MessageLookupByLibrary.simpleMessage(
      "विशेषता \'रंग\': अलग (लाल, हरा, बैंगनी)।",
    ),
    "setExampleOfValidSetType": MessageLookupByLibrary.simpleMessage(
      "विशेषता \'भरना\': समान (धारीदार)।",
    ),
    "setGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "एक set (3 कार्डों का समूह) खोजें जहाँ प्रत्येक विशेषता या तो सभी कार्डों में समान हो या सभी में अलग हो।",
    ),
    "setGameTurnStepContinue": MessageLookupByLibrary.simpleMessage(
      "सही set का उदाहरण:",
    ),
    "setGameTurnStepDealerSetup": MessageLookupByLibrary.simpleMessage(
      "डीलर 12 कार्ड रखता है।",
    ),
    "setGameTurnStepFindingSet": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी एक साथ set ढूंढते हैं। जो पहले ढूंढता है वह बोलता है: \'set!\'",
    ),
    "setGameTurnStepFour": MessageLookupByLibrary.simpleMessage(
      "खेल जारी रहता है।",
    ),
    "setGameTurnStepValidation": MessageLookupByLibrary.simpleMessage(
      "सही होने की जाँच करें: अगर सही है, तो खिलाड़ी कार्ड लेता है, और डीलर उन्हें 3 नए कार्डों से बदलता है। अगर गलत है, तो खिलाड़ी 1 अंक खोता है या एक बारी छोड़ता है (सहमति अनुसार)।",
    ),
    "setImportantRuleCardPosition": MessageLookupByLibrary.simpleMessage(
      "set बनाने वाले कार्डों को किसी भी क्रम में रखा जा सकता है।",
    ),
    "setImportantRuleConfirmation": MessageLookupByLibrary.simpleMessage(
      "पिछले set की पुष्टि होने तक नया set घोषित नहीं किया जा सकता।",
    ),
    "setImportantRuleSimplifiedMode": MessageLookupByLibrary.simpleMessage(
      "सीखने के लिए, केवल 3 विशेषताओं का उपयोग करके खेल को सरल बनाया जा सकता है।",
    ),
    "setImportantRulesTitle": MessageLookupByLibrary.simpleMessage(
      "महत्वपूर्ण नियम:",
    ),
    "setNoSetFoundDescription": MessageLookupByLibrary.simpleMessage(
      "अगर 12 कार्डों में कोई set नहीं है, तो डीलर 3 कार्ड जोड़ता है (अधिकतम 21 कार्ड तक)। 21 कार्डों में हमेशा एक set होता है।",
    ),
    "setNoSetFoundTitle": MessageLookupByLibrary.simpleMessage(
      "अगर कोई set नहीं मिलता:",
    ),
    "setScoringGameEnd": MessageLookupByLibrary.simpleMessage(
      "खेल तब समाप्त होता है जब डेक खत्म हो जाता है या पूर्व निर्धारित अंक पूरे हो जाते हैं।",
    ),
    "setScoringPointPerSet": MessageLookupByLibrary.simpleMessage(
      "प्रति set 1 अंक।",
    ),
    "setScoringTitle": MessageLookupByLibrary.simpleMessage("स्कोरिंग:"),
    "setTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "set® set enterprises, inc. का एक पंजीकृत ट्रेडमार्क है।",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("सेटिंग्स"),
    "settlement": MessageLookupByLibrary.simpleMessage("बस्ती"),
    "shareFeedback": MessageLookupByLibrary.simpleMessage(
      "प्रतिक्रिया साझा करें",
    ),
    "shareWithFriedns": MessageLookupByLibrary.simpleMessage(
      "दोस्तों के साथ शेयर करें",
    ),
    "shareWithFriends": MessageLookupByLibrary.simpleMessage(
      "दोस्तों के साथ शेयर करें",
    ),
    "sinceThisIsAnOpenSourceProjectYouCanLeave":
        MessageLookupByLibrary.simpleMessage(
          "चूंकि यह एक ओपन-सोर्स प्रोजेक्ट है, इसमें योगदान करने के लिए स्वतंत्र महसूस करें",
        ),
    "singleplayer": MessageLookupByLibrary.simpleMessage("सिंगलप्लेयर"),
    "skip": MessageLookupByLibrary.simpleMessage("स्किप"),
    "skipCardUnoInfo": MessageLookupByLibrary.simpleMessage("स्किप कार्ड"),
    "skipEveryoneCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "स्किप एवरीवन कार्ड",
    ),
    "skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "सभी खिलाड़ियों को छोड़ता है और बारी मूल खिलाड़ी को वापस देता है।",
        ),
    "skipsTheNextPlayersTurnUnoInfo": MessageLookupByLibrary.simpleMessage(
      "अगले खिलाड़ी की बारी छोड़ देता है।",
    ),
    "spanish": MessageLookupByLibrary.simpleMessage("स्पेनिश"),
    "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
      "विशेष कार्ड (प्रत्येक 2):",
    ),
    "specialCardsTitle": MessageLookupByLibrary.simpleMessage("विशेष कार्ड:"),
    "specialRulesTitle": MessageLookupByLibrary.simpleMessage("विशेष नियम:"),
    "subtracting": MessageLookupByLibrary.simpleMessage("घटाना"),
    "superMunch": MessageLookupByLibrary.simpleMessage("सुपर munch."),
    "swapHandsWithAnyPlayerAndChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "किसी भी खिलाड़ी के साथ हाथ बदलें और रंग चुनें।",
        ),
    "sword": MessageLookupByLibrary.simpleMessage("तलवार"),
    "telegram": MessageLookupByLibrary.simpleMessage("telegram"),
    "ten10Points": MessageLookupByLibrary.simpleMessage("दस: 10 अंक"),
    "theNumberOfPlayersShouldBe": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ियों की संख्या होनी चाहिए",
    ),
    "theRobberRolling7": MessageLookupByLibrary.simpleMessage(
      "लुटेरा (7 आने पर):",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("थीम"),
    "thief": MessageLookupByLibrary.simpleMessage("चोर"),
    "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
      "डीलर के बाद के खिलाड़ी से शुरू करते हुए, खिलाड़ी बोली लगाते हैं कि वे कितने अंक प्राप्त कर सकते हैं (न्यूनतम बोली 100 है)। प्रत्येक बोली पिछली बोली से अधिक होनी चाहिए (5 या 10 के अंतर में)।",
    ),
    "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
      "सबसे ऊँची बोली लगाने वाला खिलाड़ी नीलामी जीतता है, तालोन लेता है, और ट्रम्प सूट घोषित करता है। बोली लगाने वाला 3 कार्ड उल्टे रखता है (लेकिन उनका अंक मूल्य रखता है)।",
    ),
    "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
      "अगर खिलाड़ी ऊँची बोली नहीं लगाना चाहते तो पास कर सकते हैं।",
    ),
    "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
      "अगर बोली लगाने वाला कम से कम अपनी बोली जितना स्कोर करता है: वे अपना वास्तविक स्कोर अपने कुल में जोड़ते हैं।",
    ),
    "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
      "अन्य खिलाड़ी अपनी जीती हुई ट्रिक के अंक अपने कुल में जोड़ते हैं।",
    ),
    "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
      "अगर बोली लगाने वाला अपनी बोली पूरी करने में विफल रहता है: उनकी बोली राशि उनके कुल से घटाई जाती है (वे माइनस में जा सकते हैं)।",
    ),
    "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
      "बोली लगाने वाला कोई भी कार्ड खेलकर पहली ट्रिक शुरू करता है। अन्य खिलाड़ियों को सूट फॉलो करना होगा अगर संभव हो। अगर नहीं कर सकते, तो ट्रम्प कार्ड खेलना होगा अगर उनके पास है।",
    ),
    "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
      "ट्रिक का विजेता अगली ट्रिक शुरू करता है। सभी कार्ड खेले जाने तक जारी रखें।",
    ),
    "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
      "खेले गए सूट का सबसे ऊँचा कार्ड जीतता है, जब तक कि ट्रम्प न खेला जाए। सबसे ऊँचा ट्रम्प जीतता है।",
    ),
    "thousandGoal": MessageLookupByLibrary.simpleMessage(
      "लक्ष्य है बोली खेल में ट्रिक जीतकर 1000 अंक तक सबसे पहले पहुँचना। खिलाड़ी बोली लगाते हैं कि वे कितने अंक प्राप्त कर सकते हैं, फिर अपना अनुबंध पूरा करने का प्रयास करते हैं।",
    ),
    "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
      "शादी के अंक तभी मिलते हैं जब आप कम से कम एक ट्रिक जीतें।",
    ),
    "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
      "शादी आपके हाथ में एक ही सूट के राजा और रानी है।",
    ),
    "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
      "गैर-ट्रम्प शादी: 80 अंक (वही नियम लागू)।",
    ),
    "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
      "ट्रम्प शादी: 100 अंक (जोड़े का पहला कार्ड खेलते समय घोषित करना होगा)।",
    ),
    "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
      "24 कार्ड का डेक उपयोग करें: चारों सूट के 9, 10, गुलाम, रानी, राजा, इक्का।",
    ),
    "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
      "बीच में 3 कार्ड उल्टे करके तालोन (विधवा) के रूप में रखें।",
    ),
    "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी को 7 कार्ड बाँटें (3 खिलाड़ियों के लिए), या 8 कार्ड (2 खिलाड़ियों के लिए)।",
    ),
    "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
      "बैरल नियम: अगर कोई खिलाड़ी 880+ अंक तक पहुँचता है, तो वे \"बैरल पर\" हैं और ठीक 1000 तक स्कोर करना होगा, अन्यथा 880 पर वापस आ जाएँगे।",
    ),
    "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
      "कुछ संस्करणों में जीतने के लिए ठीक 1000 अंक चाहिए। अधिक होने पर 880 या पिछले स्कोर पर रीसेट हो जाता है।",
    ),
    "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
      "डेक में कुल अंक: 120। लागू होने पर शादी बोनस जोड़ें।",
    ),
    "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
      "1000 अंक (या ठीक 1000, घर के नियमों के अनुसार) तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "toAllWhoCreatedThe": MessageLookupByLibrary.simpleMessage(
      "उन सभी को धन्यवाद जिन्होंने बनाया",
    ),
    "toBoardBuddysContributors": MessageLookupByLibrary.simpleMessage(
      "board buddy के योगदानकर्ता",
    ),
    "total": MessageLookupByLibrary.simpleMessage("कुल"),
    "totalStrength": MessageLookupByLibrary.simpleMessage("कुल ताकत: "),
    "trading": MessageLookupByLibrary.simpleMessage("व्यापार:"),
    "tripleTheValueOfALetterScrabbleInfo": MessageLookupByLibrary.simpleMessage(
      "एक अक्षर का मूल्य तिगुना करता है",
    ),
    "tripleTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage(
          "पूरे शब्द का मूल्य तिगुना करता है",
        ),
    "twoHanded": MessageLookupByLibrary.simpleMessage("दो-हाथ वाला"),
    "uno": MessageLookupByLibrary.simpleMessage("uno"),
    "unoActiveCardDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'ड्रॉ टू\': अगला खिलाड़ी 2 कार्ड खींचता है और अपनी बारी खो देता है।",
    ),
    "unoActiveCardReverse": MessageLookupByLibrary.simpleMessage(
      "\'रिवर्स\': खेल की दिशा बदल जाती है।",
    ),
    "unoActiveCardSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'स्किप\': अगले खिलाड़ी की बारी खो जाती है।",
    ),
    "unoActiveCardWild": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड\': आपको खेल का रंग चुनने की अनुमति देता है।",
    ),
    "unoActiveCardWildDrawFour": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड ड्रॉ फोर\': रंग चुनें, और अगला खिलाड़ी 4 कार्ड खींचता है। आप इसे तभी खेल सकते हैं जब आपके पास कोई मिलान कार्ड न हो।",
    ),
    "unoActiveCardsTitle": MessageLookupByLibrary.simpleMessage("एक्शन कार्ड:"),
    "unoFlip": MessageLookupByLibrary.simpleMessage("uno flip"),
    "unoFlipDarkSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "डार्क साइड:",
    ),
    "unoFlipDarkSideDrawFive": MessageLookupByLibrary.simpleMessage(
      "\'ड्रॉ फाइव\'",
    ),
    "unoFlipDarkSideDrawUntilColor": MessageLookupByLibrary.simpleMessage(
      "\'मिलान रंग मिलने तक खींचें\'",
    ),
    "unoFlipDarkSideReverse": MessageLookupByLibrary.simpleMessage(
      "\'रिवर्स\'",
    ),
    "unoFlipDarkSideSkipAll": MessageLookupByLibrary.simpleMessage(
      "\'स्किप ऑल\'",
    ),
    "unoFlipDarkSideWildCard": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड\'",
    ),
    "unoFlipGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "अपने सभी कार्ड खेलें और प्रतिद्वंद्वियों के बचे कार्डों से अंक प्राप्त करें। 500 अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "unoFlipGameStartDealCards": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी को 7 कार्ड मिलते हैं।",
    ),
    "unoFlipGameStartLightSide": MessageLookupByLibrary.simpleMessage(
      "डेक के लाइट साइड से खेल शुरू करें।",
    ),
    "unoFlipGameStartTitle": MessageLookupByLibrary.simpleMessage(
      "खेल की शुरुआत:",
    ),
    "unoFlipKeyMoment": MessageLookupByLibrary.simpleMessage("मुख्य पल:"),
    "unoFlipKeyMomentFlipCardEffect": MessageLookupByLibrary.simpleMessage(
      "\'फ्लिप\' कार्ड के बाद, पूरा खेल दूसरी तरफ बदल जाता है।",
    ),
    "unoFlipKeyMomentUnoCall": MessageLookupByLibrary.simpleMessage(
      "अपना दूसरा-से-आखिरी कार्ड खेलते समय, \'uno!\' बोलें। अगर भूल गए और पकड़े गए, तो 2 कार्ड खींचें।",
    ),
    "unoFlipLightSideCardsTitle": MessageLookupByLibrary.simpleMessage(
      "लाइट साइड:",
    ),
    "unoFlipLightSideDrawOne": MessageLookupByLibrary.simpleMessage(
      "\'ड्रॉ वन\'",
    ),
    "unoFlipLightSideReverse": MessageLookupByLibrary.simpleMessage(
      "\'रिवर्स\'",
    ),
    "unoFlipLightSideSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'स्किप टर्न\'",
    ),
    "unoFlipLightSideWildCard": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड\'",
    ),
    "unoFlipLightSideWildDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड ड्रॉ टू\'",
    ),
    "unoFlipScoringActiveCards": MessageLookupByLibrary.simpleMessage(
      "एक्शन कार्ड: प्रकार के अनुसार 20-60 अंक।",
    ),
    "unoFlipScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "नंबर कार्ड: अंकित मूल्य।",
    ),
    "unoFlipScoringRoundWinnerPoints": MessageLookupByLibrary.simpleMessage(
      "राउंड का विजेता प्रतिद्वंद्वियों के बचे कार्डों के अंक प्राप्त करता है:",
    ),
    "unoFlipScoringTitle": MessageLookupByLibrary.simpleMessage("स्कोरिंग:"),
    "unoFlipTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno flip® mattel का एक पंजीकृत ट्रेडमार्क है।",
    ),
    "unoFlipTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "अगर कोई मिलान कार्ड उपलब्ध नहीं है, तो पाइल से खींचें।",
    ),
    "unoFlipTurnRuleFlipCard": MessageLookupByLibrary.simpleMessage(
      "\'फ्लिप\' कार्ड खेल को डेक के दूसरी तरफ बदल देता है।",
    ),
    "unoFlipTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "रंग, संख्या या चिह्न से ऊपरी कार्ड से मेल खाने वाला कार्ड खेलें।",
    ),
    "unoFlipVictory500Points": MessageLookupByLibrary.simpleMessage(
      "500 अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "unoFlipVictoryLowestScoreAlternative":
        MessageLookupByLibrary.simpleMessage(
          "विकल्प: खेल समाप्त होने के बाद सबसे कम स्कोर वाला खिलाड़ी जीतता है।",
        ),
    "unoGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "सबसे पहले अपने सभी कार्ड खेलें और प्रतिद्वंद्वियों के बचे कार्डों से अंक प्राप्त करें। 500 अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "unoGameTurnTitle": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी बारी-बारी से एक कार्ड खेलते हैं जो रंग, संख्या या चिह्न से ऊपरी कार्ड से मेल खाता हो।",
    ),
    "unoPreparationDeckInCenter": MessageLookupByLibrary.simpleMessage(
      "बचे हुए डेक को बीच में ड्रॉ पाइल के रूप में रखें।",
    ),
    "unoPreparationDistributeCards": MessageLookupByLibrary.simpleMessage(
      "प्रत्येक खिलाड़ी को 7 कार्ड बाँटें।",
    ),
    "unoPreparationFlipFirstCard": MessageLookupByLibrary.simpleMessage(
      "डिस्कार्ड पाइल शुरू करने के लिए सबसे ऊपर का कार्ड पलटें।",
    ),
    "unoScoring20PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'स्किप\', \'ड्रॉ टू\', \'रिवर्स\': 20 अंक।",
    ),
    "unoScoring40PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'हाथ बदलें\', \'खाली कार्ड\': 40 अंक।",
    ),
    "unoScoring50PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'वाइल्ड\', \'वाइल्ड ड्रॉ फोर\': 50 अंक।",
    ),
    "unoScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "नंबर कार्ड: अंकित मूल्य।",
    ),
    "unoScoringTitle": MessageLookupByLibrary.simpleMessage("स्कोरिंग:"),
    "unoSpecialCardBlank": MessageLookupByLibrary.simpleMessage(
      "\'खाली कार्ड\': खेल शुरू करने से पहले एक नियम बनाएँ।",
    ),
    "unoSpecialCardSwap": MessageLookupByLibrary.simpleMessage(
      "\'हाथ बदलें\': किसी भी खिलाड़ी के साथ हाथ बदलें और रंग चुनें।",
    ),
    "unoSpecialRuleReshuffle": MessageLookupByLibrary.simpleMessage(
      "अगर ड्रॉ पाइल खाली है, तो डिस्कार्ड पाइल को फिर से शफल करें।",
    ),
    "unoSpecialRuleUnoCall": MessageLookupByLibrary.simpleMessage(
      "\'uno\' कहना भूल गए? अगर अगले खिलाड़ी की बारी से पहले पकड़े गए तो 2 कार्ड खींचें।",
    ),
    "unoTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno® mattel का एक पंजीकृत ट्रेडमार्क है।",
    ),
    "unoTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "अगर आप नहीं खेल सकते, तो एक कार्ड खींचें। अगर वह खेलने योग्य है, तो आप उसे तुरंत खेल सकते हैं।",
    ),
    "unoTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी बारी-बारी से एक कार्ड खेलते हैं जो रंग, संख्या या चिह्न से ऊपरी कार्ड से मेल खाता हो।",
    ),
    "unoTurnRuleOptionalDraw": MessageLookupByLibrary.simpleMessage(
      "खिलाड़ी एक कार्ड खींच सकते हैं भले ही उनके पास खेलने योग्य कार्ड हो, लेकिन वे उसी बारी में उसे नहीं खेल सकते।",
    ),
    "unoVictory500Points": MessageLookupByLibrary.simpleMessage(
      "500 अंक तक पहुँचने वाला पहला खिलाड़ी जीतता है।",
    ),
    "unoVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "विकल्प: खेल समाप्त होने के बाद सबसे कम स्कोर वाला खिलाड़ी जीतता है।",
    ),
    "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
      "बस्ती को शहर में अपग्रेड करें (+1 अंक)",
    ),
    "victoryPointCard": MessageLookupByLibrary.simpleMessage("विजय अंक कार्ड"),
    "victoryTitle": MessageLookupByLibrary.simpleMessage("जीत:"),
    "warrior": MessageLookupByLibrary.simpleMessage("योद्धा"),
    "whoGoesFirst": MessageLookupByLibrary.simpleMessage("पहले कौन बाँटता है?"),
    "wildCardOneDosInfo": MessageLookupByLibrary.simpleMessage(
      "वाइल्ड # कार्ड",
    ),
    "wildCardUnoInfo": MessageLookupByLibrary.simpleMessage("वाइल्ड कार्ड"),
    "wildDrawColorUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "वाइल्ड ड्रॉ कलर",
    ),
    "wildDrawFourCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "वाइल्ड ड्रॉ फोर कार्ड",
    ),
    "wildDrawTwoCardDosInfo": MessageLookupByLibrary.simpleMessage(
      "वाइल्ड ड्रॉ टू कार्ड",
    ),
    "wildShuffleHandsCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "वाइल्ड शफल हैंड्स कार्ड",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("विजेता: "),
    "wizard": MessageLookupByLibrary.simpleMessage("जादूगर"),
    "wordIsTooLongMaximum15LettersAllowed":
        MessageLookupByLibrary.simpleMessage(
          "शब्द बहुत लंबा है। अधिकतम 15 अक्षरों की अनुमति है",
        ),
    "wordModifier": MessageLookupByLibrary.simpleMessage("शब्द मॉडिफायर: "),
    "x2Word": MessageLookupByLibrary.simpleMessage("x2 शब्द"),
    "x3Word": MessageLookupByLibrary.simpleMessage("x3 शब्द"),
    "yes": MessageLookupByLibrary.simpleMessage("हाँ"),
    "youHaveAnUnfinishedGame": MessageLookupByLibrary.simpleMessage(
      "आपका एक अधूरा खेल है",
    ),
    "yourBet": MessageLookupByLibrary.simpleMessage("आपकी बोली"),
  };
}
