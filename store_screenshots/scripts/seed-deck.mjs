// Swiss Grid composition recipe. Refuses to overwrite the saved project unless
// run with --replace (back up app-store-screenshots.json first).
import { writeFileSync, existsSync } from 'node:fs';
const file = new URL('../app-store-screenshots.json', import.meta.url);
if (existsSync(file) && !process.argv.includes('--replace')) throw new Error('Project exists; edit it in the editor or pass --replace.');

// Per slide: [section, headline, highlight, sub]. Slide 2 headline sits beside
// the giant "3"; slide 7 lists the features below.
const copy = {
  en: [
    ['Score', 'Every point.\nIn one place.', 'In one place.', 'Add points. See who leads. →'],
    ['Undo', 'Wrong tap?\nTake it back.', 'back.', 'Undo and redo any move. →'],
    ["Players", "players.\nOne counter.", "", "Track every player. →"],
    ['Dice', 'Your turn.\nRoll it.', 'Roll it.', 'A die in your pocket. →'],
    ['Stopwatch', 'Every second\ncounts.', '', 'Stopwatch\nin every\ngame. →'],
    ['Saves', 'Pause tonight.\nPlay tomorrow.', 'tomorrow.', 'Resume any saved game. →'],
    ["Theme", "Light or dark.\nYour choice.", "Your choice.", "A theme for every game night. →"],
    ['Index', 'Everything\nfor game night.', 'game night.', ''],
  ],
  ru: [
    ['Счёт', 'Все очки.\nВ одном месте.', 'В одном месте.', 'Добавьте очки — видно, кто ведёт. →'],
    ['Отмена', 'Ошиблись?\nОтмените.', 'Отмените.', 'Отмена и повтор любого хода. →'],
    ["Игроки", "игрока.\nОдин счётчик.", "", "Счёт каждого — перед глазами. →"],
    ['Кубик', 'Ваш ход.\nБросайте.', 'Бросайте.', 'Кубик всегда под рукой. →'],
    ['Секундомер', 'Каждая секунда\nна счету.', '', 'Секундомер\nв каждой\nигре. →'],
    ['Сохранение', 'Пауза сегодня.\nИгра завтра.', 'завтра.', 'Продолжайте сохранённые партии. →'],
    ["Тема", "Светлая, тёмная.\nВыбирать вам.", "Выбирать вам.", "Тема для игрового вечера. →"],
    ['Обзор', 'Всё для\nигрового вечера.', 'игрового вечера.', ''],
  ],
  de: [
    ['Punkte', 'Alle Punkte.\nEin Ort.', 'Ein Ort.', 'Punkte eintragen. Führung sehen. →'],
    ['Rückgängig', 'Vertippt?\nZurück damit.', 'Zurück', 'Jeden Zug rückgängig machen. →'],
    ["Spieler", "Spieler.\nEin Zähler.", "", "Punkte für jeden Spieler. →"],
    ['Würfel', 'Du bist dran.\nWürfle.', 'Würfle.', 'Ein Würfel für unterwegs. →'],
    ['Stoppuhr', 'Jede Sekunde\nzählt.', '', 'Stoppuhr\nin jedem\nSpiel. →'],
    ['Speichern', 'Heute Pause.\nMorgen weiter.', 'Morgen', 'Gespeicherte Partien fortsetzen. →'],
    ["Design", "Hell oder dunkel.\nDeine Wahl.", "Deine Wahl.", "Ein Design für jeden Spieleabend. →"],
    ['Übersicht', 'Alles für den\nSpieleabend.', 'Spieleabend.', ''],
  ],
  fr: [
    ['Score', 'Tous les points.\nAu même endroit.', 'Au même endroit.', 'Ajoutez des points. Voyez qui mène. →'],
    ['Annuler', 'Une erreur ?\nAnnulez.', 'Annulez.', 'Annulez et rétablissez chaque coup. →'],
    ["Joueurs", "joueurs.\nUn compteur.", "", "Le score de chaque joueur. →"],
    ['Dé', 'À vous.\nLancez le dé.', 'Lancez', 'Un dé à portée de main. →'],
    ['Chrono', 'Chaque seconde\ncompte.', '', 'Chrono\ndans chaque\njeu. →'],
    ['Sauvegarde', 'Pause ce soir.\nReprise demain.', 'demain.', 'Reprenez vos parties sauvegardées. →'],
    ["Thème", "Clair ou sombre.\nÀ vous de choisir.", "À vous de choisir.", "Un thème pour vos soirées jeux. →"],
    ['Index', 'Tout pour\nla soirée jeux.', 'soirée jeux.', ''],
  ],
  es: [
    ['Puntos', 'Todos los puntos.\nEn un lugar.', 'En un lugar.', 'Suma puntos. Mira quién gana. →'],
    ['Deshacer', '¿Te equivocaste?\nDeshazlo.', 'Deshazlo.', 'Deshaz y rehaz cualquier jugada. →'],
    ["Jugadores", "jugadores.\nUn contador.", "", "Puntos de cada jugador. →"],
    ['Dado', 'Tu turno.\nLanza el dado.', 'Lanza', 'Un dado siempre a mano. →'],
    ['Cronómetro', 'Cada segundo\ncuenta.', '', 'Cronómetro\nen cada\njuego. →'],
    ['Guardado', 'Pausa hoy.\nSigue mañana.', 'mañana.', 'Retoma partidas guardadas. →'],
    ["Tema", "Claro u oscuro.\nTú eliges.", "Tú eliges.", "Un tema para tus noches de juegos. →"],
    ['Índice', 'Todo para la\nnoche de juegos.', 'noche de juegos.', ''],
  ],
  it: [
    ['Punti', 'Tutti i punti.\nIn un posto.', 'In un posto.', 'Aggiungi punti. Vedi chi vince. →'],
    ['Annulla', 'Un errore?\nAnnullalo.', 'Annullalo.', 'Annulla e ripristina ogni mossa. →'],
    ["Giocatori", "giocatori.\nUn contatore.", "", "I punti di ogni giocatore. →"],
    ['Dado', 'Tocca a te.\nLancia il dado.', 'Lancia', 'Un dado sempre a portata. →'],
    ['Cronometro', 'Ogni secondo\nconta.', '', 'Cronometro\nin ogni\ngioco. →'],
    ['Salvataggi', 'Pausa oggi.\nRiprendi domani.', 'domani.', 'Riprendi le partite salvate. →'],
    ["Tema", "Chiaro o scuro.\nScegli tu.", "Scegli tu.", "Un tema per ogni serata giochi. →"],
    ['Indice', 'Tutto per\nla serata giochi.', 'serata giochi.', ''],
  ],
  zh: [
    ['计分', '所有得分。\n记在一处。', '记在一处。', '加分，一眼看清谁领先。→'],
    ['撤销', '输错了？\n撤销即可。', '撤销即可。', '每一步都能撤销和重做。→'],
    ["玩家", "位玩家。\n一个计分器。", "", "每位玩家的得分一目了然。→"],
    ['骰子', '轮到你了。\n掷骰子吧。', '掷骰子吧。', '骰子随手可用。→'],
    ['秒表', '每一秒\n都算数。', '', '每款游戏\n都有秒表。→'],
    ['存档', '今天暂停。\n明天继续。', '明天继续。', '继续保存的对局。→'],
    ["主题", "浅色或深色。\n由你选择。", "由你选择。", "游戏之夜，选择喜欢的主题。→"],
    ['总览', '游戏之夜\n一应俱全。', '一应俱全。', ''],
  ],
  ja: [
    ['スコア', 'みんなの得点。\nひとつの場所に。', 'ひとつの場所に。', '得点を足して、首位がすぐわかる。→'],
    ['取り消し', '入力ミス？\n元に戻そう。', '元に戻そう。', 'どの操作も取り消し・やり直し。→'],
    ["プレイヤー", "人の得点。\nまとめて。", "", "全員の得点を記録。→"],
    ['サイコロ', 'あなたの番。\nサイコロを振ろう。', 'サイコロを振ろう。', 'サイコロをいつも手元に。→'],
    ['タイマー', '一秒ずつ\nしっかり計測。', '', 'どのゲームにも\nストップ\nウォッチ。→'],
    ['保存', '今日はひと休み。\n続きは明日。', '続きは明日。', '保存した対局を再開。→'],
    ["テーマ", "ライトもダークも。\nあなた好みに。", "あなた好みに。", "ゲームの夜に合うテーマ。→"],
    ['一覧', 'ゲームの夜に\n必要なすべて。', '必要なすべて。', ''],
  ],
  ko: [
    ['점수', '모두의 점수.\n한곳에.', '한곳에.', '점수를 더하고 선두를 확인하세요. →'],
    ['실행 취소', '잘못 입력했나요?\n취소하세요.', '취소하세요.', '모든 동작을 취소하고 다시 실행. →'],
    ["플레이어", "명의 점수.\n한곳에.", "", "모든 플레이어의 점수를 기록해요. →"],
    ['주사위', '당신의 차례.\n주사위를 던져요.', '주사위를 던져요.', '손안의 주사위. →'],
    ['스톱워치', '매초를\n기록하세요.', '', '모든 게임에\n스톱워치. →'],
    ['저장', '오늘은 쉬고.\n내일 이어서.', '내일 이어서.', '저장한 게임 이어 하기. →'],
    ["테마", "밝게 또는 어둡게.\n원하는 대로.", "원하는 대로.", "게임의 밤에 어울리는 테마. →"],
    ['목록', '게임의 밤에\n필요한 모든 것.', '필요한 모든 것.', ''],
  ],
  hi: [
    ['अंक', 'सभी के अंक।\nएक जगह।', 'एक जगह।', 'अंक जोड़ें। देखें कौन आगे है। →'],
    ['वापस लें', 'गलत दबाया?\nवापस लें।', 'वापस लें।', 'हर चाल को वापस लें या दोहराएँ। →'],
    ["खिलाड़ी", "खिलाड़ी।\nएक काउंटर।", "", "हर खिलाड़ी के अंक देखें। →"],
    ['पासा', 'आपकी बारी।\nपासा फेंकें।', 'पासा फेंकें।', 'पासा हमेशा साथ। →'],
    ['स्टॉपवॉच', 'हर सेकंड\nगिनें।', '', 'हर खेल में\nस्टॉपवॉच। →'],
    ['सेव', 'आज विराम।\nकल फिर खेलें।', 'कल फिर खेलें।', 'सेव किया खेल जारी रखें। →'],
    ["थीम", "हल्की या गहरी।\nआपकी पसंद।", "आपकी पसंद।", "गेम नाइट के लिए अपनी थीम चुनें। →"],
    ['सूची', 'गेम नाइट के लिए\nसब कुछ।', 'सब कुछ।', ''],
  ],
};
// Feature wall: [name, descriptor] in slide order.
const index = {
  en: [["Scores", "Every player"], ["Undo", "Every move"], ["Players", "At the table"], ["Dice", "One tap"], ["Stopwatch", "Every game"], ["Saves", "Resume later"], ["Redo", "Every move"], ["Dark mode", "Your choice"]],
  ru: [["Счёт", "Все игроки"], ["Отмена", "Любой ход"], ["Игроки", "За столом"], ["Кубик", "Одно касание"], ["Секундомер", "Каждая игра"], ["Сохранения", "Продолжить позже"], ["Повтор", "Любой ход"], ["Тёмная тема", "Ваш выбор"]],
  de: [["Punkte", "Jeder Spieler"], ["Rückgängig", "Jeder Zug"], ["Spieler", "Am Tisch"], ["Würfel", "Ein Tipp"], ["Stoppuhr", "Jedes Spiel"], ["Spielstände", "Später weiter"], ["Wiederholen", "Jeder Zug"], ["Dunkelmodus", "Deine Wahl"]],
  fr: [["Scores", "Chaque joueur"], ["Annuler", "Chaque coup"], ["Joueurs", "À table"], ["Dé", "Un geste"], ["Chrono", "Chaque jeu"], ["Sauvegardes", "Reprendre"], ["Rétablir", "Chaque coup"], ["Mode sombre", "Votre choix"]],
  es: [["Puntos", "Cada jugador"], ["Deshacer", "Cada jugada"], ["Jugadores", "En la mesa"], ["Dado", "Un toque"], ["Cronómetro", "Cada juego"], ["Partidas", "Sigue luego"], ["Rehacer", "Cada jugada"], ["Modo oscuro", "Tú eliges"]],
  it: [["Punti", "Ogni giocatore"], ["Annulla", "Ogni mossa"], ["Giocatori", "Al tavolo"], ["Dado", "Un tocco"], ["Cronometro", "Ogni gioco"], ["Salvataggi", "Riprendi dopo"], ["Ripristina", "Ogni mossa"], ["Tema scuro", "Scegli tu"]],
  zh: [["计分", "每位玩家"], ["撤销", "每一步"], ["玩家", "同桌游戏"], ["骰子", "一键"], ["秒表", "每款游戏"], ["存档", "稍后继续"], ["重做", "每一步"], ["深色模式", "自由选择"]],
  ja: [["スコア", "全プレイヤー"], ["取り消し", "すべての操作"], ["プレイヤー", "みんなで"], ["サイコロ", "ワンタップ"], ["タイマー", "各ゲーム"], ["保存", "あとで再開"], ["やり直し", "すべての操作"], ["ダークモード", "好みに合わせて"]],
  ko: [["점수", "모든 플레이어"], ["실행 취소", "모든 동작"], ["플레이어", "함께 게임"], ["주사위", "탭 한 번"], ["스톱워치", "모든 게임"], ["저장", "나중에 계속"], ["다시 실행", "모든 동작"], ["다크 모드", "원하는 대로"]],
  hi: [["अंक", "हर खिलाड़ी"], ["वापस लें", "हर चाल"], ["खिलाड़ी", "एक साथ"], ["पासा", "एक टैप"], ["स्टॉपवॉच", "हर खेल"], ["सेव", "बाद में जारी"], ["दोहराएँ", "हर चाल"], ["डार्क मोड", "आपकी पसंद"]],
};
const locales = Object.keys(copy);
const field = (i, k) => Object.fromEntries(locales.map(l => [l, copy[l][i][k]]));
const fig = i => Object.fromEntries(locales.map(l => [l, `FIG. ${i + 1} — ${copy[l][i][0]}`]));
const column = (k, map = x => x) => Object.fromEntries(locales.map(l => [l, index[l].map(row => map(row[k])).join('\n')]));

