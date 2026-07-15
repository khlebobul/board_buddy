// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(playerName, winningBid) =>
      "${playerName}이(가) 입찰(${winningBid}점)에 도달했습니까?";

  static String m1(count) => "${Intl.plural(count, one: '점', other: '점')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("소개"),
    "ace": MessageLookupByLibrary.simpleMessage("에이스"),
    "ace11Points": MessageLookupByLibrary.simpleMessage("에이스: 11점"),
    "add": MessageLookupByLibrary.simpleMessage("추가"),
    "addPlayer": MessageLookupByLibrary.simpleMessage("플레이어 추가"),
    "adding": MessageLookupByLibrary.simpleMessage("더하기"),
    "allowsThePlayerToChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage("플레이어가 색상을 선택할 수 있습니다."),
    "appreciation": MessageLookupByLibrary.simpleMessage("크레딧"),
    "armour": MessageLookupByLibrary.simpleMessage("갑옷"),
    "awardedToThePlayerWith3KnightCardsPlayed":
        MessageLookupByLibrary.simpleMessage("기사 카드 3장 이상을 사용한 플레이어에게 수여"),
    "awardedToThePlayerWith5ConnectedRoads":
        MessageLookupByLibrary.simpleMessage("연속 도로 5개 이상을 가진 플레이어에게 수여"),
    "back": MessageLookupByLibrary.simpleMessage("뒤로"),
    "biddingPhase": MessageLookupByLibrary.simpleMessage("입찰 단계:"),
    "bigArmour": MessageLookupByLibrary.simpleMessage("대형 갑옷"),
    "bigBoots": MessageLookupByLibrary.simpleMessage("대형 부츠"),
    "bigHelmet": MessageLookupByLibrary.simpleMessage("대형 투구"),
    "bigMagic": MessageLookupByLibrary.simpleMessage("강력한 마법"),
    "bigSword": MessageLookupByLibrary.simpleMessage("대검"),
    "bingo": MessageLookupByLibrary.simpleMessage("빙고"),
    "blankTile": MessageLookupByLibrary.simpleMessage("빈\n타일"),
    "boardBuddy": MessageLookupByLibrary.simpleMessage("보드 버디"),
    "boardBuddyIsYourUltimateBoardGameCompanion":
        MessageLookupByLibrary.simpleMessage("보드 버디는 최고의 보드게임 동반자입니다"),
    "bonusTileOrSpecialMarkerScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("보너스 타일 또는 특수 마커"),
    "boots": MessageLookupByLibrary.simpleMessage("부츠"),
    "buffsOrDebuffsAffectingCharactersitemsInfo":
        MessageLookupByLibrary.simpleMessage("캐릭터/아이템에 영향을 미치는 버프 또는 디버프"),
    "buildANewSettlementOnAnIntersection": MessageLookupByLibrary.simpleMessage(
      "교차점에 새 정착지를 건설합니다",
    ),
    "buildingCosts": MessageLookupByLibrary.simpleMessage("건설 비용:"),
    "buildingRules": MessageLookupByLibrary.simpleMessage("건설 규칙:"),
    "canBeAnyColorChosenByTheCurrentPlayerIfDosInfo":
        MessageLookupByLibrary.simpleMessage(
          "현재 플레이어가 선택한 아무 색상이 될 수 있습니다. 뽑았을 경우 플레이어가 색상을 결정합니다.",
        ),
    "canRepresentAnyNumberForItsOwnParticularColorDosInfo":
        MessageLookupByLibrary.simpleMessage("해당 색상의 아무 숫자를 대체할 수 있습니다."),
    "cancel": MessageLookupByLibrary.simpleMessage("취소"),
    "card": MessageLookupByLibrary.simpleMessage("카드"),
    "cardTypesTitle": MessageLookupByLibrary.simpleMessage("카드 종류:"),
    "cards": MessageLookupByLibrary.simpleMessage("카드"),
    "catan": MessageLookupByLibrary.simpleMessage("카탄"),
    "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
      "개발 카드: 양모 1 + 곡물 1 + 광석 1",
    ),
    "catanBuildingCostsOne": MessageLookupByLibrary.simpleMessage(
      "도로: 목재 1 + 벽돌 1",
    ),
    "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
      "도시 (업그레이드): 곡물 2 + 광석 3 (2점)",
    ),
    "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
      "정착지: 목재 1 + 벽돌 1 + 양모 1 + 곡물 1 (1점)",
    ),
    "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
      "도시는 기존 정착지를 대체합니다",
    ),
    "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
      "도로는 기존 도로, 정착지 또는 도시에 연결되어야 합니다",
    ),
    "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
      "정착지는 자신의 도로 네트워크에 연결되어야 합니다",
    ),
    "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
      "정착지는 다른 정착지/도시로부터 최소 2칸 떨어져야 합니다",
    ),
    "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
      "2장 특수 카드: 최장 도로, 최대 군대",
    ),
    "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
      "95장 자원 카드 (각 19장: 목재, 벽돌, 양모, 곡물, 광석)",
    ),
    "catanComponentsFour": MessageLookupByLibrary.simpleMessage("18개 숫자 토큰"),
    "catanComponentsNine": MessageLookupByLibrary.simpleMessage(
      "도적 1개, 주사위 2개",
    ),
    "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
      "19개 지형 헥스 (숲 4, 곡물 4, 목초지 4, 산 3, 언덕 3, 사막 1)",
    ),
    "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
      "플레이어 말: 플레이어당 정착지 5개, 도시 4개, 도로 15개",
    ),
    "catanComponentsSix": MessageLookupByLibrary.simpleMessage("25장 개발 카드"),
    "catanComponentsThree": MessageLookupByLibrary.simpleMessage("9개 항구 조각"),
    "catanComponentsTwo": MessageLookupByLibrary.simpleMessage("6개 바다 프레임 조각"),
    "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
      "독점 (2): 자원을 지정하면 모든 플레이어가 해당 자원을 줍니다",
    ),
    "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
      "기사 (14): 도적을 이동하고 인접 플레이어에게서 자원 1개를 가져옵니다",
    ),
    "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
      "도로 건설 (2): 무료로 도로 2개를 건설합니다",
    ),
    "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
      "승리 점수 (5): 1점, 승리할 때까지 비공개",
    ),
    "catanGameGoal": MessageLookupByLibrary.simpleMessage(
      "정착지, 도시, 도로를 건설하고 특수 카드를 획득하여 가장 먼저 10 승리 점수에 도달하세요.",
    ),
    "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
      "주사위 굴리기: 해당 숫자의 헥스에 정착지/도시가 있는 모든 플레이어가 자원을 받습니다",
    ),
    "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
      "건설: 자원을 사용하여 도로, 정착지, 도시를 건설하거나 개발 카드를 구매합니다",
    ),
    "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
      "거래: 다른 플레이어와 자원을 교환하거나 항구를 이용합니다 (4:1 또는 특수 비율)",
    ),
    "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
      "각 플레이어가 역순으로 정착지 2개와 도로 2개를 배치합니다",
    ),
    "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
      "바다 프레임 안에 지형 헥스로 보드를 조립합니다",
    ),
    "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
      "사막 헥스에 도적을 놓습니다",
    ),
    "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "헥스 위에 숫자 토큰을 놓습니다 (사막 제외)",
    ),
    "catanResourcesFive": MessageLookupByLibrary.simpleMessage("산 – 광석"),
    "catanResourcesFour": MessageLookupByLibrary.simpleMessage("밭 – 곡물 (밀)"),
    "catanResourcesOne": MessageLookupByLibrary.simpleMessage("숲 – 목재 (나무)"),
    "catanResourcesSix": MessageLookupByLibrary.simpleMessage("사막 – 자원 없음"),
    "catanResourcesThree": MessageLookupByLibrary.simpleMessage("목초지 – 양모 (양)"),
    "catanResourcesTwo": MessageLookupByLibrary.simpleMessage("언덕 – 벽돌 (점토)"),
    "catanScoringFive": MessageLookupByLibrary.simpleMessage("승리 점수 카드: 각 1점"),
    "catanScoringFour": MessageLookupByLibrary.simpleMessage("최대 군대: 2점"),
    "catanScoringOne": MessageLookupByLibrary.simpleMessage("정착지: 1점"),
    "catanScoringThree": MessageLookupByLibrary.simpleMessage("최장 도로: 2점"),
    "catanScoringTwo": MessageLookupByLibrary.simpleMessage("도시: 2점"),
    "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
      "최장 도로: 연속 도로 5개 이상을 가진 첫 번째 플레이어 (빼앗길 수 있음)",
    ),
    "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
      "최대 군대: 기사 카드 3장 이상을 사용한 첫 번째 플레이어 (빼앗길 수 있음)",
    ),
    "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
      "도적이 있는 헥스는 자원을 생산하지 않습니다",
    ),
    "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
      "7장 초과 카드를 가진 플레이어는 반(내림)을 버려야 합니다",
    ),
    "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
      "해당 헥스에 정착지/도시가 있는 플레이어에게서 랜덤으로 자원 1개를 가져옵니다",
    ),
    "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
      "도적을 아무 헥스로 이동합니다 (사막 제외)",
    ),
    "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "catan®은 catan gmbh의 상표입니다.",
    ),
    "catanTradingOne": MessageLookupByLibrary.simpleMessage(
      "국내 거래: 자신의 턴에 다른 플레이어와 자유롭게 교환 협상",
    ),
    "catanTradingThree": MessageLookupByLibrary.simpleMessage(
      "항구 거래: 일반 3:1 또는 특정 자원 2:1 항구",
    ),
    "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
      "해상 거래: 은행과 4:1 (같은 자원 4개로 원하는 자원 1개)",
    ),
    "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
      "자신의 턴에 가장 먼저 10 승리 점수에 도달한 플레이어가 승리합니다. 자신의 턴에 승리를 선언해야 합니다.",
    ),
    "changesTheColorAndForcesTheNextPlayerToDrawUnoInfo":
        MessageLookupByLibrary.simpleMessage("색상을 바꾸고 다음 플레이어가 4장을 뽑게 합니다."),
    "changesTheDirectionOfPlayUnoInfo": MessageLookupByLibrary.simpleMessage(
      "진행 방향을 바꿉니다.",
    ),
    "charactersGenderFemaleInfo": MessageLookupByLibrary.simpleMessage(
      "캐릭터 성별: 여성",
    ),
    "charactersGenderMaleInfo": MessageLookupByLibrary.simpleMessage(
      "캐릭터 성별: 남성",
    ),
    "checkMyWebsite": MessageLookupByLibrary.simpleMessage("웹사이트 방문하기"),
    "city": MessageLookupByLibrary.simpleMessage("도시"),
    "class1": MessageLookupByLibrary.simpleMessage("직업 1"),
    "class2": MessageLookupByLibrary.simpleMessage("직업 2"),
    "clear": MessageLookupByLibrary.simpleMessage("지우기"),
    "clearance": MessageLookupByLibrary.simpleMessage("해제"),
    "cleric": MessageLookupByLibrary.simpleMessage("성직자"),
    "close": MessageLookupByLibrary.simpleMessage("닫기"),
    "collection": MessageLookupByLibrary.simpleMessage("컬렉션"),
    "collectsFourMermaids": MessageLookupByLibrary.simpleMessage(
      "인어 4장을 모아 승리!",
    ),
    "colorMajority": MessageLookupByLibrary.simpleMessage("색상 다수"),
    "common": MessageLookupByLibrary.simpleMessage("카운터"),
    "confirm": MessageLookupByLibrary.simpleMessage("확인"),
    "continueGame": MessageLookupByLibrary.simpleMessage("게임 계속하기"),
    "continueTitle": MessageLookupByLibrary.simpleMessage("계속"),
    "contractResolution": MessageLookupByLibrary.simpleMessage("계약 결과:"),
    "couldNotLaunch": MessageLookupByLibrary.simpleMessage("실행할 수 없습니다"),
    "currentBet": MessageLookupByLibrary.simpleMessage("현재 입찰:"),
    "currentCount": MessageLookupByLibrary.simpleMessage("현재 카운트:"),
    "cursed": MessageLookupByLibrary.simpleMessage("저주받음"),
    "custom": MessageLookupByLibrary.simpleMessage("(사용자 지정)"),
    "dark": MessageLookupByLibrary.simpleMessage("다크"),
    "darkSideCardsAreReplacedWithLightOnesAndVice":
        MessageLookupByLibrary.simpleMessage(
          "어두운 면 카드가 밝은 면 카드로 교체되며 그 반대도 마찬가지입니다.",
        ),
    "developmentCardWorth1VictoryPoint": MessageLookupByLibrary.simpleMessage(
      "1 승리 점수의 개발 카드",
    ),
    "developmentCards": MessageLookupByLibrary.simpleMessage("개발 카드:"),
    "didPlayerReachBid": m0,
    "didYouEnter": MessageLookupByLibrary.simpleMessage("도달했습니까"),
    "doReturn": MessageLookupByLibrary.simpleMessage("돌아가기"),
    "dos": MessageLookupByLibrary.simpleMessage("dos"),
    "dosBonus": MessageLookupByLibrary.simpleMessage("보너스:"),
    "dosBonusDoubleColorMatchDrawCard": MessageLookupByLibrary.simpleMessage(
      "더블 색상 매치: 다른 모든 플레이어가 1장을 뽑습니다.",
    ),
    "dosBonusNumberColorMatchAddCard": MessageLookupByLibrary.simpleMessage(
      "보너스:",
    ),
    "dosGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "모든 카드를 내고 상대의 남은 카드에서 점수를 얻으세요. 먼저 200점에 도달한 플레이어가 승리합니다.",
    ),
    "dosGameObjectiveTitle": MessageLookupByLibrary.simpleMessage("목표:"),
    "dosPreparationCentralRow": MessageLookupByLibrary.simpleMessage(
      "\'중앙 줄\'에 2장의 카드를 놓습니다",
    ),
    "dosPreparationDealCards": MessageLookupByLibrary.simpleMessage(
      "각 플레이어에게 7장씩 나눠줍니다.",
    ),
    "dosPreparationDrawPile": MessageLookupByLibrary.simpleMessage(
      "나머지 덱을 옆에 뽑는 더미로 놓습니다.",
    ),
    "dosScoring": MessageLookupByLibrary.simpleMessage("점수:"),
    "dosScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "숫자 카드: 표시된 숫자.",
    ),
    "dosScoringWildDos": MessageLookupByLibrary.simpleMessage(
      "\'와일드 도스\': 20점.",
    ),
    "dosScoringWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'와일드 #\': 40점.",
    ),
    "dosSpecialCardWildDos": MessageLookupByLibrary.simpleMessage(
      "\'와일드 도스\': 어떤 색상의 두 카드를 대체합니다.",
    ),
    "dosSpecialCardWildNumber": MessageLookupByLibrary.simpleMessage(
      "\'와일드 #\': 해당 색상의 아무 숫자(1~10)를 대체합니다.",
    ),
    "dosSpecialRule": MessageLookupByLibrary.simpleMessage("특별 규칙:"),
    "dosSpecialRuleDosCall": MessageLookupByLibrary.simpleMessage(
      "카드가 2장 남으면 \'도스!\'를 외치세요. 잊고 들키면 2장을 뽑습니다.",
    ),
    "dosTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "dos®는 mattel의 등록 상표입니다.",
    ),
    "dosTurnRuleDoubleMatch": MessageLookupByLibrary.simpleMessage(
      "더블 매치: 두 카드의 합이 중앙 줄 카드의 숫자와 같음.",
    ),
    "dosTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "매치가 불가능하면 카드를 한 장 뽑습니다. 맞으면 바로 낼 수 있습니다.",
    ),
    "dosTurnRuleEndTurn": MessageLookupByLibrary.simpleMessage(
      "턴 종료 시 중앙 줄을 2장으로 보충합니다.",
    ),
    "dosTurnRulePickCards": MessageLookupByLibrary.simpleMessage(
      "플레이어는 차례로 손패의 카드를 중앙 줄의 카드와 맞춥니다:",
    ),
    "dosTurnRuleSingleMatch": MessageLookupByLibrary.simpleMessage(
      "단일 매치: 숫자가 일치하는 카드.",
    ),
    "dosVictory200Points": MessageLookupByLibrary.simpleMessage(
      "먼저 200점에 도달한 플레이어가 승리합니다.",
    ),
    "doublesTheValueOfALetterScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("글자의 점수를 2배로 합니다"),
    "doublesTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("단어 전체의 점수를 2배로 합니다"),
    "drawFiveUnoFlipInfo": MessageLookupByLibrary.simpleMessage("5장 뽑기"),
    "drawOneUnoFlipInfo": MessageLookupByLibrary.simpleMessage("1장 뽑기"),
    "drawTwoCardUnoInfo": MessageLookupByLibrary.simpleMessage("2장 뽑기 카드"),
    "dwarf": MessageLookupByLibrary.simpleMessage("드워프"),
    "eachCardHasANumberDeterminingItsValue":
        MessageLookupByLibrary.simpleMessage("각 카드에는 값을 결정하는 숫자가 있습니다."),
    "eachCardHasANumberFrom0To9WhichUnoInfo":
        MessageLookupByLibrary.simpleMessage(
          "각 카드에는 0부터 9까지의 숫자가 있으며 이것이 카드의 값입니다.",
        ),
    "eachCardHasANumberFrom1To9Which": MessageLookupByLibrary.simpleMessage(
      "각 카드에는 1부터 9까지의 숫자가 있으며 이것이 카드의 값입니다.",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("편집"),
    "elf": MessageLookupByLibrary.simpleMessage("엘프"),
    "emailCopied": MessageLookupByLibrary.simpleMessage("이메일이 복사되었습니다"),
    "endGameTitle": MessageLookupByLibrary.simpleMessage("게임 종료:"),
    "english": MessageLookupByLibrary.simpleMessage("영어"),
    "enterAWord": MessageLookupByLibrary.simpleMessage("단어를 입력하세요"),
    "enterNumberOfCards": MessageLookupByLibrary.simpleMessage(
      "가장 많은 색상의 카드 수를 입력하세요",
    ),
    "featureRequest": MessageLookupByLibrary.simpleMessage("기능 요청"),
    "finish": MessageLookupByLibrary.simpleMessage("완료"),
    "firstBonus": MessageLookupByLibrary.simpleMessage("첫 번째 보너스"),
    "flipCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage("뒤집기 카드"),
    "flipSide": MessageLookupByLibrary.simpleMessage("뒤집기"),
    "flipsAllCardsToTheOppositeSideUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage("모든 카드를 반대편으로 뒤집습니다."),
    "followMeOnXTwitter": MessageLookupByLibrary.simpleMessage(
      "x (twitter)에서 팔로우하기",
    ),
    "french": MessageLookupByLibrary.simpleMessage("프랑스어"),
    "gameGoal": MessageLookupByLibrary.simpleMessage("게임 목표:"),
    "gameOver": MessageLookupByLibrary.simpleMessage("게임 오버"),
    "gameTurnTitle": MessageLookupByLibrary.simpleMessage("게임 턴:"),
    "gameUpTo": MessageLookupByLibrary.simpleMessage("목표 점수: "),
    "games": MessageLookupByLibrary.simpleMessage("게임"),
    "gear": MessageLookupByLibrary.simpleMessage("장비"),
    "german": MessageLookupByLibrary.simpleMessage("독일어"),
    "githubRepository": MessageLookupByLibrary.simpleMessage("github 저장소"),
    "halfBreed": MessageLookupByLibrary.simpleMessage("혼혈"),
    "halfling": MessageLookupByLibrary.simpleMessage("하플링"),
    "headGear": MessageLookupByLibrary.simpleMessage("머리 장비"),
    "helmet": MessageLookupByLibrary.simpleMessage("투구"),
    "heyMyNameIsGleb": MessageLookupByLibrary.simpleMessage("안녕하세요! 저는 글렙입니다"),
    "highestScoreWins": MessageLookupByLibrary.simpleMessage("최고 점수 승리"),
    "human": MessageLookupByLibrary.simpleMessage("인간"),
    "indicatesAnActiveCurse": MessageLookupByLibrary.simpleMessage(
      "활성 저주를 나타냅니다",
    ),
    "jack": MessageLookupByLibrary.simpleMessage("잭"),
    "jack2Points": MessageLookupByLibrary.simpleMessage("잭: 2점"),
    "keepAwakeMode": MessageLookupByLibrary.simpleMessage("화면 켜짐 유지"),
    "king": MessageLookupByLibrary.simpleMessage("킹"),
    "king4Points": MessageLookupByLibrary.simpleMessage("킹: 4점"),
    "languages": MessageLookupByLibrary.simpleMessage("언어"),
    "largestArmy": MessageLookupByLibrary.simpleMessage("최대 군대"),
    "leftHand": MessageLookupByLibrary.simpleMessage("왼손"),
    "letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour":
        MessageLookupByLibrary.simpleMessage(
          " 점수와 주요 순간을 손쉽게 기록하여 게임에 집중할 수 있습니다",
        ),
    "level": MessageLookupByLibrary.simpleMessage("레벨"),
    "light": MessageLookupByLibrary.simpleMessage("라이트"),
    "longestRoad": MessageLookupByLibrary.simpleMessage("최장 도로"),
    "lowestScoreWins": MessageLookupByLibrary.simpleMessage("최저 점수 승리"),
    "magic": MessageLookupByLibrary.simpleMessage("마법"),
    "mapGenerator": MessageLookupByLibrary.simpleMessage("맵 생성기"),
    "marksADeadCharacterInfo": MessageLookupByLibrary.simpleMessage(
      "사망한 캐릭터를 표시합니다",
    ),
    "marriage": MessageLookupByLibrary.simpleMessage("결혼:"),
    "menu": MessageLookupByLibrary.simpleMessage("메뉴"),
    "mermaidVictory": MessageLookupByLibrary.simpleMessage("인어 승리"),
    "mode": MessageLookupByLibrary.simpleMessage("모드"),
    "modifiers": MessageLookupByLibrary.simpleMessage("수정치"),
    "moveHistory": MessageLookupByLibrary.simpleMessage("이동 기록"),
    "multiplayer": MessageLookupByLibrary.simpleMessage("멀티플레이어"),
    "munchkin": MessageLookupByLibrary.simpleMessage("먼치킨"),
    "munchkinCombatCompareLevels": MessageLookupByLibrary.simpleMessage(
      "캐릭터의 레벨(보너스 포함)과 몬스터의 레벨을 비교합니다.",
    ),
    "munchkinCombatEscapeRules": MessageLookupByLibrary.simpleMessage(
      "이길 수 없으면 도주합니다(주사위 굴리기). 5 또는 6이 나오면 성공. 도주 실패 시 몬스터 카드에 적힌 결과를 따릅니다.",
    ),
    "munchkinCombatHelpOrBoost": MessageLookupByLibrary.simpleMessage(
      "레벨이 낮으면: 다른 플레이어에게 도움을 요청하거나(협상) 손에 있는 카드로 자신을 강화할 수 있습니다.",
    ),
    "munchkinCombatTitle": MessageLookupByLibrary.simpleMessage(
      "전투 (몬스터가 있을 경우):",
    ),
    "munchkinCombatWinCondition": MessageLookupByLibrary.simpleMessage(
      "레벨이 같거나 높으면 승리하여 보물과 레벨을 획득합니다.",
    ),
    "munchkinCurseEncounter": MessageLookupByLibrary.simpleMessage(
      "저주: 즉시 자신에게 적용합니다.",
    ),
    "munchkinCursesCardType": MessageLookupByLibrary.simpleMessage(
      "저주 — 캐릭터나 다른 플레이어를 방해합니다.",
    ),
    "munchkinDeathRules": MessageLookupByLibrary.simpleMessage(
      "사망: 레벨과 종족(또는 직업)을 제외한 모든 카드를 잃습니다.",
    ),
    "munchkinEndTurnDiscardRules": MessageLookupByLibrary.simpleMessage(
      "턴 종료 시 카드가 5장 이상이면 초과분을 버립니다. 가장 낮은 레벨의 플레이어에게 줍니다.",
    ),
    "munchkinEquipmentCardType": MessageLookupByLibrary.simpleMessage(
      "장비 — 전투 시 레벨에 보너스를 줍니다.",
    ),
    "munchkinGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "몬스터를 물리치고 장비, 저주, 능력 카드를 사용하여 가장 먼저 레벨 10에 도달하세요.",
    ),
    "munchkinInitialCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "각 플레이어는 문 덱에서 4장, 보물 덱에서 4장을 가져갑니다.",
    ),
    "munchkinLevel10Condition": MessageLookupByLibrary.simpleMessage(
      "레벨 10: 마지막 레벨은 반드시 몬스터를 물리쳐야 달성됩니다.",
    ),
    "munchkinMonsterEncounter": MessageLookupByLibrary.simpleMessage(
      "몬스터: 전투합니다 (\'전투\' 참조).",
    ),
    "munchkinMonsterEnhancersCardType": MessageLookupByLibrary.simpleMessage(
      "몬스터 강화 — 몬스터의 전투력을 올립니다.",
    ),
    "munchkinMonsterVictoryReward": MessageLookupByLibrary.simpleMessage(
      "몬스터 처치: 몬스터를 물리치면 레벨과 보물을 얻습니다.",
    ),
    "munchkinMonstersCardType": MessageLookupByLibrary.simpleMessage(
      "몬스터 — 싸워서 레벨업합니다.",
    ),
    "munchkinNoMonsterActionsDescription": MessageLookupByLibrary.simpleMessage(
      "손에 있는 몬스터를 꺼내 싸우거나(선택) \'말썽 찾기\'를 합니다(문 덱에서 카드를 손으로 뽑기).",
    ),
    "munchkinNoMonsterActionsTitle": MessageLookupByLibrary.simpleMessage(
      "몬스터가 없을 경우, 플레이어는:",
    ),
    "munchkinOneTimeItemsCardType": MessageLookupByLibrary.simpleMessage(
      "일회용 아이템 — 전투 중 또는 기타 효과에 사용합니다.",
    ),
    "munchkinOtherCardEncounter": MessageLookupByLibrary.simpleMessage(
      "기타 카드: 손에 보관합니다.",
    ),
    "munchkinShuffleCardsInstruction": MessageLookupByLibrary.simpleMessage(
      "문 카드와 보물 카드를 섞어 두 개의 별도 덱으로 나누세요.",
    ),
    "munchkinStartingGearInstruction": MessageLookupByLibrary.simpleMessage(
      "플레이어는 시작 장비 카드가 있으면 테이블 위에 놓습니다.",
    ),
    "munchkinTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "munchkin®은 steve jackson games의 등록 상표입니다.",
    ),
    "munchkinTurnDescription": MessageLookupByLibrary.simpleMessage(
      "플레이어가 문 덱의 맨 위 카드를 뽑습니다. 가능한 결과:",
    ),
    "munchkinVictoryCondition": MessageLookupByLibrary.simpleMessage(
      "가장 먼저 레벨 10에 도달한 플레이어가 승리합니다!",
    ),
    "myOtherApps": MessageLookupByLibrary.simpleMessage("다른 앱"),
    "nWord": MessageLookupByLibrary.simpleMessage("\n단어"),
    "name": MessageLookupByLibrary.simpleMessage("이름"),
    "newGame": MessageLookupByLibrary.simpleMessage("새 게임"),
    "newGameWithSamePlayers": MessageLookupByLibrary.simpleMessage("다시 한 판"),
    "nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage("다음 플레이어가 1장을 뽑고 턴을 건너뜁니다."),
    "nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage("다음 플레이어가 5장을 뽑고 턴을 건너뜁니다."),
    "nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo":
        MessageLookupByLibrary.simpleMessage("다음 플레이어가 2장을 뽑고 턴을 잃습니다."),
    "nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage("다음 플레이어가 선택한 색이 나올 때까지 뽑습니다."),
    "nine0Points": MessageLookupByLibrary.simpleMessage("9: 0점"),
    "no": MessageLookupByLibrary.simpleMessage("아니요"),
    "noClass": MessageLookupByLibrary.simpleMessage("직업 없음"),
    "noItem": MessageLookupByLibrary.simpleMessage("아이템 없음"),
    "numberButtons": MessageLookupByLibrary.simpleMessage("숫자 버튼"),
    "numberButtonsDescription": MessageLookupByLibrary.simpleMessage(
      "기본 카드(게, 배, 물고기, 상어, 수영 선수, 선원, 선장, 등대)와 그 조합에 사용합니다. 총 점수에 해당하는 버튼을 누르세요.",
    ),
    "numberCards": MessageLookupByLibrary.simpleMessage("숫자 카드"),
    "off": MessageLookupByLibrary.simpleMessage("끄기"),
    "on": MessageLookupByLibrary.simpleMessage("켜기"),
    "options": MessageLookupByLibrary.simpleMessage("옵션"),
    "others": MessageLookupByLibrary.simpleMessage("기타"),
    "pass": MessageLookupByLibrary.simpleMessage("패스"),
    "play": MessageLookupByLibrary.simpleMessage("플레이"),
    "playerName": MessageLookupByLibrary.simpleMessage("플레이어 이름"),
    "playerOnBarrel": MessageLookupByLibrary.simpleMessage("통 위의 플레이어:"),
    "players": MessageLookupByLibrary.simpleMessage("플레이어"),
    "playersOnBarrel": MessageLookupByLibrary.simpleMessage("통 위의 플레이어들:"),
    "points": MessageLookupByLibrary.simpleMessage("점수"),
    "pointsConfirmed": MessageLookupByLibrary.simpleMessage("점수 확인됨"),
    "pointsCount": m1,
    "possiblyTheRemovalOfCursesOrDebuffs": MessageLookupByLibrary.simpleMessage(
      "저주 또는 디버프의 해제 가능성",
    ),
    "preparation": MessageLookupByLibrary.simpleMessage("준비:"),
    "projectWebsite": MessageLookupByLibrary.simpleMessage("프로젝트 웹사이트"),
    "queen": MessageLookupByLibrary.simpleMessage("퀸"),
    "queen3Points": MessageLookupByLibrary.simpleMessage("퀸: 3점"),
    "race1": MessageLookupByLibrary.simpleMessage("종족 1"),
    "rateTheApp": MessageLookupByLibrary.simpleMessage("앱 평가하기"),
    "reportABug": MessageLookupByLibrary.simpleMessage("버그 신고하기"),
    "resources": MessageLookupByLibrary.simpleMessage("자원:"),
    "results": MessageLookupByLibrary.simpleMessage("결과"),
    "returnToMenu": MessageLookupByLibrary.simpleMessage("메뉴로 돌아가기"),
    "reverseCardUnoInfo": MessageLookupByLibrary.simpleMessage("리버스 카드"),
    "rightHand": MessageLookupByLibrary.simpleMessage("오른손"),
    "rollDiceLocale": MessageLookupByLibrary.simpleMessage("주사위 굴리기"),
    "round": MessageLookupByLibrary.simpleMessage("라운드"),
    "rules": MessageLookupByLibrary.simpleMessage("규칙"),
    "russian": MessageLookupByLibrary.simpleMessage("러시아어"),
    "score": MessageLookupByLibrary.simpleMessage("점수"),
    "score50ExtraPointsForUsingAll7Tiles": MessageLookupByLibrary.simpleMessage(
      "7개 타일을 모두 사용하면 50점 추가",
    ),
    "scrabble": MessageLookupByLibrary.simpleMessage("스크래블"),
    "scrabbleAdditionalDisputedWords": MessageLookupByLibrary.simpleMessage(
      "이의가 제기된 단어는 합의된 사전에서 확인합니다.",
    ),
    "scrabbleAdditionalPointsTitle": MessageLookupByLibrary.simpleMessage(
      "추가 규칙:",
    ),
    "scrabbleAdditionalReplaceTiles": MessageLookupByLibrary.simpleMessage(
      "플레이어는 타일을 교환하고 턴을 넘길 수 있습니다.",
    ),
    "scrabbleAdditionalWordRules": MessageLookupByLibrary.simpleMessage(
      "모든 단어는 완전하고 언어 규칙을 따라야 합니다.",
    ),
    "scrabbleEndGameNoTiles": MessageLookupByLibrary.simpleMessage(
      "타일이 없고 더 이상 놓을 수 없을 때 게임이 종료됩니다.",
    ),
    "scrabbleEndGameRemainingTilesPenalty":
        MessageLookupByLibrary.simpleMessage("사용하지 않은 타일은 플레이어의 점수에서 차감됩니다."),
    "scrabbleEndGameSkippedTurns": MessageLookupByLibrary.simpleMessage(
      "모든 플레이어가 두 번 연속 턴을 넘기면 게임이 종료됩니다.",
    ),
    "scrabbleFeatureBlankTile": MessageLookupByLibrary.simpleMessage(
      "빈 타일은 어떤 글자든 대신할 수 있지만 점수는 없습니다.",
    ),
    "scrabbleFeatureRefillTiles": MessageLookupByLibrary.simpleMessage(
      "매 턴 후 거치대에 7개가 되도록 타일을 보충합니다.",
    ),
    "scrabbleFeatureSevenTileBonus": MessageLookupByLibrary.simpleMessage(
      "한 턴에 7개 타일을 모두 사용하면 50점 보너스를 받습니다.",
    ),
    "scrabbleFeaturesTitle": MessageLookupByLibrary.simpleMessage("특징:"),
    "scrabbleGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "보드에 십자말풀이 형태로 단어를 만드세요. 상대보다 더 많은 점수를 획득하세요.",
    ),
    "scrabbleGameSetAccessories": MessageLookupByLibrary.simpleMessage(
      "거치대 4개, 타일 주머니.",
    ),
    "scrabbleGameSetBoard": MessageLookupByLibrary.simpleMessage("15x15 보드."),
    "scrabbleGameSetLetters": MessageLookupByLibrary.simpleMessage(
      "104개 타일 (빈 타일 2개 포함).",
    ),
    "scrabbleGameSetTitle": MessageLookupByLibrary.simpleMessage("게임 구성:"),
    "scrabblePreparationDrawTiles": MessageLookupByLibrary.simpleMessage(
      "각 플레이어가 7개의 타일을 뽑습니다.",
    ),
    "scrabblePreparationFirstTurnRule": MessageLookupByLibrary.simpleMessage(
      "무작위로 뽑은 타일이 알파벳 순서에서 가장 앞선 플레이어가 먼저 시작합니다.",
    ),
    "scrabblePreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "주머니 안의 타일을 섞으세요.",
    ),
    "scrabbleScoringBlueBonus": MessageLookupByLibrary.simpleMessage(
      "파란 칸은 글자 점수를 2배/3배로 합니다.",
    ),
    "scrabbleScoringRedBonus": MessageLookupByLibrary.simpleMessage(
      "빨간 칸은 단어 점수를 2배/3배로 합니다.",
    ),
    "scrabbleScoringTitle": MessageLookupByLibrary.simpleMessage("점수 계산:"),
    "scrabbleScoringWordPoints": MessageLookupByLibrary.simpleMessage(
      "단어 점수: 타일 점수의 합 + 보드 칸 보너스.",
    ),
    "scrabbleTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "scrabble®은 hasbro, inc.의 등록 상표입니다.",
    ),
    "scrabbleTurnRuleFirstWord": MessageLookupByLibrary.simpleMessage(
      "첫 번째 단어: 반드시 중앙 칸(별)을 통과해야 합니다.",
    ),
    "scrabbleTurnRuleLetterPlacement": MessageLookupByLibrary.simpleMessage(
      "새 타일은 반드시 새 단어 또는 기존 단어의 일부를 이루어야 합니다.",
    ),
    "scrabbleTurnRuleWordDirection": MessageLookupByLibrary.simpleMessage(
      "모든 단어는 가로 또는 세로로 배치해야 합니다.",
    ),
    "scrabbleTurnRulesTitle": MessageLookupByLibrary.simpleMessage("턴 규칙:"),
    "seaSaltPaper": MessageLookupByLibrary.simpleMessage("sea salt & paper"),
    "seaSaltPaperDuoBoat": MessageLookupByLibrary.simpleMessage(
      "배 듀오: 즉시 추가 턴을 합니다.",
    ),
    "seaSaltPaperDuoCardsDescription": MessageLookupByLibrary.simpleMessage(
      "행동 후 일치하는 쌍을 내서 특수 효과를 발동할 수 있습니다:",
    ),
    "seaSaltPaperDuoCardsTitle": MessageLookupByLibrary.simpleMessage("듀오 카드:"),
    "seaSaltPaperDuoCrab": MessageLookupByLibrary.simpleMessage(
      "게 듀오: 버리는 더미 하나를 살펴보고 아무 카드나 가져갑니다.",
    ),
    "seaSaltPaperDuoFish": MessageLookupByLibrary.simpleMessage(
      "물고기 듀오: 덱에서 맨 위 카드를 뽑습니다.",
    ),
    "seaSaltPaperDuoShark": MessageLookupByLibrary.simpleMessage(
      "상어 + 수영 선수 듀오: 상대의 손에서 카드 1장을 가져옵니다.",
    ),
    "seaSaltPaperEndRoundDescription": MessageLookupByLibrary.simpleMessage(
      "7점 이상일 때 다음 중 하나를 선택하여 라운드를 종료할 수 있습니다:",
    ),
    "seaSaltPaperEndRoundTitle": MessageLookupByLibrary.simpleMessage(
      "라운드 종료:",
    ),
    "seaSaltPaperGameObjectiveDescription":
        MessageLookupByLibrary.simpleMessage(
          "카드를 모아 조합을 만들고 점수를 얻으세요. 전략적으로 라운드를 끝내 먼저 목표 점수에 도달하세요.",
        ),
    "seaSaltPaperLastChanceOption": MessageLookupByLibrary.simpleMessage(
      "라스트 찬스: 각 상대에게 한 턴씩 더 줍니다. 여전히 최고 점수라면 색상 다수 보너스를 얻습니다. 누군가가 이기면 색상 다수만 얻습니다.",
    ),
    "seaSaltPaperPreparationDiscard": MessageLookupByLibrary.simpleMessage(
      "2장을 앞면으로 뒤집어 버리는 더미 2개를 만듭니다.",
    ),
    "seaSaltPaperPreparationShuffle": MessageLookupByLibrary.simpleMessage(
      "모든 카드를 섞어 중앙에 뒤집어 놓습니다.",
    ),
    "seaSaltPaperPreparationStartPlayer": MessageLookupByLibrary.simpleMessage(
      "시작 플레이어를 정합니다.",
    ),
    "seaSaltPaperScoringCollections": MessageLookupByLibrary.simpleMessage(
      "컬렉션(조개, 펭귄, 문어)은 카드가 많을수록 더 많은 점수를 얻습니다.",
    ),
    "seaSaltPaperScoringColorMajority": MessageLookupByLibrary.simpleMessage(
      "색상 다수: 가장 많은 색상의 카드당 보너스 1점.",
    ),
    "seaSaltPaperScoringMermaid": MessageLookupByLibrary.simpleMessage(
      "인어: 인어 카드 4장을 모두 모으면 즉시 승리!",
    ),
    "seaSaltPaperScoringPairs": MessageLookupByLibrary.simpleMessage(
      "쌍과 조합은 종류에 따라 점수를 얻습니다.",
    ),
    "seaSaltPaperScoringTitle": MessageLookupByLibrary.simpleMessage("점수:"),
    "seaSaltPaperStopOption": MessageLookupByLibrary.simpleMessage(
      "중지: 라운드가 즉시 종료됩니다. 모든 플레이어가 카드 점수를 계산합니다.",
    ),
    "seaSaltPaperTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "sea salt & paper®는 studio bombyx의 상표입니다. bruno cathala와 théo rivière가 디자인했습니다.",
    ),
    "seaSaltPaperTurnDescription": MessageLookupByLibrary.simpleMessage(
      "자신의 턴에 두 가지 행동 중 하나를 선택합니다:",
    ),
    "seaSaltPaperTurnDrawTwo": MessageLookupByLibrary.simpleMessage(
      "덱에서 2장을 뽑고 1장을 가지고 나머지를 버리는 더미에 놓습니다.",
    ),
    "seaSaltPaperTurnTakeDiscard": MessageLookupByLibrary.simpleMessage(
      "버리는 더미 중 하나에서 맨 위 카드를 가져갑니다.",
    ),
    "seaSaltPaperVictory2Players": MessageLookupByLibrary.simpleMessage(
      "2인: 먼저 40점에 도달하면 승리.",
    ),
    "seaSaltPaperVictory3Players": MessageLookupByLibrary.simpleMessage(
      "3인: 먼저 35점에 도달하면 승리.",
    ),
    "seaSaltPaperVictory4Players": MessageLookupByLibrary.simpleMessage(
      "4인: 먼저 30점에 도달하면 승리.",
    ),
    "secondBonus": MessageLookupByLibrary.simpleMessage("두 번째 보너스"),
    "secondRace": MessageLookupByLibrary.simpleMessage("종족 2"),
    "set": MessageLookupByLibrary.simpleMessage("set"),
    "setCardAttributeFillType": MessageLookupByLibrary.simpleMessage(
      "채우기 유형: 비어있음, 줄무늬, 채워짐.",
    ),
    "setCardAttributeNumberOfSymbols": MessageLookupByLibrary.simpleMessage(
      "기호 수: 1, 2, 또는 3.",
    ),
    "setCardAttributeSymbolColor": MessageLookupByLibrary.simpleMessage(
      "기호 색상: 빨강, 초록, 보라.",
    ),
    "setCardAttributeSymbolType": MessageLookupByLibrary.simpleMessage(
      "기호 유형: 타원, 다이아몬드, 물결.",
    ),
    "setCardAttributesDescription": MessageLookupByLibrary.simpleMessage(
      "각 카드는 고유하며 4가지 속성을 가집니다:",
    ),
    "setCardAttributesTitle": MessageLookupByLibrary.simpleMessage("카드 속성:"),
    "setExampleOfValidSetColor": MessageLookupByLibrary.simpleMessage(
      "속성 \'수\': 모두 같음 (2개).",
    ),
    "setExampleOfValidSetFill": MessageLookupByLibrary.simpleMessage(
      "세트를 찾을 수 없을 때:",
    ),
    "setExampleOfValidSetNumber": MessageLookupByLibrary.simpleMessage(
      "속성 \'유형\': 모두 다름 (타원, 다이아몬드, 물결).",
    ),
    "setExampleOfValidSetTitle": MessageLookupByLibrary.simpleMessage(
      "속성 \'색상\': 모두 다름 (빨강, 초록, 보라).",
    ),
    "setExampleOfValidSetType": MessageLookupByLibrary.simpleMessage(
      "속성 \'채우기\': 모두 같음 (줄무늬).",
    ),
    "setGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "각 속성이 모든 카드에서 같거나 모두 다른 세트(3장의 카드 그룹)를 찾으세요.",
    ),
    "setGameTurnStepContinue": MessageLookupByLibrary.simpleMessage(
      "올바른 세트 예시:",
    ),
    "setGameTurnStepDealerSetup": MessageLookupByLibrary.simpleMessage(
      "딜러가 12장의 카드를 놓습니다.",
    ),
    "setGameTurnStepFindingSet": MessageLookupByLibrary.simpleMessage(
      "플레이어들이 동시에 세트를 찾습니다. 먼저 찾은 사람이 외칩니다: \'세트!\'",
    ),
    "setGameTurnStepFour": MessageLookupByLibrary.simpleMessage("게임이 계속됩니다."),
    "setGameTurnStepValidation": MessageLookupByLibrary.simpleMessage(
      "정확성 확인: 맞으면 플레이어가 카드를 가져가고 딜러가 새 카드 3장으로 교체합니다. 틀리면 1점을 잃거나 턴을 건너뜁니다(합의에 따라).",
    ),
    "setImportantRuleCardPosition": MessageLookupByLibrary.simpleMessage(
      "세트를 이루는 카드는 어떤 순서로든 배열할 수 있습니다.",
    ),
    "setImportantRuleConfirmation": MessageLookupByLibrary.simpleMessage(
      "이전 세트가 확인되기 전에는 새 세트를 선언할 수 없습니다.",
    ),
    "setImportantRuleSimplifiedMode": MessageLookupByLibrary.simpleMessage(
      "학습용으로 3가지 속성만 사용하여 게임을 단순화할 수 있습니다.",
    ),
    "setImportantRulesTitle": MessageLookupByLibrary.simpleMessage("중요 규칙:"),
    "setNoSetFoundDescription": MessageLookupByLibrary.simpleMessage(
      "12장 중 세트가 없으면 딜러가 3장을 추가합니다(최대 21장). 21장 중에는 항상 세트가 존재합니다.",
    ),
    "setNoSetFoundTitle": MessageLookupByLibrary.simpleMessage(
      "세트를 찾을 수 없을 때:",
    ),
    "setScoringGameEnd": MessageLookupByLibrary.simpleMessage(
      "덱이 소진되거나 미리 정한 점수에 도달하면 게임이 종료됩니다.",
    ),
    "setScoringPointPerSet": MessageLookupByLibrary.simpleMessage("찾은 세트당 1점."),
    "setScoringTitle": MessageLookupByLibrary.simpleMessage("점수:"),
    "setTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "set®은 set enterprises, inc.의 등록 상표입니다.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "settlement": MessageLookupByLibrary.simpleMessage("정착지"),
    "shareFeedback": MessageLookupByLibrary.simpleMessage("피드백 공유하기"),
    "shareWithFriedns": MessageLookupByLibrary.simpleMessage("친구와 공유"),
    "shareWithFriends": MessageLookupByLibrary.simpleMessage("친구와 공유하기"),
    "sinceThisIsAnOpenSourceProjectYouCanLeave":
        MessageLookupByLibrary.simpleMessage("오픈소스 프로젝트이므로 자유롭게 기여해 주세요"),
    "singleplayer": MessageLookupByLibrary.simpleMessage("싱글플레이어"),
    "skip": MessageLookupByLibrary.simpleMessage("건너뛰기"),
    "skipCardUnoInfo": MessageLookupByLibrary.simpleMessage("건너뛰기 카드"),
    "skipEveryoneCardUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "전원 건너뛰기 카드",
    ),
    "skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo":
        MessageLookupByLibrary.simpleMessage(
          "모든 플레이어를 건너뛰고 원래 플레이어에게 턴이 돌아옵니다.",
        ),
    "skipsTheNextPlayersTurnUnoInfo": MessageLookupByLibrary.simpleMessage(
      "다음 플레이어의 턴을 건너뜁니다.",
    ),
    "spanish": MessageLookupByLibrary.simpleMessage("스페인어"),
    "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
      "특수 카드 (각 2점):",
    ),
    "specialCardsTitle": MessageLookupByLibrary.simpleMessage("특수 카드:"),
    "specialRulesTitle": MessageLookupByLibrary.simpleMessage("특별 규칙:"),
    "subtracting": MessageLookupByLibrary.simpleMessage("빼기"),
    "superMunch": MessageLookupByLibrary.simpleMessage("슈퍼 먼치"),
    "swapHandsWithAnyPlayerAndChooseTheColorUnoInfo":
        MessageLookupByLibrary.simpleMessage("아무 플레이어와 손패를 교환하고 색상을 선택합니다."),
    "sword": MessageLookupByLibrary.simpleMessage("검"),
    "telegram": MessageLookupByLibrary.simpleMessage("telegram"),
    "ten10Points": MessageLookupByLibrary.simpleMessage("10: 10점"),
    "theNumberOfPlayersShouldBe": MessageLookupByLibrary.simpleMessage(
      "플레이어 수는 다음이어야 합니다",
    ),
    "theRobberRolling7": MessageLookupByLibrary.simpleMessage("도적 (7이 나왔을 때):"),
    "theme": MessageLookupByLibrary.simpleMessage("테마"),
    "thief": MessageLookupByLibrary.simpleMessage("도적"),
    "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
      "딜러 다음 플레이어부터 얻을 수 있다고 생각하는 점수를 입찰합니다(최소 입찰 100). 각 입찰은 이전보다 높아야 합니다(5 또는 10 단위).",
    ),
    "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
      "최고 입찰자가 경매에서 이기고 탈론을 가져가며 트럼프 수트를 선언합니다. 입찰자는 3장을 뒤집어 버립니다(점수는 유지).",
    ),
    "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
      "더 높게 입찰하고 싶지 않으면 패스할 수 있습니다.",
    ),
    "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
      "입찰자가 입찰 금액 이상을 얻으면: 실제 점수를 합계에 더합니다.",
    ),
    "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
      "다른 플레이어는 이긴 트릭의 점수를 합계에 더합니다.",
    ),
    "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
      "입찰자가 입찰에 미달하면: 입찰 금액이 합계에서 차감됩니다(마이너스가 될 수 있음).",
    ),
    "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
      "입찰자가 아무 카드나 내며 첫 트릭을 리드합니다. 다른 플레이어는 가능하면 같은 수트를 내야 합니다. 불가능하면 트럼프 카드를 내야 합니다.",
    ),
    "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
      "트릭의 승자가 다음 트릭을 리드합니다. 모든 카드가 사용될 때까지 계속합니다.",
    ),
    "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
      "리드된 수트의 가장 높은 카드가 이기지만, 트럼프가 나오면 가장 높은 트럼프가 이깁니다.",
    ),
    "thousandGoal": MessageLookupByLibrary.simpleMessage(
      "비딩 게임에서 트릭을 이겨 가장 먼저 1000점에 도달하는 것이 목표입니다. 플레이어는 얼마나 많은 점수를 얻을 수 있는지 입찰하고 계약을 이행하려고 합니다.",
    ),
    "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
      "최소 한 트릭을 이겨야만 결혼 점수를 얻을 수 있습니다.",
    ),
    "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
      "결혼은 같은 수트의 킹과 퀸을 손에 들고 있는 것입니다.",
    ),
    "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
      "비트럼프 결혼: 80점 (같은 규칙 적용).",
    ),
    "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
      "트럼프 결혼: 100점 (쌍의 첫 번째 카드를 낼 때 선언해야 함).",
    ),
    "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
      "24장의 카드 덱 사용: 모든 4가지 수트의 9, 10, 잭, 퀸, 킹, 에이스.",
    ),
    "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
      "중앙에 3장을 뒤집어 탈론(미망인)으로 놓습니다.",
    ),
    "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
      "각 플레이어에게 7장(3인용) 또는 8장(2인용)을 나눠줍니다.",
    ),
    "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
      "통 규칙: 플레이어가 880점 이상에 도달하면 \'통 위\'에 있으며 정확히 1000점을 만들어야 하고, 그렇지 않으면 880점으로 돌아갑니다.",
    ),
    "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
      "일부 변형에서는 정확히 1000점이 필요합니다. 초과하면 880점 또는 이전 점수로 리셋됩니다.",
    ),
    "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
      "덱의 총 점수: 120. 결혼 보너스가 있으면 추가합니다.",
    ),
    "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
      "가장 먼저 1000점(또는 하우스 규칙에 따라 정확히 1000점)에 도달한 플레이어가 승리합니다.",
    ),
    "toAllWhoCreatedThe": MessageLookupByLibrary.simpleMessage(
      "만들어 주신 모든 분들께 감사드립니다",
    ),
    "total": MessageLookupByLibrary.simpleMessage("합계"),
    "totalStrength": MessageLookupByLibrary.simpleMessage("총 전투력: "),
    "trading": MessageLookupByLibrary.simpleMessage("거래:"),
    "tripleTheValueOfALetterScrabbleInfo": MessageLookupByLibrary.simpleMessage(
      "글자의 점수를 3배로 합니다",
    ),
    "tripleTheValueOfAnEntireWordScrabbleInfo":
        MessageLookupByLibrary.simpleMessage("단어 전체의 점수를 3배로 합니다"),
    "twoHanded": MessageLookupByLibrary.simpleMessage("양손"),
    "uno": MessageLookupByLibrary.simpleMessage("uno"),
    "unoActiveCardDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'2장 뽑기\': 다음 플레이어가 2장을 뽑고 턴을 잃습니다.",
    ),
    "unoActiveCardReverse": MessageLookupByLibrary.simpleMessage(
      "\'리버스\': 진행 방향이 바뀝니다.",
    ),
    "unoActiveCardSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'건너뛰기\': 다음 플레이어가 턴을 잃습니다.",
    ),
    "unoActiveCardWild": MessageLookupByLibrary.simpleMessage(
      "\'와일드\': 색상을 선택할 수 있습니다.",
    ),
    "unoActiveCardWildDrawFour": MessageLookupByLibrary.simpleMessage(
      "\'와일드 4장 뽑기\': 색상을 선택하고 다음 플레이어가 4장을 뽑습니다. 일치하는 카드가 없을 때만 사용 가능합니다.",
    ),
    "unoActiveCardsTitle": MessageLookupByLibrary.simpleMessage("액션 카드:"),
    "unoFlip": MessageLookupByLibrary.simpleMessage("uno flip"),
    "unoFlipDarkSideCardsTitle": MessageLookupByLibrary.simpleMessage("어두운 면:"),
    "unoFlipDarkSideDrawFive": MessageLookupByLibrary.simpleMessage(
      "\'5장 뽑기\'",
    ),
    "unoFlipDarkSideDrawUntilColor": MessageLookupByLibrary.simpleMessage(
      "\'일치하는 색이 나올 때까지 뽑기\'",
    ),
    "unoFlipDarkSideReverse": MessageLookupByLibrary.simpleMessage("\'리버스\'"),
    "unoFlipDarkSideSkipAll": MessageLookupByLibrary.simpleMessage(
      "\'전원 건너뛰기\'",
    ),
    "unoFlipDarkSideWildCard": MessageLookupByLibrary.simpleMessage("\'와일드\'"),
    "unoFlipGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "모든 카드를 내고 상대의 남은 카드에서 점수를 얻으세요. 먼저 500점에 도달한 플레이어가 승리합니다.",
    ),
    "unoFlipGameStartDealCards": MessageLookupByLibrary.simpleMessage(
      "각 플레이어가 7장을 받습니다.",
    ),
    "unoFlipGameStartLightSide": MessageLookupByLibrary.simpleMessage(
      "덱의 밝은 면에서 게임을 시작합니다.",
    ),
    "unoFlipGameStartTitle": MessageLookupByLibrary.simpleMessage("게임 시작:"),
    "unoFlipKeyMoment": MessageLookupByLibrary.simpleMessage("주요 순간:"),
    "unoFlipKeyMomentFlipCardEffect": MessageLookupByLibrary.simpleMessage(
      "\'뒤집기\' 카드 후 게임 전체가 반대편으로 전환됩니다.",
    ),
    "unoFlipKeyMomentUnoCall": MessageLookupByLibrary.simpleMessage(
      "끝에서 두 번째 카드를 낼 때 \'우노!\'를 외치세요. 잊고 들키면 2장을 뽑습니다.",
    ),
    "unoFlipLightSideCardsTitle": MessageLookupByLibrary.simpleMessage("밝은 면:"),
    "unoFlipLightSideDrawOne": MessageLookupByLibrary.simpleMessage(
      "\'1장 뽑기\'",
    ),
    "unoFlipLightSideReverse": MessageLookupByLibrary.simpleMessage("\'리버스\'"),
    "unoFlipLightSideSkipTurn": MessageLookupByLibrary.simpleMessage(
      "\'턴 건너뛰기\'",
    ),
    "unoFlipLightSideWildCard": MessageLookupByLibrary.simpleMessage("\'와일드\'"),
    "unoFlipLightSideWildDrawTwo": MessageLookupByLibrary.simpleMessage(
      "\'와일드 2장 뽑기\'",
    ),
    "unoFlipScoringActiveCards": MessageLookupByLibrary.simpleMessage(
      "액션 카드: 종류에 따라 20~60점.",
    ),
    "unoFlipScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "숫자 카드: 표시된 숫자.",
    ),
    "unoFlipScoringRoundWinnerPoints": MessageLookupByLibrary.simpleMessage(
      "라운드 승자는 상대의 남은 카드에서 점수를 얻습니다:",
    ),
    "unoFlipScoringTitle": MessageLookupByLibrary.simpleMessage("점수:"),
    "unoFlipTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno flip®는 mattel의 등록 상표입니다.",
    ),
    "unoFlipTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "일치하는 카드가 없으면 더미에서 뽑습니다.",
    ),
    "unoFlipTurnRuleFlipCard": MessageLookupByLibrary.simpleMessage(
      "\'뒤집기\' 카드는 게임을 덱의 반대편으로 전환합니다.",
    ),
    "unoFlipTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "색상, 숫자 또는 기호가 일치하는 카드를 냅니다.",
    ),
    "unoFlipVictory500Points": MessageLookupByLibrary.simpleMessage(
      "먼저 500점에 도달한 플레이어가 승리합니다.",
    ),
    "unoFlipVictoryLowestScoreAlternative":
        MessageLookupByLibrary.simpleMessage(
          "대안: 게임 종료 후 가장 낮은 점수의 플레이어가 승리합니다.",
        ),
    "unoGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
      "가장 먼저 모든 카드를 내고 상대의 남은 카드에서 점수를 얻으세요. 먼저 500점에 도달한 플레이어가 승리합니다.",
    ),
    "unoGameTurnTitle": MessageLookupByLibrary.simpleMessage(
      "플레이어는 색상, 숫자 또는 기호가 일치하는 카드를 차례로 냅니다.",
    ),
    "unoPreparationDeckInCenter": MessageLookupByLibrary.simpleMessage(
      "남은 덱을 중앙에 뽑는 더미로 놓습니다.",
    ),
    "unoPreparationDistributeCards": MessageLookupByLibrary.simpleMessage(
      "각 플레이어에게 7장씩 나눠줍니다.",
    ),
    "unoPreparationFlipFirstCard": MessageLookupByLibrary.simpleMessage(
      "맨 위 카드를 뒤집어 버리는 더미를 시작합니다.",
    ),
    "unoScoring20PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'건너뛰기\', \'2장 뽑기\', \'리버스\': 20점.",
    ),
    "unoScoring40PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'핸드 교환\', \'빈 카드\': 40점.",
    ),
    "unoScoring50PointsCards": MessageLookupByLibrary.simpleMessage(
      "\'와일드\', \'와일드 4장 뽑기\': 50점.",
    ),
    "unoScoringNumberCards": MessageLookupByLibrary.simpleMessage(
      "숫자 카드: 표시된 숫자.",
    ),
    "unoScoringTitle": MessageLookupByLibrary.simpleMessage("점수:"),
    "unoSpecialCardBlank": MessageLookupByLibrary.simpleMessage(
      "\'빈 카드\': 게임 시작 전에 규칙을 정하세요.",
    ),
    "unoSpecialCardSwap": MessageLookupByLibrary.simpleMessage(
      "\'핸드 교환\': 아무 플레이어와 손패를 교환하고 색상을 선택합니다.",
    ),
    "unoSpecialRuleReshuffle": MessageLookupByLibrary.simpleMessage(
      "뽑는 더미가 비면 버리는 더미를 다시 섞습니다.",
    ),
    "unoSpecialRuleUnoCall": MessageLookupByLibrary.simpleMessage(
      "\'우노\'를 외치는 것을 잊으셨나요? 다음 플레이어의 턴 전에 들키면 2장을 뽑습니다.",
    ),
    "unoTrademarkNotice": MessageLookupByLibrary.simpleMessage(
      "uno®는 mattel의 등록 상표입니다.",
    ),
    "unoTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
      "낼 수 없으면 카드를 한 장 뽑습니다. 낼 수 있으면 바로 낼 수 있습니다.",
    ),
    "unoTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
      "플레이어는 색상, 숫자 또는 기호가 일치하는 카드를 차례로 냅니다.",
    ),
    "unoTurnRuleOptionalDraw": MessageLookupByLibrary.simpleMessage(
      "낼 수 있는 카드가 있어도 뽑을 수 있지만, 같은 턴에는 낼 수 없습니다.",
    ),
    "unoVictory500Points": MessageLookupByLibrary.simpleMessage(
      "먼저 500점에 도달한 플레이어가 승리합니다.",
    ),
    "unoVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
      "대안: 게임 종료 후 가장 낮은 점수의 플레이어가 승리합니다.",
    ),
    "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
      "정착지를 도시로 업그레이드 (+1점)",
    ),
    "victoryPointCard": MessageLookupByLibrary.simpleMessage("승리 점수 카드"),
    "victoryTitle": MessageLookupByLibrary.simpleMessage("승리:"),
    "warrior": MessageLookupByLibrary.simpleMessage("전사"),
    "whoGoesFirst": MessageLookupByLibrary.simpleMessage("누가 먼저 딜합니까?"),
    "wildCardOneDosInfo": MessageLookupByLibrary.simpleMessage("와일드 # 카드"),
    "wildCardUnoInfo": MessageLookupByLibrary.simpleMessage("와일드 카드"),
    "wildDrawColorUnoFlipInfo": MessageLookupByLibrary.simpleMessage(
      "와일드 드로우 컬러",
    ),
    "wildDrawFourCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "와일드 4장 뽑기 카드",
    ),
    "wildDrawTwoCardDosInfo": MessageLookupByLibrary.simpleMessage(
      "와일드 2장 뽑기 카드",
    ),
    "wildShuffleHandsCardUnoInfo": MessageLookupByLibrary.simpleMessage(
      "와일드 셔플 핸드 카드",
    ),
    "winner": MessageLookupByLibrary.simpleMessage("승자: "),
    "wizard": MessageLookupByLibrary.simpleMessage("마법사"),
    "wordIsTooLongMaximum15LettersAllowed":
        MessageLookupByLibrary.simpleMessage("단어가 너무 깁니다. 최대 15글자까지 허용됩니다"),
    "wordModifier": MessageLookupByLibrary.simpleMessage("단어 수정치: "),
    "x2Word": MessageLookupByLibrary.simpleMessage("x2 단어"),
    "x3Word": MessageLookupByLibrary.simpleMessage("x3 단어"),
    "yes": MessageLookupByLibrary.simpleMessage("예"),
    "youHaveAnUnfinishedGame": MessageLookupByLibrary.simpleMessage(
      "끝나지 않은 게임이 있습니다",
    ),
    "yourBet": MessageLookupByLibrary.simpleMessage("당신의 입찰"),
  };
}
