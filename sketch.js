let minim;
let player;
let baseTime, decision;
const numSongs = 279;
let playbackTime;
let currentSong, totalTime;
let songs = [
  // Googleドライブの直接ダウンロードリンク
  'https://drive.google.com/uc?export=download&id=14SchnBcLReW3-6kw_Bh7r3bhsxDPq0G_',
  // 他の曲のリンクをここに追加
];

let answers = [
  "ぐるぐるカーテン",
  "左胸の勇気",
  "乃木坂の詩",
  "会いたかったかもしれない",
  "失いたくないから",
  "白い雲にのって",
  "おいでシャンプー",
  "心の薬",
  "偶然を言い訳にして",
  "水玉模様",
  "狼に口笛を",
  "ハウス!",
  "走れ!Bicycle",
  "せっかちなかたつむり",
  "涙がまだ悲しみだった頃",
  "人はなぜ走るのか?",
  "音が出ないギター",
  "海流の島よ",
  "制服のマネキン",
  "指望遠鏡",
  "やさしさなら間に合ってる",
  "ここじゃないどこか",
  "春のメロディー",
  "渋谷ブルース",
  "君の名は希望",
  "シャキイズム",
  "ロマンティックいか焼き",
  "13日の金曜日",
  "でこぴん",
  "サイコキネシスの可能性",
  "ガールズルール",
  "世界で一番 孤独なLover",
  "コウモリよ",
  "扇風機",
  "他の星から",
  "人間という楽器",
  "バレッタ",
  "月の大きさ",
  "私のために 誰かのために",
  "そんなバカな…",
  "初恋の人を今でも",
  "やさしさとは",
  "気づいたら片想い",
  "ロマンスのスタート",
  "吐息のメソッド",
  "孤独兄弟",
  "生まれたままで",
  "ダンケシェーン",
  "夏のFree&Easy",
  "何もできずにそばにいる",
  "その先の出口",
  "無口なライオン",
  "ここにいる理由",
  "僕が行かなきゃ誰が行くんだ?",
  "何度目の青空か?",
  "遠回りの愛情",
  "転がった鐘を鳴らせ!",
  "私、起きる。",
  "あの日 僕は咄嗟に嘘をついた",
  "Tender days",
  "OVERTURE",
  "誰かは味方",
  "革命の馬",
  "僕がいる場所",
  "あなたのために弾きたい",
  "傾斜する",
  "なぞの落書き",
  "自由の彼方",
  "ひとりよがり",
  "混ざり合うもの",
  "命は美しい",
  "あらかじめ語られるロマンス",
  "立ち直り中",
  "ごめんね ずっと…",
  "君は僕と会わない方がよかったのかな",
  "ボーダー",
  "太陽ノック",
  "もう少しの夢",
  "魚たちのLOVE SONG",
  "無表情",
  "別れ際、もっと好きになる",
  "羽根の記憶",
  "制服を脱いでサヨナラを…",
  "今、話したい誰かがいる",
  "嫉妬の権利",
  "ポピパッパパー",
  "大人への近道",
  "悲しみの忘れ方",
  "隙間",
  "ハルジオンが咲く頃",
  "遥かなるブータン",
  "強がる蕾",
  "急斜面",
  "釣り堀",
  "不等号",
  "憂鬱と風船ガム",
  "きっかけ",
  "太陽に口説かれて",
  "欲望のリインカーネーション",
  "空気感",
  "光合成希望",
  "Threefold choice",
  "低体温のキス",
  "失恋したら、顔を洗え!",
  "かき氷の片想い",
  "環状六号線",
  "口約束",
  "裸足でSummer",
  "僕だけの光",
  "オフショアガール",
  "命の真実 ミュージカル「林檎売りとカメムシ」",
  "白米様",
  "シークレットグラフィティー",
  "行くあてのない僕たち",
  "サヨナラの意味",
  "孤独な青空",
  "あの教室",
  "ブランコ",
  "2度目のキスから",
  "君に贈る花がない",
  "ないものねだり",
  "インフルエンサー",
  "人生を考えたくなる",
  "意外BREAK",
  "Another Ghost",
  "風船は生きている",
  "三番目の風",
  "当たり障りのない話",
  "スカイダイビング",
  "君が扇いでくれた",
  "思い出ファースト",
  "設定温度",
  "Rewindあの日",
  "ごめんね、スムージー",
  "醜い私",
  "硬い殻のように抱きしめたい",
  "満月が消えた",
  "ワタボコリ",
  "流星ディスコティック",
  "忘却と美学",
  "逃げ水",
  "女は一人じゃ眠れない",
  "ひと夏の長さより…",
  "アンダー",
  "ライブ神",
  "未来の答え",
  "泣いたっていいじゃないか?",
  "いつかできるから今日できる",
  "不眠症",
  "まあいいか?",
  "失恋お掃除人",
  "My rule",
  "僕の衝動",
  "新しい花粉 ～ミュージカル「見知らぬ世界」より～",
  "自分のこと",
  "自惚れビーチ",
  "その女",
  "誰よりそばにいたい",
  "シンクロニシティ",
  "Against",
  "雲になればいい",
  "新しい世界",
  "スカウトマン",
  "トキトキメキメキ",
  "言霊砲",
  "ジコチューで行こう!",
  "空扉",
  "三角の空き地",
  "自分じゃない感じ",
  "心のモノローグ",
  "地球が丸いなら",
  "あんなに好きだったのに…",
  "帰り道は遠回りしたくなる",
  "キャラバンは眠らない",
  "つづく",
  "日常",
  "告白の順番",
  "ショパンの嘘つき",
  "知りたいこと",
  "ありがちな恋愛",
  "もし君がいなければ",
  "キスの手裏剣",
  "頬杖をついては眠れない",
  "ぼっち党",
  "さゆりんご募集中",
  "ゴルゴンゾーラ",
  "もうすぐ～ザンビ伝説～",
  "Sing Out!",
  "滑走路",
  "のような存在",
  "Am I Loving?",
  "平行線",
  "4番目の光",
  "曖昧",
  "夜明けまで強がらなくてもいい",
  "僕のこと、知ってる?",
  "路面電車の街",
  "図書室の君へ",
  "時々 思い出してください",
  "～Do my best～じゃ意味はない",
  "僕の思い込み",
  "しあわせの保護色",
  "サヨナラ Stay with me",
  "じゃあね。",
  "アナスターシャ",
  "毎日がBrand new day",
  "I see...",
  "ファンタスティック三色パン",
  "世界中の隣人よ",
  "Route 246",
  "僕は僕を好きになる",
  "明日がある理由",
  "Wilderness world",
  "口ほどにもないKISS",
  "冷たい水の中",
  "Out of the blue",
  "友情ピアス",
  "ごめんねFingers crossed",
  "全部 夢のまま",
  "大人たちには指示されない",
  "ざぶんざざぶん",
  "さ～ゆ～Ready?",
  "錆びたコンパス",
  "猫舌カモミールティー",
  "君に叱られた",
  "やさしいだけなら",
  "マシンガンレイン",
  "もしも心が透明なら",
  "私の色",
  "泥だらけ",
  "他人のそら似",
  "最後のTight Hug",
  "ゆっくりと咲く花",
  "歳月の轍",
  "あなたからの卒業",
  "Hard to say",
  "Actually…",
  "深読み",
  "価値あるもの",
  "忘れないといいな",
  "届かなくたって…",
  "絶望の一秒前",
  "好きになってみた",
  "好きというのはロックだぜ!",
  "Under's Love",
  "僕が手を叩く方へ",
  "ジャンピングジョーカーフラッシュ",
  "バンドエイド剥がすような別れ方",
  "パッションフルーツの食べ方",
  "夢を見る筋肉",
  "1・2・3",
  "ここにはないもの",
  "悪い成分",
  "これから",
  "銭湯ラプソディー",
  "アトノマツリ",
  "甘いエビデンス",
  "17分間",
  "人は夢を二度見る",
  "僕たちのサヨナラ",
  "心にもないこと",
  "黄昏はいつも",
  "Never say never",
  "さざ波は戻らない",
  "涙の滑り台",
  "おひとりさま天国",
  "踏んでしまった",
  "誰かの肩",
  "マグカップとシンク",
  "考えないようにする",
  "お別れタコス",
  "命の冒涜",
  "Monopoly",
  "思い出が止まらなくなる",
  "助手席をずっと空けていた",
  "羊飼いよ",
  "手ごねハンバーグ",
  "スタイリッシュ",
  "いつの日にか、あの歌を..."
];