const INK = '#202020', RED = '#F73A3A';
const state = { schemaVersion: 2, appName: 'board buddy', themeId: 'board-buddy', connectedCanvas: false,
  locales, locale: 'en', device: 'iphone', orientation: 'portrait', appIcon: '/app-icon.png', slidesByDevice: {} };

const devices = {
  iphone: [1320, 2868, 1022 / 2082, 'apple/iphone'],
  ipad: [2064, 2752, 0.770, 'apple/ipad'],
  android: [1080, 1920, 9 / 19.5, 'android/phone'],
};
for (const [device, [cW, cH, aspect, folder]] of Object.entries(devices)) {
  // Mirrors swissMetrics() in src/components/editor/swiss.tsx.
  const w = cW / 1320, s = Math.min(w, (cH / 2868) * 1.25), M = 72 * w, col = (cW - 2 * M) / 12;
  const X = c => M + c * col;
  const src = name => `/screenshots/${folder}/{locale}/${name}.png`;
  const pc = Math.round((0.7 * cH * aspect) / col);
  // Upright phone snapped to columns; shrinks until at least 70% stays on canvas.
  const phone = (c0, top, cols = pc, rightEdge) => {
    for (; ; cols--) {
      const width = cols * col, height = width / aspect;
      const x = rightEdge === undefined ? X(c0) : X(rightEdge) - width;
      const visW = Math.min(cW, x + width) - Math.max(0, x), visH = Math.min(cH, top + height) - Math.max(0, top);
      if ((visW * visH) / (width * height) >= 0.7 || cols <= 4) return { x, y: top, width, height, rotation: 0 };
    }
  };
  const caption = (y, c0 = 0, cols = 12, h = 420 * s) => ({ x: X(c0), y, width: cols * col, height: h });
  const mono = (id, text, x, y, width, size, extra = {}) => ({ id, text, font: 'mono', uppercase: true, letterSpacing: '0.06em',
    fontSize: size * s, fontWeight: 400, align: 'left', transform: { x, y, width, height: size * s * 1.7, zIndex: 6 }, ...extra });
  const sub = (i, x, y, width, extra) => mono('sub', field(i, 3), x, y, width, 36, extra);
  const figV = (i, xc, top) => {
    const L = 760 * s, h = 40 * s, x = xc - L / 2, y = top + L / 2 - h / 2;
    return mono('fig', fig(i), x, y, L, 23, { letterSpacing: '0.12em', transform: { x, y, width: L, height: h, rotation: -90, zIndex: 6 } });
  };
  const figLeft = M + 20 * s, figRight = cW - M - 20 * s;
  const base = (i, layout, inverted, screen) => ({ id: `${device}-${i + 1}`, layout, inverted, background: 'none',
    label: field(i, 0), headline: field(i, 1), highlight: field(i, 2), screenshot: screen ? src(screen) : '', transforms: {}, textElements: [] });
  const slides = [];

  // 01 Score — paper, red block on line two, phone cropped by the bottom edge.
  {
    const top = 0.37 * cH, d = phone(12 - pc, top);
    const sl = base(0, 'device-bottom', false, '05-counter-light');
    sl.transforms = { caption: caption(200 * s), device: d };
    sl.textElements = [sub(0, X(0), 620 * s, 12 * col), figV(0, figLeft, top)];
    sl.marks = ['bl'];
    slides.push(sl);
  }
  // 02 Undo — ink, phone cropped by the top edge, index row moves under it.
  {
    const h = (pc * col) / aspect, d = phone(12 - pc, -0.16 * h);
    const indexY = d.y + d.height + 90 * s;
    const sl = base(1, 'device-top', true, '03-counter-dark');
    sl.indexY = indexY;
    sl.transforms = { caption: caption(indexY + 112 * s), device: d };
    sl.textElements = [sub(1, X(0), indexY + 530 * s, 12 * col), figV(1, figLeft, 200 * s)];
    sl.marks = ['br'];
    slides.push(sl);
  }
  // 03 Players — real multiplayer counter, full-bleed proof numeral.
  {
    const blockTop = 200 * s, blockH = 760 * s, top = Math.max(0.42 * cH, blockTop + blockH + 90 * s);
    const sl = base(2, 'hero', false, '05-counter-light');
    sl.transforms = { caption: caption(blockTop + 330 * s, 7, 5, 300 * s), device: phone(0, top) };
    sl.textElements = [
      { id: 'block', text: {}, variant: 'block', background: RED, transform: { x: -4, y: blockTop, width: cW + 8, height: blockH, zIndex: 1 } },
      { id: 'numeral', text: { en: '3' }, font: 'display', fontSize: 600 * s, fontWeight: 800, lineHeight: 0.8, letterSpacing: '-0.06em', color: INK, align: 'left',
        transform: { x: X(0) - 30 * s, y: blockTop + 60 * s, width: 7 * col, height: 560 * s, zIndex: 3 } },
      mono('games', field(2, 3), X(0), blockTop + blockH - 92 * s, 12 * col, 30, { color: INK }),
      figV(2, figRight, top),
    ];
    sl.marks = ['br'];
    slides.push(sl);
  }
  // 04 Dice — ink, red word, phone cropped by the left edge.
  {
    const h = (pc * col) / aspect, top = Math.max(cH - 0.95 * h, 720 * s);
    const sl = base(3, 'device-bottom', true, '06-dice');
    sl.transforms = { caption: caption(200 * s), device: phone(0, top, pc, Math.round(pc * 0.8)) };
    sl.textElements = [sub(3, X(0), 620 * s, 12 * col), figV(3, figRight, top)];
    sl.marks = ['br'];
    slides.push(sl);
  }
  // 05 Stopwatch — paper, giant time in a red block bleeding off the left edge.
  {
    const blockTop = 650 * s, blockH = 430 * s, top = blockTop + blockH + 70 * s;
    const sl = base(4, 'device-top', false, '07-timer');
    delete sl.highlight;
    sl.transforms = { caption: caption(200 * s), device: phone(12 - pc + 2, top) };
    sl.textElements = [
      { id: 'block', text: {}, variant: 'block', background: RED, transform: { x: -4, y: blockTop, width: X(11) + 4, height: blockH, zIndex: 1 } },
      { id: 'numeral', text: { en: '01:23' }, font: 'display', fontSize: 400 * s, fontWeight: 800, lineHeight: 1, letterSpacing: '-0.05em', color: INK, align: 'left',
        transform: { x: X(0) - 18 * s, y: blockTop + 20 * s, width: 10.6 * col, height: blockH - 40 * s, zIndex: 3 } },
      sub(4, X(0), top + 40 * s, 3.6 * col, { lineHeight: 1.35, transform: { x: X(0), y: top + 40 * s, width: 3.6 * col, height: 260 * s, zIndex: 6 } }),
      mono('fig', fig(4), X(0), top + 420 * s, 3.6 * col, 23, { letterSpacing: '0.12em' }),
    ];
    sl.marks = ['bl'];
    slides.push(sl);
  }
  // 06 Saves — ink, red word, phone cropped by the bottom edge on the left.
  {
    const top = 0.42 * cH;
    const sl = base(5, 'hero', true, '09-saved');
    sl.transforms = { caption: caption(200 * s), device: phone(0, top) };
    sl.textElements = [sub(5, X(0), 620 * s, 12 * col), figV(5, figRight, top)];
    sl.marks = ['br'];
    slides.push(sl);
  }
  // 07 Theme — dark counter, red block below.
  {
    const h = (pc * col) / aspect, d = phone(0, -0.16 * h);
    const indexY = d.y + d.height + 90 * s;
    const sl = base(6, 'device-top', false, '03-counter-dark');
    sl.indexY = indexY;
    sl.transforms = { caption: caption(indexY + 112 * s), device: d };
    sl.textElements = [sub(6, X(0), indexY + 540 * s, 12 * col), figV(6, figRight, 200 * s)];
    sl.marks = ['bl'];
    slides.push(sl);
  }
  // 08 Index — ink feature wall, no device.
  {
    const listTop = 720 * s, rowH = Math.min(220 * s, (cH - listTop - 150 * s) / 8);
    const sl = base(7, 'no-device', true, '');
    sl.transforms = { caption: caption(200 * s) };
    sl.rules = Array.from({ length: 9 }, (_, k) => listTop + k * rowH);
    const lh = `${rowH}px`;
    sl.textElements = [
      mono('numbers', { en: Array.from({ length: 8 }, (_, k) => String(k + 1).padStart(2, '0')).join('\n') }, X(0), listTop, 1.2 * col, 28,
        { lineHeight: lh, transform: { x: X(0), y: listTop, width: 1.2 * col, height: rowH * 8, zIndex: 6 } }),
      { id: 'names', text: column(0), font: 'display', fontSize: Math.min(100 * s, rowH * 0.5), fontWeight: 800, lineHeight: lh, letterSpacing: '-0.035em', align: 'left',
        transform: { x: X(1.4), y: listTop, width: 6.4 * col, height: rowH * 8, zIndex: 6 } },
      mono('descriptors', column(1), X(7.9), listTop, 4.1 * col, 24,
        { align: 'right', lineHeight: lh, transform: { x: X(7.9), y: listTop, width: 4.1 * col, height: rowH * 8, zIndex: 6 } }),
    ];
    sl.marks = ['bl'];
    slides.push(sl);
  }
  for (const sl of slides) if (!sl.textElements.length) delete sl.textElements;
  state.slidesByDevice[device] = slides;
}
for (const device of ['feature-graphic', 'apple-header', 'apple-search']) {
  const folder = device === 'feature-graphic' ? 'android/phone' : 'apple/iphone';
  state.slidesByDevice[device] = [{ id: device, layout: 'feature-graphic', label: field(0, 3), headline: field(0, 1), highlight: field(0, 2),
    screenshot: `/screenshots/${folder}/{locale}/05-counter-light.png`, screenshotSecondary: `/screenshots/${folder}/{locale}/03-counter-dark.png` }];
}
state.slidesByDevice['android-7'] = [];
state.slidesByDevice['android-10'] = [];
writeFileSync(file, JSON.stringify(state, null, 2) + '\n');
