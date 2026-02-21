// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(playerName, winningBid) =>
      "${playerName} ha raggiunto la sua offerta (${winningBid} punti)?";

  static String m1(count) =>
      "${Intl.plural(count, one: 'punto', other: 'punti')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("info"),
        "ace": MessageLookupByLibrary.simpleMessage("asso"),
        "ace11Points": MessageLookupByLibrary.simpleMessage("asso: 11 punti"),
        "add": MessageLookupByLibrary.simpleMessage("aggiungi"),
        "addPlayer": MessageLookupByLibrary.simpleMessage("aggiungi giocatore"),
        "adding": MessageLookupByLibrary.simpleMessage("aggiunta"),
        "allowsThePlayerToChooseTheColorUnoInfo":
            MessageLookupByLibrary.simpleMessage(
                "permette al giocatore di scegliere il colore."),
        "appreciation": MessageLookupByLibrary.simpleMessage("crediti"),
        "armour": MessageLookupByLibrary.simpleMessage("armatura"),
        "awardedToThePlayerWith3KnightCardsPlayed":
            MessageLookupByLibrary.simpleMessage(
                "assegnata al giocatore con 3+ carte cavaliere giocate"),
        "awardedToThePlayerWith5ConnectedRoads":
            MessageLookupByLibrary.simpleMessage(
                "assegnata al giocatore con 5+ strade collegate"),
        "back": MessageLookupByLibrary.simpleMessage("indietro"),
        "biddingPhase":
            MessageLookupByLibrary.simpleMessage("fase di offerta:"),
        "bigArmour": MessageLookupByLibrary.simpleMessage("grande armatura"),
        "bigBoots": MessageLookupByLibrary.simpleMessage("grandi stivali"),
        "bigHelmet": MessageLookupByLibrary.simpleMessage("grande elmo"),
        "bigMagic": MessageLookupByLibrary.simpleMessage("grande magia"),
        "bigSword": MessageLookupByLibrary.simpleMessage("spadone"),
        "bingo": MessageLookupByLibrary.simpleMessage("bingo"),
        "blankTile": MessageLookupByLibrary.simpleMessage("tessera\njolly"),
        "boardBuddy": MessageLookupByLibrary.simpleMessage("board buddy"),
        "boardBuddyIsYourUltimateBoardGameCompanion":
            MessageLookupByLibrary.simpleMessage(
                "board buddy è il tuo compagno definitivo per i giochi da tavolo"),
        "bonusTileOrSpecialMarkerScrabbleInfo":
            MessageLookupByLibrary.simpleMessage(
                "tessera bonus o marcatore speciale"),
        "boots": MessageLookupByLibrary.simpleMessage("stivali"),
        "buffsOrDebuffsAffectingCharactersitemsInfo":
            MessageLookupByLibrary.simpleMessage(
                "buff o debuff che influenzano personaggi/oggetti"),
        "buildANewSettlementOnAnIntersection":
            MessageLookupByLibrary.simpleMessage(
                "costruisci un nuovo insediamento su un\'intersezione"),
        "buildingCosts":
            MessageLookupByLibrary.simpleMessage("costi di costruzione:"),
        "buildingRules":
            MessageLookupByLibrary.simpleMessage("regole di costruzione:"),
        "canBeAnyColorChosenByTheCurrentPlayerIfDosInfo":
            MessageLookupByLibrary.simpleMessage(
                "può essere di qualsiasi colore scelto dal giocatore attuale. se pescata, il giocatore decide il colore."),
        "canRepresentAnyNumberForItsOwnParticularColorDosInfo":
            MessageLookupByLibrary.simpleMessage(
                "può rappresentare qualsiasi numero per il suo colore particolare."),
        "cancel": MessageLookupByLibrary.simpleMessage("annulla"),
        "card": MessageLookupByLibrary.simpleMessage("carta"),
        "cardTypesTitle":
            MessageLookupByLibrary.simpleMessage("tipi di carte:"),
        "cards": MessageLookupByLibrary.simpleMessage("carte"),
        "catan": MessageLookupByLibrary.simpleMessage("catan"),
        "catanBuildingCostsFour": MessageLookupByLibrary.simpleMessage(
            "carta sviluppo: 1 lana + 1 grano + 1 minerale"),
        "catanBuildingCostsOne":
            MessageLookupByLibrary.simpleMessage("strada: 1 legno + 1 mattone"),
        "catanBuildingCostsThree": MessageLookupByLibrary.simpleMessage(
            "città (potenziamento): 2 grano + 3 minerale (2)"),
        "catanBuildingCostsTwo": MessageLookupByLibrary.simpleMessage(
            "insediamento: 1 legno + 1 mattone + 1 lana + 1 grano (1)"),
        "catanBuildingRulesFour": MessageLookupByLibrary.simpleMessage(
            "le città sostituiscono gli insediamenti esistenti"),
        "catanBuildingRulesOne": MessageLookupByLibrary.simpleMessage(
            "le strade devono collegarsi alle tue strade, insediamenti o città esistenti"),
        "catanBuildingRulesThree": MessageLookupByLibrary.simpleMessage(
            "gli insediamenti devono collegarsi alla tua rete stradale"),
        "catanBuildingRulesTwo": MessageLookupByLibrary.simpleMessage(
            "gli insediamenti devono essere ad almeno 2 intersezioni di distanza da qualsiasi altro insediamento/città"),
        "catanComponentsEight": MessageLookupByLibrary.simpleMessage(
            "2 carte speciali: strada più lunga, esercito più grande"),
        "catanComponentsFive": MessageLookupByLibrary.simpleMessage(
            "95 carte risorsa (19 ciascuna: legno, mattoni, lana, grano, minerale)"),
        "catanComponentsFour":
            MessageLookupByLibrary.simpleMessage("18 gettoni numerati"),
        "catanComponentsNine":
            MessageLookupByLibrary.simpleMessage("1 brigante, 2 dadi"),
        "catanComponentsOne": MessageLookupByLibrary.simpleMessage(
            "19 tessere terreno (4 foreste, 4 campi di grano, 4 pascoli, 3 montagne, 3 colline, 1 deserto)"),
        "catanComponentsSeven": MessageLookupByLibrary.simpleMessage(
            "pezzi giocatore: 5 insediamenti, 4 città, 15 strade per giocatore"),
        "catanComponentsSix":
            MessageLookupByLibrary.simpleMessage("25 carte sviluppo"),
        "catanComponentsThree":
            MessageLookupByLibrary.simpleMessage("9 pezzi porto"),
        "catanComponentsTwo":
            MessageLookupByLibrary.simpleMessage("6 pezzi cornice mare"),
        "catanDevelopmentCardsFour": MessageLookupByLibrary.simpleMessage(
            "monopolio (2): nomina una risorsa, tutti i giocatori ti danno le loro"),
        "catanDevelopmentCardsOne": MessageLookupByLibrary.simpleMessage(
            "cavaliere (14): muovi il brigante, ruba 1 risorsa dal giocatore adiacente"),
        "catanDevelopmentCardsThree": MessageLookupByLibrary.simpleMessage(
            "costruzione strade (2): costruisci 2 strade gratis"),
        "catanDevelopmentCardsTwo": MessageLookupByLibrary.simpleMessage(
            "punto vittoria (5): vale 1, tieni nascosto fino alla vittoria"),
        "catanGameGoal": MessageLookupByLibrary.simpleMessage(
            "sii il primo giocatore a raggiungere 10 punti vittoria costruendo insediamenti, città, strade e guadagnando carte speciali."),
        "catanGameTurnOne": MessageLookupByLibrary.simpleMessage(
            "tira i dadi: tutti i giocatori con insediamenti/città sulle tessere corrispondenti al numero ricevono risorse"),
        "catanGameTurnThree": MessageLookupByLibrary.simpleMessage(
            "costruzione: spendi risorse per costruire strade, insediamenti, città o comprare carte sviluppo"),
        "catanGameTurnTwo": MessageLookupByLibrary.simpleMessage(
            "commercio: scambia risorse con altri giocatori o usa i porti (4:1 o tariffe speciali)"),
        "catanPreparationFour": MessageLookupByLibrary.simpleMessage(
            "ogni giocatore posiziona 2 insediamenti e 2 strade in ordine inverso di turno"),
        "catanPreparationOne": MessageLookupByLibrary.simpleMessage(
            "assembla il tabellone con le tessere terreno dentro la cornice mare"),
        "catanPreparationThree": MessageLookupByLibrary.simpleMessage(
            "posiziona il brigante sulla tessera deserto"),
        "catanPreparationTwo": MessageLookupByLibrary.simpleMessage(
            "posiziona i gettoni numerati sulle tessere (eccetto il deserto)"),
        "catanResourcesFive":
            MessageLookupByLibrary.simpleMessage("montagne – minerale"),
        "catanResourcesFour":
            MessageLookupByLibrary.simpleMessage("campi – grano"),
        "catanResourcesOne":
            MessageLookupByLibrary.simpleMessage("foresta – legno"),
        "catanResourcesSix":
            MessageLookupByLibrary.simpleMessage("deserto – nessuna risorsa"),
        "catanResourcesThree":
            MessageLookupByLibrary.simpleMessage("pascolo – lana (pecora)"),
        "catanResourcesTwo":
            MessageLookupByLibrary.simpleMessage("colline – mattoni (argilla)"),
        "catanScoringFive": MessageLookupByLibrary.simpleMessage(
            "carte punto vittoria: 1 ciascuna"),
        "catanScoringFour":
            MessageLookupByLibrary.simpleMessage("esercito più grande: 2"),
        "catanScoringOne":
            MessageLookupByLibrary.simpleMessage("insediamento: 1"),
        "catanScoringThree":
            MessageLookupByLibrary.simpleMessage("strada più lunga: 2"),
        "catanScoringTwo": MessageLookupByLibrary.simpleMessage("città: 2"),
        "catanSpecialCards2VpEachOne": MessageLookupByLibrary.simpleMessage(
            "strada più lunga: primo giocatore con 5+ strade continue (può essere rubata)"),
        "catanSpecialCards2VpEachTwo": MessageLookupByLibrary.simpleMessage(
            "esercito più grande: primo giocatore con 3+ carte cavaliere giocate (può essere rubata)"),
        "catanTheRobberRolling7Four": MessageLookupByLibrary.simpleMessage(
            "la tessera bloccata non produce risorse mentre il brigante è lì"),
        "catanTheRobberRolling7One": MessageLookupByLibrary.simpleMessage(
            "qualsiasi giocatore con più di 7 carte deve scartarne metà (arrotondato per difetto)"),
        "catanTheRobberRolling7Three": MessageLookupByLibrary.simpleMessage(
            "ruba 1 risorsa casuale da un giocatore con un insediamento/città su quella tessera"),
        "catanTheRobberRolling7Two": MessageLookupByLibrary.simpleMessage(
            "muovi il brigante su qualsiasi tessera (eccetto il deserto)"),
        "catanTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "catan® è un marchio di catan gmbh."),
        "catanTradingOne": MessageLookupByLibrary.simpleMessage(
            "commercio domestico: negozia qualsiasi scambio con altri giocatori durante il tuo turno"),
        "catanTradingThree": MessageLookupByLibrary.simpleMessage(
            "commercio portuale: 3:1 generico o porti 2:1 per risorsa specifica"),
        "catanTradingTwo": MessageLookupByLibrary.simpleMessage(
            "commercio marittimo: 4:1 con la banca (4 risorse uguali per 1)"),
        "catanVictoryRule": MessageLookupByLibrary.simpleMessage(
            "il primo giocatore a raggiungere 10 punti vittoria durante il suo turno vince la partita. devi annunciare la tua vittoria durante il tuo turno."),
        "changesTheColorAndForcesTheNextPlayerToDrawUnoInfo":
            MessageLookupByLibrary.simpleMessage(
                "cambia il colore e costringe il giocatore successivo a pescare quattro carte."),
        "changesTheDirectionOfPlayUnoInfo":
            MessageLookupByLibrary.simpleMessage(
                "cambia la direzione del gioco."),
        "charactersGenderFemaleInfo": MessageLookupByLibrary.simpleMessage(
            "genere del personaggio: femmina"),
        "charactersGenderMaleInfo": MessageLookupByLibrary.simpleMessage(
            "genere del personaggio: maschio"),
        "checkMyWebsite":
            MessageLookupByLibrary.simpleMessage("visita il mio sito web"),
        "city": MessageLookupByLibrary.simpleMessage("città"),
        "class1": MessageLookupByLibrary.simpleMessage("classe 1"),
        "class2": MessageLookupByLibrary.simpleMessage("classe 2"),
        "clear": MessageLookupByLibrary.simpleMessage("cancella"),
        "clearance": MessageLookupByLibrary.simpleMessage("purificazione"),
        "cleric": MessageLookupByLibrary.simpleMessage("chierico"),
        "close": MessageLookupByLibrary.simpleMessage("chiudi"),
        "collection": MessageLookupByLibrary.simpleMessage("collezione"),
        "collectsFourMermaids": MessageLookupByLibrary.simpleMessage(
            "colleziona 4 sirene e vince!"),
        "colorMajority":
            MessageLookupByLibrary.simpleMessage("maggioranza di colore"),
        "common": MessageLookupByLibrary.simpleMessage("contatore"),
        "confirm": MessageLookupByLibrary.simpleMessage("conferma"),
        "continueGame":
            MessageLookupByLibrary.simpleMessage("continua partita"),
        "continueTitle": MessageLookupByLibrary.simpleMessage("continua"),
        "contractResolution":
            MessageLookupByLibrary.simpleMessage("risoluzione contratto:"),
        "couldNotLaunch":
            MessageLookupByLibrary.simpleMessage("impossibile avviare"),
        "currentBet": MessageLookupByLibrary.simpleMessage("offerta attuale:"),
        "currentCount":
            MessageLookupByLibrary.simpleMessage("conteggio attuale:"),
        "cursed": MessageLookupByLibrary.simpleMessage("maledetto"),
        "custom": MessageLookupByLibrary.simpleMessage("(personalizzato)"),
        "dark": MessageLookupByLibrary.simpleMessage("scuro"),
        "darkSideCardsAreReplacedWithLightOnesAndVice":
            MessageLookupByLibrary.simpleMessage(
                "le carte del lato scuro vengono sostituite da quelle del lato chiaro e viceversa."),
        "developmentCardWorth1VictoryPoint":
            MessageLookupByLibrary.simpleMessage(
                "carta sviluppo del valore di 1 punto vittoria"),
        "developmentCards":
            MessageLookupByLibrary.simpleMessage("carte sviluppo:"),
        "didPlayerReachBid": m0,
        "didYouEnter": MessageLookupByLibrary.simpleMessage("ha raggiunto"),
        "doReturn": MessageLookupByLibrary.simpleMessage("torna"),
        "dontHaveYourFavouriteGameEmailMe":
            MessageLookupByLibrary.simpleMessage(
                "non trovi il tuo gioco preferito? scrivimi!"),
        "dos": MessageLookupByLibrary.simpleMessage("dos"),
        "dosBonus": MessageLookupByLibrary.simpleMessage("bonus:"),
        "dosBonusDoubleColorMatchDrawCard": MessageLookupByLibrary.simpleMessage(
            "doppio abbinamento colore: tutti gli altri giocatori pescano 1 carta."),
        "dosBonusNumberColorMatchAddCard":
            MessageLookupByLibrary.simpleMessage("bonus:"),
        "dosGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
            "gioca tutte le tue carte e segna punti dalle carte rimanenti degli avversari. il primo giocatore a raggiungere 200 punti vince."),
        "dosGameObjectiveTitle":
            MessageLookupByLibrary.simpleMessage("obiettivo:"),
        "dosPreparationCentralRow": MessageLookupByLibrary.simpleMessage(
            "posiziona 2 carte nella \'fila centrale\'"),
        "dosPreparationDealCards": MessageLookupByLibrary.simpleMessage(
            "distribuisci 7 carte a ogni giocatore."),
        "dosPreparationDrawPile": MessageLookupByLibrary.simpleMessage(
            "metti il resto del mazzo accanto come mazzo di pesca."),
        "dosScoring": MessageLookupByLibrary.simpleMessage("punteggio:"),
        "dosScoringNumberCards": MessageLookupByLibrary.simpleMessage(
            "carte numeriche: valore facciale."),
        "dosScoringWildDos":
            MessageLookupByLibrary.simpleMessage("\'jolly dos\': 20 punti."),
        "dosScoringWildNumber":
            MessageLookupByLibrary.simpleMessage("\'jolly #\': 40 punti."),
        "dosSpecialCardWildDos": MessageLookupByLibrary.simpleMessage(
            "\'jolly dos\': sostituisce due carte di qualsiasi colore."),
        "dosSpecialCardWildNumber": MessageLookupByLibrary.simpleMessage(
            "\'jolly #\': sostituisce qualsiasi numero (1-10) del suo colore."),
        "dosSpecialRule":
            MessageLookupByLibrary.simpleMessage("regola speciale:"),
        "dosSpecialRuleDosCall": MessageLookupByLibrary.simpleMessage(
            "quando hai 2 carte rimanenti, grida \'dos!\' se dimentichi e vieni scoperto, pesca 2 carte."),
        "dosTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "dos® è un marchio registrato di mattel."),
        "dosTurnRuleDoubleMatch": MessageLookupByLibrary.simpleMessage(
            "abbinamento doppio: due carte sommate danno il numero di una carta nella fila centrale."),
        "dosTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
            "se non è possibile abbinare, pesca una carta. se corrisponde, puoi giocarla."),
        "dosTurnRuleEndTurn": MessageLookupByLibrary.simpleMessage(
            "alla fine del turno, riempi la fila centrale a 2 carte."),
        "dosTurnRulePickCards": MessageLookupByLibrary.simpleMessage(
            "i giocatori giocano a turno abbinando carte dalla mano alle carte nella fila centrale:"),
        "dosTurnRuleSingleMatch": MessageLookupByLibrary.simpleMessage(
            "abbinamento singolo: una carta corrisponde per numero."),
        "dosVictory200Points": MessageLookupByLibrary.simpleMessage(
            "il primo giocatore a raggiungere 200 punti vince."),
        "doublesTheValueOfALetterScrabbleInfo":
            MessageLookupByLibrary.simpleMessage(
                "raddoppia il valore di una lettera"),
        "doublesTheValueOfAnEntireWordScrabbleInfo":
            MessageLookupByLibrary.simpleMessage(
                "raddoppia il valore di un\'intera parola"),
        "drawFiveUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage("pesca cinque"),
        "drawOneUnoFlipInfo": MessageLookupByLibrary.simpleMessage("pesca una"),
        "drawTwoCardUnoInfo":
            MessageLookupByLibrary.simpleMessage("carta pesca due"),
        "dwarf": MessageLookupByLibrary.simpleMessage("nano"),
        "eachCardHasANumberDeterminingItsValue":
            MessageLookupByLibrary.simpleMessage(
                "ogni carta ha un numero che ne determina il valore."),
        "eachCardHasANumberFrom0To9WhichUnoInfo":
            MessageLookupByLibrary.simpleMessage(
                "ogni carta ha un numero da 0 a 9, che ne determina il valore."),
        "eachCardHasANumberFrom1To9Which": MessageLookupByLibrary.simpleMessage(
            "ogni carta ha un numero da 1 a 9, che ne determina il valore."),
        "edit": MessageLookupByLibrary.simpleMessage("modifica"),
        "elf": MessageLookupByLibrary.simpleMessage("elfo"),
        "emailCopied": MessageLookupByLibrary.simpleMessage("email copiata"),
        "endGameTitle": MessageLookupByLibrary.simpleMessage("fine del gioco:"),
        "english": MessageLookupByLibrary.simpleMessage("inglese"),
        "enterAWord":
            MessageLookupByLibrary.simpleMessage("inserisci una parola"),
        "enterNumberOfCards": MessageLookupByLibrary.simpleMessage(
            "inserisci il numero di carte del tuo colore più comune"),
        "featureRequest":
            MessageLookupByLibrary.simpleMessage("richiedi una funzionalità"),
        "finish": MessageLookupByLibrary.simpleMessage("termina"),
        "firstBonus": MessageLookupByLibrary.simpleMessage("primo bonus"),
        "flipCardUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage("carta flip"),
        "flipSide": MessageLookupByLibrary.simpleMessage("lato flip"),
        "flipsAllCardsToTheOppositeSideUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage(
                "gira tutte le carte sul lato opposto."),
        "followMeOnXTwitter":
            MessageLookupByLibrary.simpleMessage("seguimi su x (twitter)"),
        "french": MessageLookupByLibrary.simpleMessage("francese"),
        "gameGoal":
            MessageLookupByLibrary.simpleMessage("obiettivo del gioco:"),
        "gameOver": MessageLookupByLibrary.simpleMessage("fine partita"),
        "gameTurnTitle":
            MessageLookupByLibrary.simpleMessage("turno di gioco:"),
        "gameUpTo": MessageLookupByLibrary.simpleMessage("partita fino a: "),
        "games": MessageLookupByLibrary.simpleMessage("giochi"),
        "gear": MessageLookupByLibrary.simpleMessage("equipaggiamento"),
        "german": MessageLookupByLibrary.simpleMessage("tedesco"),
        "githubRepository":
            MessageLookupByLibrary.simpleMessage("repository github"),
        "halfBreed": MessageLookupByLibrary.simpleMessage("mezzosangue"),
        "halfling": MessageLookupByLibrary.simpleMessage("halfling"),
        "headGear": MessageLookupByLibrary.simpleMessage("copricapo"),
        "helmet": MessageLookupByLibrary.simpleMessage("elmo"),
        "heyMyNameIsGleb":
            MessageLookupByLibrary.simpleMessage("ciao! mi chiamo gleb"),
        "highestScoreWins":
            MessageLookupByLibrary.simpleMessage("vince il punteggio più alto"),
        "human": MessageLookupByLibrary.simpleMessage("umano"),
        "indicatesAnActiveCurse": MessageLookupByLibrary.simpleMessage(
            "indica una maledizione attiva"),
        "jack": MessageLookupByLibrary.simpleMessage("fante"),
        "jack2Points": MessageLookupByLibrary.simpleMessage("fante: 2 punti"),
        "keepAwakeMode":
            MessageLookupByLibrary.simpleMessage("modalità schermo attivo"),
        "king": MessageLookupByLibrary.simpleMessage("re"),
        "king4Points": MessageLookupByLibrary.simpleMessage("re: 4 punti"),
        "languages": MessageLookupByLibrary.simpleMessage("lingue"),
        "largestArmy":
            MessageLookupByLibrary.simpleMessage("esercito più grande"),
        "leftHand": MessageLookupByLibrary.simpleMessage("mano sinistra"),
        "letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour":
            MessageLookupByLibrary.simpleMessage(
                " ti permette di tenere traccia dei punteggi e dei momenti chiave senza sforzo, mantenendo la concentrazione sul gioco"),
        "level": MessageLookupByLibrary.simpleMessage("livello"),
        "light": MessageLookupByLibrary.simpleMessage("chiaro"),
        "longestRoad": MessageLookupByLibrary.simpleMessage("strada più lunga"),
        "lowestScoreWins": MessageLookupByLibrary.simpleMessage(
            "vince il punteggio più basso"),
        "magic": MessageLookupByLibrary.simpleMessage("magia"),
        "mapGenerator":
            MessageLookupByLibrary.simpleMessage("generatore mappa"),
        "marksADeadCharacterInfo":
            MessageLookupByLibrary.simpleMessage("indica un personaggio morto"),
        "marriage": MessageLookupByLibrary.simpleMessage("matrimonio:"),
        "menu": MessageLookupByLibrary.simpleMessage("menu"),
        "mermaidVictory":
            MessageLookupByLibrary.simpleMessage("vittoria della sirena"),
        "mode": MessageLookupByLibrary.simpleMessage("modalità"),
        "modifiers": MessageLookupByLibrary.simpleMessage("modificatori"),
        "moveHistory": MessageLookupByLibrary.simpleMessage("cronologia mosse"),
        "multiplayer": MessageLookupByLibrary.simpleMessage("multigiocatore"),
        "munchkin": MessageLookupByLibrary.simpleMessage("munchkin"),
        "munchkinCombatCompareLevels": MessageLookupByLibrary.simpleMessage(
            "confronta il livello del tuo personaggio (inclusi i bonus) con il livello del mostro."),
        "munchkinCombatEscapeRules": MessageLookupByLibrary.simpleMessage(
            "se non riesci a vincere, fuggi (tira un dado). un 5 o 6 ha successo. se non riesci a fuggire, segui le conseguenze indicate sulla carta del mostro."),
        "munchkinCombatHelpOrBoost": MessageLookupByLibrary.simpleMessage(
            "se il tuo livello è inferiore, puoi: chiedere aiuto a un altro giocatore (negoziato) o usare carte dalla tua mano per potenziarti."),
        "munchkinCombatTitle": MessageLookupByLibrary.simpleMessage(
            "combattimento (se c\'è un mostro):"),
        "munchkinCombatWinCondition": MessageLookupByLibrary.simpleMessage(
            "se il tuo livello è uguale o superiore, vinci e ottieni tesori e un livello."),
        "munchkinCurseEncounter": MessageLookupByLibrary.simpleMessage(
            "maledizione: applicala immediatamente a te stesso."),
        "munchkinCursesCardType": MessageLookupByLibrary.simpleMessage(
            "maledizioni — ostacolano il tuo personaggio o altri giocatori."),
        "munchkinDeathRules": MessageLookupByLibrary.simpleMessage(
            "morte: perdi tutte le carte tranne il livello e le razze (o classi)."),
        "munchkinEndTurnDiscardRules": MessageLookupByLibrary.simpleMessage(
            "alla fine del turno, scarta le carte in eccesso se ne hai più di 5. dalle al giocatore con il livello più basso."),
        "munchkinEquipmentCardType": MessageLookupByLibrary.simpleMessage(
            "equipaggiamento — fornisce bonus al tuo livello durante il combattimento."),
        "munchkinGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
            "sii il primo a raggiungere il livello 10 combattendo mostri, usando equipaggiamento, maledizioni e carte abilità."),
        "munchkinInitialCardsInstruction": MessageLookupByLibrary.simpleMessage(
            "ogni giocatore prende: 4 carte dal mazzo porta e 4 carte dal mazzo tesoro."),
        "munchkinLevel10Condition": MessageLookupByLibrary.simpleMessage(
            "livello 10: il livello finale può essere raggiunto solo sconfiggendo un mostro."),
        "munchkinMonsterEncounter": MessageLookupByLibrary.simpleMessage(
            "mostro: combattilo (vedi \'combattimento\')."),
        "munchkinMonsterEnhancersCardType":
            MessageLookupByLibrary.simpleMessage(
                "potenziatori mostro — aumentano la forza del mostro."),
        "munchkinMonsterVictoryReward": MessageLookupByLibrary.simpleMessage(
            "vittoria sul mostro: sconfiggere un mostro ti concede un livello e tesori."),
        "munchkinMonstersCardType": MessageLookupByLibrary.simpleMessage(
            "mostri — combattili per salire di livello."),
        "munchkinNoMonsterActionsDescription": MessageLookupByLibrary.simpleMessage(
            "giocare un mostro dalla mano per combatterlo (opzionale) o \'cercare guai\' (pescare una carta dal mazzo porta)."),
        "munchkinNoMonsterActionsTitle": MessageLookupByLibrary.simpleMessage(
            "se non c\'è un mostro, il giocatore può:"),
        "munchkinOneTimeItemsCardType": MessageLookupByLibrary.simpleMessage(
            "oggetti monouso — usati in combattimento o per altri effetti."),
        "munchkinOtherCardEncounter": MessageLookupByLibrary.simpleMessage(
            "qualsiasi altra carta: tienila in mano."),
        "munchkinShuffleCardsInstruction": MessageLookupByLibrary.simpleMessage(
            "mescola le carte porta e tesoro e dividile in due mazzi separati."),
        "munchkinStartingGearInstruction": MessageLookupByLibrary.simpleMessage(
            "i giocatori posizionano le loro carte equipaggiamento iniziale sul tavolo, se ne hanno."),
        "munchkinTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "munchkin® è un marchio registrato di steve jackson games."),
        "munchkinTurnDescription": MessageLookupByLibrary.simpleMessage(
            "il giocatore pesca la carta in cima al mazzo porta. possibili esiti:"),
        "munchkinVictoryCondition": MessageLookupByLibrary.simpleMessage(
            "il primo giocatore a raggiungere il livello 10 vince!"),
        "myOtherApps": MessageLookupByLibrary.simpleMessage("le mie altre app"),
        "nWord": MessageLookupByLibrary.simpleMessage("\nparola"),
        "name": MessageLookupByLibrary.simpleMessage("nome"),
        "newGame": MessageLookupByLibrary.simpleMessage("nuova partita"),
        "newGameWithSamePlayers":
            MessageLookupByLibrary.simpleMessage("altra mano"),
        "nextPlayerDraws1CardAndSkipsTurnUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage(
                "il giocatore successivo pesca 1 carta e salta il turno."),
        "nextPlayerDraws5CardsAndSkipsTurnUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage(
                "il giocatore successivo pesca 5 carte e salta il turno."),
        "nextPlayerDrawsTwoCardsAndLosesTheirTurnUnoInfo":
            MessageLookupByLibrary.simpleMessage(
                "il giocatore successivo pesca due carte e perde il turno."),
        "nextPlayerDrawsUntilTheyGetTheChosenColorUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage(
                "il giocatore successivo pesca fino a ottenere il colore scelto."),
        "nine0Points": MessageLookupByLibrary.simpleMessage("nove: 0 punti"),
        "no": MessageLookupByLibrary.simpleMessage("no"),
        "noClass": MessageLookupByLibrary.simpleMessage("senza classe"),
        "noItem": MessageLookupByLibrary.simpleMessage("nessun oggetto"),
        "numberButtons":
            MessageLookupByLibrary.simpleMessage("pulsanti numerici"),
        "numberButtonsDescription": MessageLookupByLibrary.simpleMessage(
            "usa per le carte base (granchio, barca, pesce, squalo, nuotatore, marinaio, capitano, faro) e le loro combinazioni. premi il pulsante corrispondente al tuo punteggio totale."),
        "numberCards": MessageLookupByLibrary.simpleMessage("carte numeriche"),
        "off": MessageLookupByLibrary.simpleMessage("disattivo"),
        "on": MessageLookupByLibrary.simpleMessage("attivo"),
        "options": MessageLookupByLibrary.simpleMessage("opzioni"),
        "others": MessageLookupByLibrary.simpleMessage("altro"),
        "pass": MessageLookupByLibrary.simpleMessage("passa"),
        "play": MessageLookupByLibrary.simpleMessage("gioca"),
        "playerName": MessageLookupByLibrary.simpleMessage("nome giocatore"),
        "playerOnBarrel":
            MessageLookupByLibrary.simpleMessage("giocatore sul barile:"),
        "players": MessageLookupByLibrary.simpleMessage("giocatori"),
        "playersOnBarrel":
            MessageLookupByLibrary.simpleMessage("giocatori sul barile:"),
        "points": MessageLookupByLibrary.simpleMessage("punti"),
        "pointsConfirmed":
            MessageLookupByLibrary.simpleMessage("punti confermati"),
        "pointsCount": m1,
        "possiblyTheRemovalOfCursesOrDebuffs":
            MessageLookupByLibrary.simpleMessage(
                "possibilmente la rimozione di maledizioni o debuff"),
        "preparation": MessageLookupByLibrary.simpleMessage("preparazione:"),
        "projectWebsite":
            MessageLookupByLibrary.simpleMessage("sito web del progetto"),
        "queen": MessageLookupByLibrary.simpleMessage("donna"),
        "queen3Points": MessageLookupByLibrary.simpleMessage("donna: 3 punti"),
        "race1": MessageLookupByLibrary.simpleMessage("razza 1"),
        "rateTheApp": MessageLookupByLibrary.simpleMessage("valuta l\'app"),
        "reportABug": MessageLookupByLibrary.simpleMessage("segnala un bug"),
        "resources": MessageLookupByLibrary.simpleMessage("risorse:"),
        "results": MessageLookupByLibrary.simpleMessage("risultati"),
        "returnToMenu": MessageLookupByLibrary.simpleMessage("torna al menu"),
        "reverseCardUnoInfo":
            MessageLookupByLibrary.simpleMessage("carta inverti"),
        "rightHand": MessageLookupByLibrary.simpleMessage("mano destra"),
        "rollDiceLocale": MessageLookupByLibrary.simpleMessage("tira i dadi"),
        "round": MessageLookupByLibrary.simpleMessage("round"),
        "rules": MessageLookupByLibrary.simpleMessage("regole"),
        "russian": MessageLookupByLibrary.simpleMessage("russo"),
        "score": MessageLookupByLibrary.simpleMessage("punteggio"),
        "score50ExtraPointsForUsingAll7Tiles":
            MessageLookupByLibrary.simpleMessage(
                "ottieni 50 punti extra per aver usato tutte e 7 le tessere"),
        "scrabble": MessageLookupByLibrary.simpleMessage("scrabble"),
        "scrabbleAdditionalDisputedWords": MessageLookupByLibrary.simpleMessage(
            "le parole contestate vengono verificate in un dizionario concordato."),
        "scrabbleAdditionalPointsTitle":
            MessageLookupByLibrary.simpleMessage("regole aggiuntive:"),
        "scrabbleAdditionalReplaceTiles": MessageLookupByLibrary.simpleMessage(
            "i giocatori possono scambiare tessere e passare il turno."),
        "scrabbleAdditionalWordRules": MessageLookupByLibrary.simpleMessage(
            "tutte le parole devono essere complete e rispettare le regole della lingua."),
        "scrabbleEndGameNoTiles": MessageLookupByLibrary.simpleMessage(
            "il gioco termina quando non ci sono più tessere e non è possibile fare mosse."),
        "scrabbleEndGameRemainingTilesPenalty":
            MessageLookupByLibrary.simpleMessage(
                "le tessere non giocate vengono sottratte dal punteggio del giocatore."),
        "scrabbleEndGameSkippedTurns": MessageLookupByLibrary.simpleMessage(
            "il gioco termina se tutti i giocatori passano il turno due volte."),
        "scrabbleFeatureBlankTile": MessageLookupByLibrary.simpleMessage(
            "le tessere jolly possono rappresentare qualsiasi lettera ma non danno punti."),
        "scrabbleFeatureRefillTiles": MessageLookupByLibrary.simpleMessage(
            "i giocatori pescano tessere dopo ogni turno per riempire il leggio a 7."),
        "scrabbleFeatureSevenTileBonus": MessageLookupByLibrary.simpleMessage(
            "usare tutte e 7 le tessere in un turno fa guadagnare un bonus di 50 punti."),
        "scrabbleFeaturesTitle":
            MessageLookupByLibrary.simpleMessage("caratteristiche:"),
        "scrabbleGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
            "forma parole sulla plancia in stile cruciverba. ottieni più punti dei tuoi avversari."),
        "scrabbleGameSetAccessories": MessageLookupByLibrary.simpleMessage(
            "4 leggii, sacchetto per tessere."),
        "scrabbleGameSetBoard":
            MessageLookupByLibrary.simpleMessage("plancia 15x15."),
        "scrabbleGameSetLetters": MessageLookupByLibrary.simpleMessage(
            "104 tessere (incluse 2 jolly)."),
        "scrabbleGameSetTitle":
            MessageLookupByLibrary.simpleMessage("set di gioco:"),
        "scrabblePreparationDrawTiles": MessageLookupByLibrary.simpleMessage(
            "ogni giocatore pesca 7 tessere."),
        "scrabblePreparationFirstTurnRule": MessageLookupByLibrary.simpleMessage(
            "il primo turno va al giocatore la cui tessera pescata casualmente è più vicina all\'inizio dell\'alfabeto."),
        "scrabblePreparationShuffle": MessageLookupByLibrary.simpleMessage(
            "mescola le tessere nel sacchetto."),
        "scrabbleScoringBlueBonus": MessageLookupByLibrary.simpleMessage(
            "le caselle blu raddoppiano/triplicano il punteggio della lettera."),
        "scrabbleScoringRedBonus": MessageLookupByLibrary.simpleMessage(
            "le caselle rosse raddoppiano/triplicano il punteggio della parola."),
        "scrabbleScoringTitle":
            MessageLookupByLibrary.simpleMessage("punteggio:"),
        "scrabbleScoringWordPoints": MessageLookupByLibrary.simpleMessage(
            "punti per una parola: somma dei punti delle tessere + bonus delle caselle della plancia."),
        "scrabbleTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "scrabble® è un marchio registrato di hasbro, inc."),
        "scrabbleTurnRuleFirstWord": MessageLookupByLibrary.simpleMessage(
            "prima parola: deve passare per la casella centrale (stella)."),
        "scrabbleTurnRuleLetterPlacement": MessageLookupByLibrary.simpleMessage(
            "ogni nuova tessera deve formare parte di una parola nuova o esistente."),
        "scrabbleTurnRuleWordDirection": MessageLookupByLibrary.simpleMessage(
            "tutte le parole devono essere posizionate orizzontalmente o verticalmente."),
        "scrabbleTurnRulesTitle":
            MessageLookupByLibrary.simpleMessage("regole del turno:"),
        "seaSaltPaper":
            MessageLookupByLibrary.simpleMessage("sea salt & paper"),
        "seaSaltPaperDuoBoat": MessageLookupByLibrary.simpleMessage(
            "duo barche: fai immediatamente un altro turno."),
        "seaSaltPaperDuoCardsDescription": MessageLookupByLibrary.simpleMessage(
            "dopo la tua azione, puoi giocare coppie per attivare effetti speciali:"),
        "seaSaltPaperDuoCardsTitle":
            MessageLookupByLibrary.simpleMessage("carte duo:"),
        "seaSaltPaperDuoCrab": MessageLookupByLibrary.simpleMessage(
            "duo granchi: guarda una pila degli scarti e prendi qualsiasi carta."),
        "seaSaltPaperDuoFish": MessageLookupByLibrary.simpleMessage(
            "duo pesci: pesca la carta in cima al mazzo."),
        "seaSaltPaperDuoShark": MessageLookupByLibrary.simpleMessage(
            "duo squalo + nuotatore: ruba una carta dalla mano di un avversario."),
        "seaSaltPaperEndRoundDescription": MessageLookupByLibrary.simpleMessage(
            "quando hai 7 o più punti, puoi terminare il round scegliendo:"),
        "seaSaltPaperEndRoundTitle":
            MessageLookupByLibrary.simpleMessage("fine del round:"),
        "seaSaltPaperGameObjectiveDescription":
            MessageLookupByLibrary.simpleMessage(
                "colleziona carte per formare combinazioni e segnare punti. sii il primo a raggiungere il punteggio obiettivo terminando i round strategicamente."),
        "seaSaltPaperLastChanceOption": MessageLookupByLibrary.simpleMessage(
            "ultima chance: ogni avversario fa un altro turno. se hai ancora il punteggio più alto, guadagni punti bonus pari alla tua maggioranza di colore. se qualcuno ti supera, ottieni solo i punti della maggioranza di colore."),
        "seaSaltPaperPreparationDiscard": MessageLookupByLibrary.simpleMessage(
            "gira due carte a faccia in su accanto al mazzo per formare due pile degli scarti."),
        "seaSaltPaperPreparationShuffle": MessageLookupByLibrary.simpleMessage(
            "mescola tutte le carte e posiziona il mazzo a faccia in giù al centro."),
        "seaSaltPaperPreparationStartPlayer":
            MessageLookupByLibrary.simpleMessage(
                "scegli un giocatore iniziale."),
        "seaSaltPaperScoringCollections": MessageLookupByLibrary.simpleMessage(
            "le collezioni (conchiglie, pinguini, polpi) danno più punti con più carte."),
        "seaSaltPaperScoringColorMajority": MessageLookupByLibrary.simpleMessage(
            "maggioranza di colore: 1 punto bonus per carta del tuo colore più comune."),
        "seaSaltPaperScoringMermaid": MessageLookupByLibrary.simpleMessage(
            "sirena: collezionare tutte e 4 le carte sirena fa vincere la partita istantaneamente!"),
        "seaSaltPaperScoringPairs": MessageLookupByLibrary.simpleMessage(
            "le coppie e le combinazioni danno punti in base al tipo."),
        "seaSaltPaperScoringTitle":
            MessageLookupByLibrary.simpleMessage("punteggio:"),
        "seaSaltPaperStopOption": MessageLookupByLibrary.simpleMessage(
            "stop: il round termina immediatamente. tutti i giocatori contano le loro carte."),
        "seaSaltPaperTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "sea salt & paper® è un marchio di studio bombyx. progettato da bruno cathala e théo rivière."),
        "seaSaltPaperTurnDescription": MessageLookupByLibrary.simpleMessage(
            "nel tuo turno, scegli una delle due azioni:"),
        "seaSaltPaperTurnDrawTwo": MessageLookupByLibrary.simpleMessage(
            "pesca due carte dal mazzo, tienine una e metti l\'altra a faccia in su su una pila degli scarti."),
        "seaSaltPaperTurnTakeDiscard": MessageLookupByLibrary.simpleMessage(
            "prendi la carta in cima a una delle pile degli scarti."),
        "seaSaltPaperVictory2Players": MessageLookupByLibrary.simpleMessage(
            "2 giocatori: il primo a 40 punti vince."),
        "seaSaltPaperVictory3Players": MessageLookupByLibrary.simpleMessage(
            "3 giocatori: il primo a 35 punti vince."),
        "seaSaltPaperVictory4Players": MessageLookupByLibrary.simpleMessage(
            "4 giocatori: il primo a 30 punti vince."),
        "secondBonus": MessageLookupByLibrary.simpleMessage("secondo bonus"),
        "secondRace": MessageLookupByLibrary.simpleMessage("razza 2"),
        "set": MessageLookupByLibrary.simpleMessage("set"),
        "setCardAttributeFillType": MessageLookupByLibrary.simpleMessage(
            "tipo di riempimento: vuoto, rigato, pieno."),
        "setCardAttributeNumberOfSymbols": MessageLookupByLibrary.simpleMessage(
            "numero di simboli: 1, 2 o 3."),
        "setCardAttributeSymbolColor": MessageLookupByLibrary.simpleMessage(
            "colore del simbolo: rosso, verde, viola."),
        "setCardAttributeSymbolType": MessageLookupByLibrary.simpleMessage(
            "tipo di simbolo: ovale, rombo, onda."),
        "setCardAttributesDescription": MessageLookupByLibrary.simpleMessage(
            "ogni carta è unica e ha 4 attributi:"),
        "setCardAttributesTitle":
            MessageLookupByLibrary.simpleMessage("attributi delle carte:"),
        "setExampleOfValidSetColor": MessageLookupByLibrary.simpleMessage(
            "attributo \'numero\': uguale (due)."),
        "setExampleOfValidSetFill": MessageLookupByLibrary.simpleMessage(
            "cosa fare se non si trova un set:"),
        "setExampleOfValidSetNumber": MessageLookupByLibrary.simpleMessage(
            "attributo \'tipo\': diverso (ovale, rombo, onda)."),
        "setExampleOfValidSetTitle": MessageLookupByLibrary.simpleMessage(
            "attributo \'colore\': diverso (rosso, verde, viola)."),
        "setExampleOfValidSetType": MessageLookupByLibrary.simpleMessage(
            "attributo \'riempimento\': uguale (rigato)."),
        "setGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
            "trova un set (un gruppo di 3 carte) dove ogni attributo è identico su tutte le carte o diverso su tutte le carte."),
        "setGameTurnStepContinue":
            MessageLookupByLibrary.simpleMessage("esempio di un set valido:"),
        "setGameTurnStepDealerSetup": MessageLookupByLibrary.simpleMessage(
            "il mazziere dispone 12 carte."),
        "setGameTurnStepFindingSet": MessageLookupByLibrary.simpleMessage(
            "i giocatori cercano simultaneamente un set. il primo che ne trova uno esclama: \'set!\'"),
        "setGameTurnStepFour":
            MessageLookupByLibrary.simpleMessage("il gioco continua."),
        "setGameTurnStepValidation": MessageLookupByLibrary.simpleMessage(
            "verifica la correttezza: se corretto, il giocatore prende le carte e il mazziere le sostituisce con 3 nuove. se sbagliato, il giocatore perde 1 punto o salta un turno (come concordato)."),
        "setImportantRuleCardPosition": MessageLookupByLibrary.simpleMessage(
            "le carte che formano un set possono essere disposte in qualsiasi ordine."),
        "setImportantRuleConfirmation": MessageLookupByLibrary.simpleMessage(
            "un nuovo set non può essere dichiarato finché il precedente non è confermato."),
        "setImportantRuleSimplifiedMode": MessageLookupByLibrary.simpleMessage(
            "per imparare, il gioco può essere semplificato usando solo 3 attributi."),
        "setImportantRulesTitle":
            MessageLookupByLibrary.simpleMessage("regole importanti:"),
        "setNoSetFoundDescription": MessageLookupByLibrary.simpleMessage(
            "se non esiste un set tra le 12 carte, il mazziere aggiunge 3 carte (fino a un massimo di 21 carte). tra 21 carte, un set esiste sempre."),
        "setNoSetFoundTitle": MessageLookupByLibrary.simpleMessage(
            "cosa fare se non si trova un set:"),
        "setScoringGameEnd": MessageLookupByLibrary.simpleMessage(
            "il gioco termina quando il mazzo finisce o si raggiunge un totale di punti prestabilito."),
        "setScoringPointPerSet":
            MessageLookupByLibrary.simpleMessage("1 punto per set trovato."),
        "setScoringTitle": MessageLookupByLibrary.simpleMessage("punteggio:"),
        "setTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "set® è un marchio registrato di set enterprises, inc."),
        "settings": MessageLookupByLibrary.simpleMessage("impostazioni"),
        "settlement": MessageLookupByLibrary.simpleMessage("insediamento"),
        "shareFeedback":
            MessageLookupByLibrary.simpleMessage("condividi feedback"),
        "shareWithFriedns":
            MessageLookupByLibrary.simpleMessage("condividi con gli amici"),
        "shareWithFriends":
            MessageLookupByLibrary.simpleMessage("condividi con gli amici"),
        "sinceThisIsAnOpenSourceProjectYouCanLeave":
            MessageLookupByLibrary.simpleMessage(
                "trattandosi di un progetto open-source, sentiti libero di contribuire"),
        "singleplayer":
            MessageLookupByLibrary.simpleMessage("giocatore singolo"),
        "skip": MessageLookupByLibrary.simpleMessage("passa"),
        "skipCardUnoInfo": MessageLookupByLibrary.simpleMessage("carta salta"),
        "skipEveryoneCardUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage("carta salta tutti"),
        "skipsAllPlayersAndReturnsTurnToTheOriginalPlayerUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage(
                "salta tutti i giocatori e restituisce il turno al giocatore originale."),
        "skipsTheNextPlayersTurnUnoInfo": MessageLookupByLibrary.simpleMessage(
            "salta il turno del giocatore successivo."),
        "spanish": MessageLookupByLibrary.simpleMessage("spagnolo"),
        "specialCards2VpEach": MessageLookupByLibrary.simpleMessage(
            "carte speciali (2 PV ciascuna):"),
        "specialCardsTitle":
            MessageLookupByLibrary.simpleMessage("carte speciali:"),
        "specialRulesTitle":
            MessageLookupByLibrary.simpleMessage("regole speciali:"),
        "subtracting": MessageLookupByLibrary.simpleMessage("sottrazione"),
        "superMunch": MessageLookupByLibrary.simpleMessage("super munch."),
        "swapHandsWithAnyPlayerAndChooseTheColorUnoInfo":
            MessageLookupByLibrary.simpleMessage(
                "scambia le mani con qualsiasi giocatore e scegli il colore."),
        "sword": MessageLookupByLibrary.simpleMessage("spada"),
        "telegram": MessageLookupByLibrary.simpleMessage("telegram"),
        "ten10Points": MessageLookupByLibrary.simpleMessage("dieci: 10 punti"),
        "theNumberOfPlayersShouldBe": MessageLookupByLibrary.simpleMessage(
            "il numero di giocatori deve essere"),
        "theRobberRolling7":
            MessageLookupByLibrary.simpleMessage("il brigante (tirando 7):"),
        "theme": MessageLookupByLibrary.simpleMessage("tema"),
        "thief": MessageLookupByLibrary.simpleMessage("ladro"),
        "thousandBiddingPhaseOne": MessageLookupByLibrary.simpleMessage(
            "partendo dal giocatore dopo il mazziere, i giocatori offrono quanti punti pensano di poter segnare (offerta minima 100). ogni offerta deve essere superiore alla precedente (con incrementi di 5 o 10)."),
        "thousandBiddingPhaseThree": MessageLookupByLibrary.simpleMessage(
            "il giocatore con l\'offerta più alta vince l\'asta, prende il tallone e dichiara l\'atout. l\'offerente scarta 3 carte coperte (ma mantiene il loro valore in punti)."),
        "thousandBiddingPhaseTwo": MessageLookupByLibrary.simpleMessage(
            "i giocatori possono passare se non vogliono offrire di più."),
        "thousandContractResolutionOne": MessageLookupByLibrary.simpleMessage(
            "se l\'offerente segna almeno l\'importo della sua offerta: aggiunge il punteggio effettivo al suo totale."),
        "thousandContractResolutionThree": MessageLookupByLibrary.simpleMessage(
            "gli altri giocatori aggiungono i punti delle prese vinte ai loro totali."),
        "thousandContractResolutionTwo": MessageLookupByLibrary.simpleMessage(
            "se l\'offerente non raggiunge la sua offerta: l\'importo dell\'offerta viene sottratto dal suo totale (può andare in negativo)."),
        "thousandGameTurnTitleOne": MessageLookupByLibrary.simpleMessage(
            "l\'offerente guida la prima presa giocando qualsiasi carta. gli altri giocatori devono seguire il seme se possibile. se non possono, devono giocare un atout se ne hanno uno."),
        "thousandGameTurnTitleThree": MessageLookupByLibrary.simpleMessage(
            "il vincitore della presa guida la presa successiva. continua finché tutte le carte sono giocate."),
        "thousandGameTurnTitleTwo": MessageLookupByLibrary.simpleMessage(
            "la carta più alta del seme guidato vince, a meno che non venga giocato un atout. l\'atout più alto vince."),
        "thousandGoal": MessageLookupByLibrary.simpleMessage(
            "l\'obiettivo è essere il primo giocatore a raggiungere 1000 punti vincendo prese in un gioco di offerte. i giocatori offrono quanti punti pensano di poter segnare, poi cercano di rispettare il contratto."),
        "thousandMarriageFour": MessageLookupByLibrary.simpleMessage(
            "puoi segnare matrimoni solo se vinci almeno una presa."),
        "thousandMarriageOne": MessageLookupByLibrary.simpleMessage(
            "un matrimonio è un re e una donna dello stesso seme nella tua mano."),
        "thousandMarriageThree": MessageLookupByLibrary.simpleMessage(
            "matrimonio non di atout: 80 punti (stessa regola)."),
        "thousandMarriageTwo": MessageLookupByLibrary.simpleMessage(
            "matrimonio di atout: 100 punti (deve essere dichiarato giocando la prima carta della coppia)."),
        "thousandPreparationOne": MessageLookupByLibrary.simpleMessage(
            "usa un mazzo di 24 carte: 9, 10, fante, donna, re, asso di tutti e quattro i semi."),
        "thousandPreparationThree": MessageLookupByLibrary.simpleMessage(
            "posiziona 3 carte coperte al centro come tallone (vedova)."),
        "thousandPreparationTwo": MessageLookupByLibrary.simpleMessage(
            "distribuisci 7 carte a ogni giocatore (per 3 giocatori), o 8 carte (per 2 giocatori)."),
        "thousandSpecialRulesTitleOne": MessageLookupByLibrary.simpleMessage(
            "regola del barile: se un giocatore raggiunge 880+ punti, è \'sul barile\' e deve segnare esattamente 1000, altrimenti torna a 880."),
        "thousandSpecialRulesTitleTwo": MessageLookupByLibrary.simpleMessage(
            "alcune varianti richiedono esattamente 1000 punti per vincere. superare riporta a 880 o al punteggio precedente."),
        "thousandTotalPoints": MessageLookupByLibrary.simpleMessage(
            "punti totali nel mazzo: 120. aggiungi i bonus matrimonio se applicabile."),
        "thousandVictoryRule": MessageLookupByLibrary.simpleMessage(
            "il primo giocatore a raggiungere 1000 punti (o esattamente 1000, a seconda delle regole della casa) vince la partita."),
        "toAllWhoCreatedThe": MessageLookupByLibrary.simpleMessage(
            "grazie a tutti coloro che hanno creato"),
        "toBoardBuddysContributors": MessageLookupByLibrary.simpleMessage(
            "i contributori di board buddy"),
        "total": MessageLookupByLibrary.simpleMessage("totale"),
        "totalStrength": MessageLookupByLibrary.simpleMessage("forza totale: "),
        "trading": MessageLookupByLibrary.simpleMessage("commercio:"),
        "tripleTheValueOfALetterScrabbleInfo":
            MessageLookupByLibrary.simpleMessage(
                "triplica il valore di una lettera"),
        "tripleTheValueOfAnEntireWordScrabbleInfo":
            MessageLookupByLibrary.simpleMessage(
                "triplica il valore di un\'intera parola"),
        "twoHanded": MessageLookupByLibrary.simpleMessage("due mani"),
        "uno": MessageLookupByLibrary.simpleMessage("uno"),
        "unoActiveCardDrawTwo": MessageLookupByLibrary.simpleMessage(
            "\'pesca due\': il giocatore successivo pesca 2 carte e perde il turno."),
        "unoActiveCardReverse": MessageLookupByLibrary.simpleMessage(
            "\'inverti\': inverte la direzione del gioco."),
        "unoActiveCardSkipTurn": MessageLookupByLibrary.simpleMessage(
            "\'salta\': il giocatore successivo perde il turno."),
        "unoActiveCardWild": MessageLookupByLibrary.simpleMessage(
            "\'jolly\': permette di scegliere il colore di gioco."),
        "unoActiveCardWildDrawFour": MessageLookupByLibrary.simpleMessage(
            "\'jolly pesca quattro\': scegli il colore e il giocatore successivo pesca 4 carte. puoi giocarla solo se non hai carte corrispondenti."),
        "unoActiveCardsTitle":
            MessageLookupByLibrary.simpleMessage("carte azione:"),
        "unoFlip": MessageLookupByLibrary.simpleMessage("uno flip"),
        "unoFlipDarkSideCardsTitle":
            MessageLookupByLibrary.simpleMessage("lato scuro:"),
        "unoFlipDarkSideDrawFive":
            MessageLookupByLibrary.simpleMessage("\'pesca cinque\'"),
        "unoFlipDarkSideDrawUntilColor": MessageLookupByLibrary.simpleMessage(
            "\'pesca fino al colore corrispondente\'"),
        "unoFlipDarkSideReverse":
            MessageLookupByLibrary.simpleMessage("\'inverti\'"),
        "unoFlipDarkSideSkipAll":
            MessageLookupByLibrary.simpleMessage("\'salta tutti\'"),
        "unoFlipDarkSideWildCard":
            MessageLookupByLibrary.simpleMessage("\'jolly\'"),
        "unoFlipGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
            "gioca tutte le tue carte e segna punti dalle carte rimanenti degli avversari. il primo giocatore a raggiungere 500 punti vince."),
        "unoFlipGameStartDealCards": MessageLookupByLibrary.simpleMessage(
            "ogni giocatore riceve 7 carte."),
        "unoFlipGameStartLightSide": MessageLookupByLibrary.simpleMessage(
            "inizia il gioco dal lato chiaro del mazzo."),
        "unoFlipGameStartTitle":
            MessageLookupByLibrary.simpleMessage("inizio del gioco:"),
        "unoFlipKeyMoment":
            MessageLookupByLibrary.simpleMessage("momenti chiave:"),
        "unoFlipKeyMomentFlipCardEffect": MessageLookupByLibrary.simpleMessage(
            "dopo una carta \'flip\', l\'intero gioco cambia lato."),
        "unoFlipKeyMomentUnoCall": MessageLookupByLibrary.simpleMessage(
            "quando giochi la penultima carta, grida \'uno!\' se dimentichi e vieni scoperto, pesca 2 carte."),
        "unoFlipLightSideCardsTitle":
            MessageLookupByLibrary.simpleMessage("lato chiaro:"),
        "unoFlipLightSideDrawOne":
            MessageLookupByLibrary.simpleMessage("\'pesca una\'"),
        "unoFlipLightSideReverse":
            MessageLookupByLibrary.simpleMessage("\'inverti\'"),
        "unoFlipLightSideSkipTurn":
            MessageLookupByLibrary.simpleMessage("\'salta turno\'"),
        "unoFlipLightSideWildCard":
            MessageLookupByLibrary.simpleMessage("\'jolly\'"),
        "unoFlipLightSideWildDrawTwo":
            MessageLookupByLibrary.simpleMessage("\'jolly pesca due\'"),
        "unoFlipScoringActiveCards": MessageLookupByLibrary.simpleMessage(
            "carte azione: 20-60 punti a seconda del tipo."),
        "unoFlipScoringNumberCards": MessageLookupByLibrary.simpleMessage(
            "carte numeriche: valore facciale."),
        "unoFlipScoringRoundWinnerPoints": MessageLookupByLibrary.simpleMessage(
            "il vincitore del round segna punti per le carte rimanenti degli avversari:"),
        "unoFlipScoringTitle":
            MessageLookupByLibrary.simpleMessage("punteggio:"),
        "unoFlipTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "uno flip® è un marchio registrato di mattel."),
        "unoFlipTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
            "se non hai una carta corrispondente, pesca dal mazzo."),
        "unoFlipTurnRuleFlipCard": MessageLookupByLibrary.simpleMessage(
            "la carta \'flip\' cambia il gioco all\'altro lato del mazzo."),
        "unoFlipTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
            "gioca una carta che corrisponde alla carta in cima per colore, numero o simbolo."),
        "unoFlipVictory500Points": MessageLookupByLibrary.simpleMessage(
            "il primo giocatore a raggiungere 500 punti vince."),
        "unoFlipVictoryLowestScoreAlternative":
            MessageLookupByLibrary.simpleMessage(
                "alternativa: il giocatore con il punteggio più basso vince alla fine della partita."),
        "unoGameObjectiveDescription": MessageLookupByLibrary.simpleMessage(
            "sii il primo a giocare tutte le tue carte e segna punti dalle carte rimanenti degli avversari. il primo giocatore a raggiungere 500 punti vince."),
        "unoGameTurnTitle": MessageLookupByLibrary.simpleMessage(
            "i giocatori giocano a turno una carta che corrisponde alla carta in cima per colore, numero o simbolo."),
        "unoPreparationDeckInCenter": MessageLookupByLibrary.simpleMessage(
            "posiziona il mazzo rimanente al centro come mazzo di pesca."),
        "unoPreparationDistributeCards": MessageLookupByLibrary.simpleMessage(
            "distribuisci 7 carte a ogni giocatore."),
        "unoPreparationFlipFirstCard": MessageLookupByLibrary.simpleMessage(
            "gira la carta in cima per iniziare la pila degli scarti."),
        "unoScoring20PointsCards": MessageLookupByLibrary.simpleMessage(
            "\'salta\', \'pesca due\', \'inverti\': 20 punti."),
        "unoScoring40PointsCards": MessageLookupByLibrary.simpleMessage(
            "\'scambia mani\', \'carta bianca\': 40 punti."),
        "unoScoring50PointsCards": MessageLookupByLibrary.simpleMessage(
            "\'jolly\', \'jolly pesca quattro\': 50 punti."),
        "unoScoringNumberCards": MessageLookupByLibrary.simpleMessage(
            "carte numeriche: valore facciale."),
        "unoScoringTitle": MessageLookupByLibrary.simpleMessage("punteggio:"),
        "unoSpecialCardBlank": MessageLookupByLibrary.simpleMessage(
            "\'carta bianca\': crea una regola prima di iniziare la partita."),
        "unoSpecialCardSwap": MessageLookupByLibrary.simpleMessage(
            "\'scambia mani\': scambia le mani con qualsiasi giocatore e scegli il colore."),
        "unoSpecialRuleReshuffle": MessageLookupByLibrary.simpleMessage(
            "se il mazzo di pesca è vuoto, rimescola la pila degli scarti."),
        "unoSpecialRuleUnoCall": MessageLookupByLibrary.simpleMessage(
            "dimenticato di dire \'uno\'? pesca 2 carte se vieni scoperto prima del turno del giocatore successivo."),
        "unoTrademarkNotice": MessageLookupByLibrary.simpleMessage(
            "uno® è un marchio registrato di mattel."),
        "unoTurnRuleDrawCard": MessageLookupByLibrary.simpleMessage(
            "se non puoi giocare, pesca una carta. se è giocabile, puoi giocarla immediatamente."),
        "unoTurnRuleMatchCard": MessageLookupByLibrary.simpleMessage(
            "i giocatori giocano a turno una carta che corrisponde alla carta in cima per colore, numero o simbolo."),
        "unoTurnRuleOptionalDraw": MessageLookupByLibrary.simpleMessage(
            "i giocatori possono pescare una carta anche se ne hanno una giocabile, ma non possono giocarla nello stesso turno."),
        "unoVictory500Points": MessageLookupByLibrary.simpleMessage(
            "il primo giocatore a raggiungere 500 punti vince."),
        "unoVictoryLowestScoreAlternative": MessageLookupByLibrary.simpleMessage(
            "alternativa: il giocatore con il punteggio più basso vince alla fine della partita."),
        "upgradeASettlementToACity1Point": MessageLookupByLibrary.simpleMessage(
            "potenzia un insediamento a città (+1 punto)"),
        "victoryPointCard":
            MessageLookupByLibrary.simpleMessage("carta punto vittoria"),
        "victoryTitle": MessageLookupByLibrary.simpleMessage("vittoria:"),
        "warrior": MessageLookupByLibrary.simpleMessage("guerriero"),
        "whoGoesFirst":
            MessageLookupByLibrary.simpleMessage("chi distribuisce per primo?"),
        "wildCardOneDosInfo":
            MessageLookupByLibrary.simpleMessage("carta jolly #"),
        "wildCardUnoInfo": MessageLookupByLibrary.simpleMessage("carta jolly"),
        "wildDrawColorUnoFlipInfo":
            MessageLookupByLibrary.simpleMessage("jolly pesca colore"),
        "wildDrawFourCardUnoInfo":
            MessageLookupByLibrary.simpleMessage("carta jolly pesca quattro"),
        "wildDrawTwoCardDosInfo":
            MessageLookupByLibrary.simpleMessage("carta jolly pesca due"),
        "wildShuffleHandsCardUnoInfo":
            MessageLookupByLibrary.simpleMessage("carta jolly scambia mani"),
        "winner": MessageLookupByLibrary.simpleMessage("vincitore: "),
        "wizard": MessageLookupByLibrary.simpleMessage("mago"),
        "wordIsTooLongMaximum15LettersAllowed":
            MessageLookupByLibrary.simpleMessage(
                "la parola è troppo lunga. massimo 15 lettere consentite"),
        "wordModifier":
            MessageLookupByLibrary.simpleMessage("modificatore parola: "),
        "x2Word": MessageLookupByLibrary.simpleMessage("x2 par"),
        "x3Word": MessageLookupByLibrary.simpleMessage("x3 par"),
        "yes": MessageLookupByLibrary.simpleMessage("sì"),
        "youHaveAnUnfinishedGame":
            MessageLookupByLibrary.simpleMessage("hai una partita in corso"),
        "yourBet": MessageLookupByLibrary.simpleMessage("la tua offerta")
      };
}