function preload() {
  decision = int(random(numSongs));
  currentSong = songs[decision];
  player = loadSound(currentSong, onSoundLoadSuccess, onSoundLoadError);
  playbackTime = 1000; // 再生時間の初期値
  totalTime = (playbackTime / 1000.0) + "s";
}

function setup() {
  createCanvas(400, 400);
  textSize(16);
  textAlign(LEFT, TOP);
}

function draw() {
  background(255);

  // 状態表示
  let status = player.isPlaying() ? "Playing" : "Stopped";
  
  // 再生状態に基づいてボタンの色を設定する
  let buttonColor = player.isPlaying() ? color(0, 255, 0) : color(129, 41, 144);

  // 色を更新したボタンを描画する
  fill(buttonColor); // ボタン1
  rect(20, 20, 360, 150);
  fill(0);
  textSize(50);
  text(status, 110, 65);

  fill(0, 0, 255); //ボタン2
  rect(20, 190, 100, 100);
  fill(0);
  textSize(40);
  text("-0.1s", 30, 215);

  fill(255, 0, 0); //ボタン3
  rect(140, 190, 110, 100);
  fill(0);
  textSize(40);
  text("+0.1s", 150, 215);

  fill(0, 255, 255); //total
  rect(270, 190, 110, 100);
  fill(0);
  textSize(40);
  text("total", 285, 190);
  text(totalTime, 290, 230);

  fill(245, 20, 238); //ボタン4
  rect(20, 310, 170, 80);
  fill(0);
  textSize(50);
  text("Answer", 30, 315);

  fill(251, 145, 24); //ボタン5
  rect(210, 310, 170, 80);
  fill(0);
  textSize(50);
  text("Next", 240, 315);

  if (millis() - baseTime > playbackTime) {
    player.pause();
  }
}

function mousePressed() {
  if (20 < mouseX && mouseX < 380 && 20 < mouseY && mouseY < 170) {
    if (!player.isPlaying()) {
      player.play();
      baseTime = millis();
    } else {
      player.pause();
    }
  }

  if (20 < mouseX && mouseX < 120 && 190 < mouseY && mouseY < 290) {
    if (playbackTime >= 100) {
      playbackTime -= 100;
      totalTime = (playbackTime / 1000.0) + "s";
    }
  }

  if (140 < mouseX && mouseX < 240 && 190 < mouseY && mouseY < 290) {
    playbackTime += 100;
    totalTime = (playbackTime / 1000.0) + "s";
  }

  if (210 < mouseX && mouseX < 380 && 310 < mouseY && mouseY < 390) {
    player.stop();
    decision = int(random(numSongs));
    currentSong = songs[decision];
    player = loadSound(currentSong, onSoundLoadSuccess, onSoundLoadError);
    println("next");
  }

  if (20 < mouseX && mouseX < 190 && 310 < mouseY && mouseY < 390) {
    player.pause();
    println("Answer: " + answers[decision]);
  }
}

function onSoundLoadSuccess() {
  println('Sound loaded successfully');
}

function onSoundLoadError() {
  println('Error loading sound');
}
