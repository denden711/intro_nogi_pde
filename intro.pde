import ddf.minim.*;  //宣言
 
Minim        mini;    //Minimオブジェクト変数
AudioPlayer  player;  //音楽制御用インスタンス
int base_time,decision;
int max = 272; // 曲数272
float time;
String name, total;
 
//------------------------
// 初期処理関数
//------------------------
void setup(){
  boolean breakFlg = false;  //初期処理エラーFLG
  decision = (int)random(max); 
  name = "" + decision + ".mp3";
  time = 500; //再生時間の初期値
  total = "" + time / 1000;
  
  size(400,400);
  
  //Minimインスタンスを作成する
  mini = new Minim( this );
    
  //音楽ファイルを読み込む
  player = mini.loadFile(name);
  if( player == null ){
    println( "loadFile() error" );
    breakFlg = true;
  }
  
  println("");
  println("");
  println("");
  println("");
  
  textSize( 16 );
  textAlign( LEFT, TOP );
    
  if( breakFlg == true ){  
    //エラーなら終了
    noLoop();
    exit();
  }
  
}
 
//------------------------
// 描画処理関数
//------------------------
void draw(){
  background( 255 );
  
  //状態表示
  String msg;
  if( player.isPlaying() ){
    msg = "Playing";
  } else {
    msg = "Stopped";
  }
  fill(129, 41, 144); //ボタン1
  rect (20, 20, 360, 150);
  fill( 0 );
  textSize(50);
  text( msg, 110, 65 );
  
  fill(0, 0, 255); //ボタン2
  rect (20, 190, 100, 100);
  fill(0);
  textSize(40);
  text( "-0.1s", 30, 215);
  
  fill(255, 0, 0); //ボタン3
  rect (140, 190, 110, 100);
  fill(0);
  textSize(40);
  text( "+0.1s", 150, 215);
  
  fill(0, 255, 255); //total
  rect (270, 190, 110, 100);
  fill(0);
  textSize(40);
  text( "total", 285, 190);
  text( total+"s", 290, 230);
  
  fill(245, 20, 238); //ボタン4
  rect (20, 310, 170, 80);
  fill(0);
  textSize(50);
  text( "Answer", 30, 315);
  
  fill(251, 145, 24); //ボタン5
  rect (210, 310, 170, 80);
  fill(0);
  textSize(50);
  text( "Next", 240, 315);
  
  if (millis()-base_time > time){
    player.pause();
    }
}
 
//------------------------
// マウス押下イベント
//------------------------
void mousePressed(){  
  //マウス押下縦位置検査
  if ((20 < mouseX && mouseX < 380)&&(20 < mouseY && mouseY < 170)){ //ボタン1
  if( player.isPlaying() == false ){
    //必ず先頭から演奏開始
    player.rewind();
    base_time = millis();
    player.play();
  }
  
  }
  
  if ((20 < mouseX && mouseX < 120)&&(190 < mouseY && mouseY < 290)){ //ボタン2
  time = time - 100;
  total = "" + time / 1000;
  }
  
  if ((140 < mouseX && mouseX < 240)&&(190 < mouseY && mouseY < 290)){ //ボタン3
  time = time + 100;
  total = "" + time / 1000;
  }
  
  if ((210 < mouseX && mouseX < 380)&&(310 < mouseY && mouseY < 390)){ //ボタン5
  player.pause();
  decision = (int)random(max);
  name = "" + decision + ".mp3";
  player = mini.loadFile(name);
  if( player == null ){
    println( "loadFile() error" ); 
  }
  println("");
  println("");
  println("");
  println("");
  println("next");
  }
  
  if ((20 < mouseX && mouseX < 190)&&(310 < mouseY && mouseY < 390)){ //ボタン4
  player.pause();
  switch(decision){
    case 0:
    println("Answer");
    println("ぐるぐるカーテン");
    break;
    case 1:
    println("Answer");
    println("左胸の勇気");
    break;
    case 2:
    println("Answer");
    println("乃木坂の詩");
    break;
    case 3:
    println("Answer");
    println("会いたかったかもしれない");
    break;
    case 4:
    println("Answer");
    println("失いたくないから");
    break;
    case 5:
    println("Answer");
    println("白い雲にのって");
    break;
    case 6:
    println("Answer");
    println("おいでシャンプー");
    break;
    case 7:
    println("Answer");
    println("心の薬");
    break;
    case 8:
    println("Answer");
    println("偶然を言い訳にして");
    break;
    case 9:
    println("Answer");
    println("水玉模様");
    break;
    case 10:
    println("Answer");
    println("狼に口笛を");
    break;
    case 11:
    println("Answer");
    println("ハウス!");
    break;
    case 12:
    println("Answer");
    println("走れ!Bicycle");
    break;
    case 13:
    println("Answer");
    println("せっかちなかたつむり");
    break;
    case 14:
    println("Answer");
    println("涙がまだ悲しみだった頃");
    break;
    case 15:
    println("Answer");
    println("人はなぜ走るのか?");
    break;
    case 16:
    println("Answer");
    println("音が出ないギター");
    break;
    case 17:
    println("Answer");
    println("海流の島よ");
    break;
    case 18:
    println("Answer");
    println("制服のマネキン");
    break;
    case 19:
    println("Answer");
    println("指望遠鏡");
    break;
    case 20:
    println("Answer");
    println("やさしさなら間に合ってる");
    break;
    case 21:
    println("Answer");
    println("ここじゃないどこか");
    break;
    case 22:
    println("Answer");
    println("春のメロディー");
    break;
    case 23:
    println("Answer");
    println("渋谷ブルース");
    break;
    case 24:
    println("Answer");
    println("君の名は希望");
    break;
    case 25:
    println("Answer");
    println("シャキイズム");
    break;
    case 26:
    println("Answer");
    println("ロマンティックいか焼き");
    break;
    case 27:
    println("Answer");
    println("13日の金曜日");
    break;
    case 28:
    println("Answer");
    println("でこぴん");
    break;
    case 29:
    println("Answer");
    println("サイコキネシスの可能性");
    break;
    case 30:
    println("Answer");
    println("ガールズルール");
    break;
    case 31:
    println("Answer");
    println("世界で一番 孤独なLover");
    break;
    case 32:
    println("Answer");
    println("コウモリよ");
    break;
    case 33:
    println("Answer");
    println("扇風機");
    break;
    case 34:
    println("Answer");
    println("他の星から");
    break;
    case 35:
    println("Answer");
    println("人間という楽器");
    break;
    case 36:
    println("Answer");
    println("バレッタ");
    break;
    case 37:
    println("Answer");
    println("月の大きさ");
    break;
    case 38:
    println("Answer");
    println("私のために 誰かのために");
    break;
    case 39:
    println("Answer");
    println("そんなバカな…");
    break;
    case 40:
    println("Answer");
    println("初恋の人を今でも");
    break;
    case 41:
    println("Answer");
    println("やさしさとは");
    break;
    case 42:
    println("Answer");
    println("気づいたら片想い");
    break;
    case 43:
    println("Answer");
    println("ロマンスのスタート");
    break;
    case 44:
    println("Answer");
    println("吐息のメソッド");
    break;
    case 45:
    println("Answer");
    println("孤独兄弟");
    break;
    case 46:
    println("Answer");
    println("生まれたままで");
    break;
    case 47:
    println("Answer");
    println("ダンケシェーン");
    break;
    case 48:
    println("Answer");
    println("夏のFree&Easy");
    break;
    case 49:
    println("Answer");
    println("何もできずにそばにいる");
    break;
    case 50:
    println("Answer");
    println("その先の出口");
    break;
    case 51:
    println("Answer");
    println("無口なライオン");
    break;
    case 52:
    println("Answer");
    println("ここにいる理由");
    break;
    case 53:
    println("Answer");
    println("僕が行かなきゃ誰が行くんだ?");
    break;
    case 54:
    println("Answer");
    println("何度目の青空か?");
    break;
    case 55:
    println("Answer");
    println("遠回りの愛情");
    break;
    case 56:
    println("Answer");
    println("転がった鐘を鳴らせ!");
    break;
    case 57:
    println("Answer");
    println("私、起きる。");
    break;
    case 58:
    println("Answer");
    println("あの日 僕は咄嗟に嘘をついた");
    break;
    case 59:
    println("Answer");
    println("Tender days");
    break;
    case 60:
    println("Answer");
    println("OVERTURE");
    break;
    case 61:
    println("Answer");
    println("誰かは味方");
    break;
    case 62:
    println("Answer");
    println("革命の馬");
    break;
    case 63:
    println("Answer");
    println("僕がいる場所");
    break;
    case 64:
    println("Answer");
    println("あなたのために弾きたい");
    break;
    case 65:
    println("Answer");
    println("傾斜する");
    break;
    case 66:
    println("Answer");
    println("なぞの落書き");
    break;
    case 67:
    println("Answer");
    println("自由の彼方");
    break;
    case 68:
    println("Answer");
    println("ひとりよがり");
    break;
    case 69:
    println("Answer");
    println("混ざり合うもの");
    break;
    case 70:
    println("Answer");
    println("命は美しい");
    break;
    case 71:
    println("Answer");
    println("あらかじめ語られるロマンス");
    break;
    case 72:
    println("Answer");
    println("立ち直り中");
    break;
    case 73:
    println("Answer");
    println("ごめんね ずっと…");
    break;
    case 74:
    println("Answer");
    println("君は僕と会わない方がよかったのかな");
    break;
    case 75:
    println("Answer");
    println("ボーダー");
    break;
    case 76:
    println("Answer");
    println("太陽ノック");
    break;
    case 77:
    println("Answer");
    println("もう少しの夢");
    break;
    case 78:
    println("Answer");
    println("魚たちのLOVE SONG");
    break;
    case 79:
    println("Answer");
    println("無表情");
    break;
    case 80:
    println("Answer");
    println("別れ際、もっと好きになる");
    break;
    case 81:
    println("Answer");
    println("羽根の記憶");
    break;
    case 82:
    println("Answer");
    println("制服を脱いでサヨナラを…");
    break;
    case 83:
    println("Answer");
    println("今、話したい誰かがいる");
    break;
    case 84:
    println("Answer");
    println("嫉妬の権利");
    break;
    case 85:
    println("Answer");
    println("ポピパッパパー");
    break;
    case 86:
    println("Answer");
    println("大人への近道");
    break;
    case 87:
    println("Answer");
    println("悲しみの忘れ方");
    break;
    case 88:
    println("Answer");
    println("隙間");
    break;
    case 89:
    println("Answer");
    println("ハルジオンが咲く頃");
    break;
    case 90:
    println("Answer");
    println("遥かなるブータン");
    break;
    case 91:
    println("Answer");
    println("強がる蕾");
    break;
    case 92:
    println("Answer");
    println("急斜面");
    break;
    case 93:
    println("Answer");
    println("釣り堀");
    break;
    case 94:
    println("Answer");
    println("不等号");
    break;
    case 95:
    println("Answer");
    println("憂鬱と風船ガム");
    break;
    case 96:
    println("Answer");
    println("きっかけ");
    break;
    case 97:
    println("Answer");
    println("太陽に口説かれて");
    break;
    case 98:
    println("Answer");
    println("欲望のリインカーネーション");
    break;
    case 99:
    println("Answer");
    println("空気感");
    break;
    case 100:
    println("Answer");
    println("光合成希望");
    break;
    case 101:
    println("Answer");
    println("Threefold choice");
    break;
    case 102:
    println("Answer");
    println("低体温のキス");
    break;
    case 103:
    println("Answer");
    println("失恋したら、顔を洗え!");
    break;
    case 104:
    println("Answer");
    println("かき氷の片想い");
    break;
    case 105:
    println("Answer");
    println("環状六号線");
    break;
    case 106:
    println("Answer");
    println("口約束");
    break;
    case 107:
    println("Answer");
    println("裸足でSummer");
    break;
    case 108:
    println("Answer");
    println("僕だけの光");
    break;
    case 109:
    println("Answer");
    println("オフショアガール");
    break;
    case 110:
    println("Answer");
    println("命の真実 ミュージカル「林檎売りとカメムシ」");
    break;
    case 111:
    println("Answer");
    println("白米様");
    break;
    case 112:
    println("Answer");
    println("シークレットグラフィティー");
    break;
    case 113:
    println("Answer");
    println("行くあてのない僕たち");
    break;
    case 114:
    println("Answer");
    println("サヨナラの意味");
    break;
    case 115:
    println("Answer");
    println("孤独な青空");
    break;
    case 116:
    println("Answer");
    println("あの教室");
    break;
    case 117:
    println("Answer");
    println("ブランコ");
    break;
    case 118:
    println("Answer");
    println("2度目のキスから");
    break;
    case 119:
    println("Answer");
    println("君に贈る花がない");
    break;
    case 120:
    println("Answer");
    println("ないものねだり");
    break;
    case 121:
    println("Answer");
    println("インフルエンサー");
    break;
    case 122:
    println("Answer");
    println("人生を考えたくなる");
    break;
    case 123:
    println("Answer");
    println("意外BREAK");
    break;
    case 124:
    println("Answer");
    println("Another Ghost");
    break;
    case 125:
    println("Answer");
    println("風船は生きている");
    break;
    case 126:
    println("Answer");
    println("三番目の風");
    break;
    case 127:
    println("Answer");
    println("当たり障りのない話");
    break;
    case 128:
    println("Answer");
    println("スカイダイビング");
    break;
    case 129:
    println("Answer");
    println("君が扇いでくれた");
    break;
    case 130:
    println("Answer");
    println("思い出ファースト");
    break;
    case 131:
    println("Answer");
    println("設定温度");
    break;
    case 132:
    println("Answer");
    println("Rewindあの日");
    break;
    case 133:
    println("Answer");
    println("ごめんね、スムージー");
    break;
    case 134:
    println("Answer");
    println("醜い私");
    break;
    case 135:
    println("Answer");
    println("硬い殻のように抱きしめたい");
    break;
    case 136:
    println("Answer");
    println("満月が消えた");
    break;
    case 137:
    println("Answer");
    println("ワタボコリ");
    break;
    case 138:
    println("Answer");
    println("流星ディスコティック");
    break;
    case 139:
    println("Answer");
    println("忘却と美学");
    break;
    case 140:
    println("Answer");
    println("逃げ水");
    break;
    case 141:
    println("Answer");
    println("女は一人じゃ眠れない");
    break;
    case 142:
    println("Answer");
    println("ひと夏の長さより…");
    break;
    case 143:
    println("Answer");
    println("アンダー");
    break;
    case 144:
    println("Answer");
    println("ライブ神");
    break;
    case 145:
    println("Answer");
    println("未来の答え");
    break;
    case 146:
    println("Answer");
    println("泣いたっていいじゃないか?");
    break;
    case 147:
    println("Answer");
    println("いつかできるから今日できる");
    break;
    case 148:
    println("Answer");
    println("不眠症");
    break;
    case 149:
    println("Answer");
    println("まあいいか?");
    break;
    case 150:
    println("Answer");
    println("失恋お掃除人");
    break;
    case 151:
    println("Answer");
    println("My rule");
    break;
    case 152:
    println("Answer");
    println("僕の衝動");
    break;
    case 153:
    println("Answer");
    println("新しい花粉 ～ミュージカル「見知らぬ世界」より～");
    break;
    case 154:
    println("Answer");
    println("自分のこと");
    break;
    case 155:
    println("Answer");
    println("自惚れビーチ");
    break;
    case 156:
    println("Answer");
    println("その女");
    break;
    case 157:
    println("Answer");
    println("誰よりそばにいたい");
    break;
    case 158:
    println("Answer");
    println("シンクロニシティ");
    break;
    case 159:
    println("Answer");
    println("Against");
    break;
    case 160:
    println("Answer");
    println("雲になればいい");
    break;
    case 161:
    println("Answer");
    println("新しい世界");
    break;
    case 162:
    println("Answer");
    println("スカウトマン");
    break;
    case 163:
    println("Answer");
    println("トキトキメキメキ");
    break;
    case 164:
    println("Answer");
    println("言霊砲");
    break;
    case 165:
    println("Answer");
    println("ジコチューで行こう!");
    break;
    case 166:
    println("Answer");
    println("空扉");
    break;
    case 167:
    println("Answer");
    println("三角の空き地");
    break;
    case 168:
    println("Answer");
    println("自分じゃない感じ");
    break;
    case 169:
    println("Answer");
    println("心のモノローグ");
    break;
    case 170:
    println("Answer");
    println("地球が丸いなら");
    break;
    case 171:
    println("Answer");
    println("あんなに好きだったのに…");
    break;
    case 172:
    println("Answer");
    println("帰り道は遠回りしたくなる");
    break;
    case 173:
    println("Answer");
    println("キャラバンは眠らない");
    break;
    case 174:
    println("Answer");
    println("つづく");
    break;
    case 175:
    println("Answer");
    println("日常");
    break;
    case 176:
    println("Answer");
    println("告白の順番");
    break;
    case 177:
    println("Answer");
    println("ショパンの嘘つき");
    break;
    case 178:
    println("Answer");
    println("知りたいこと");
    break;
    case 179:
    println("Answer");
    println("ありがちな恋愛");
    break;
    case 180:
    println("Answer");
    println("もし君がいなければ");
    break;
    case 181:
    println("Answer");
    println("キスの手裏剣");
    break;
    case 182:
    println("Answer");
    println("頬杖をついては眠れない");
    break;
    case 183:
    println("Answer");
    println("ぼっち党");
    break;
    case 184:
    println("Answer");
    println("さゆりんご募集中");
    break;
    case 185:
    println("Answer");
    println("ゴルゴンゾーラ");
    break;
    case 186:
    println("Answer");
    println("もうすぐ～ザンビ伝説～");
    break;
    case 187:
    println("Answer");
    println("Sing Out!");
    break;
    case 188:
    println("Answer");
    println("滑走路");
    break;
    case 189:
    println("Answer");
    println("のような存在");
    break;
    case 190:
    println("Answer");
    println("Am I Loving?");
    break;
    case 191:
    println("Answer");
    println("平行線");
    break;
    case 192:
    println("Answer");
    println("4番目の光");
    break;
    case 193:
    println("Answer");
    println("曖昧");
    break;
    case 194:
    println("Answer");
    println("夜明けまで強がらなくてもいい");
    break;
    case 195:
    println("Answer");
    println("僕のこと、知ってる?");
    break;
    case 196:
    println("Answer");
    println("路面電車の街");
    break;
    case 197:
    println("Answer");
    println("図書室の君へ");
    break;
    case 198:
    println("Answer");
    println("時々 思い出してください");
    break;
    case 199:
    println("Answer");
    println("～Do my best～じゃ意味はない");
    break;
    case 200:
    println("Answer");
    println("僕の思い込み");
    break;
    case 201:
    println("Answer");
    println("しあわせの保護色");
    break;
    case 202:
    println("Answer");
    println("サヨナラ Stay with me");
    break;
    case 203:
    println("Answer");
    println("じゃあね。");
    break;
    case 204:
    println("Answer");
    println("アナスターシャ");
    break;
    case 205:
    println("Answer");
    println("毎日がBrand new day");
    break;
    case 206:
    println("Answer");
    println("I see...");
    break;
    case 207:
    println("Answer");
    println("ファンタスティック三色パン");
    break;
    case 208:
    println("Answer");
    println("世界中の隣人よ");
    break;
    case 209:
    println("Answer");
    println("Route 246");
    break;
    case 210:
    println("Answer");
    println("僕は僕を好きになる");
    break;
    case 211:
    println("Answer");
    println("明日がある理由");
    break;
    case 212:
    println("Answer");
    println("Wilderness world");
    break;
    case 213:
    println("Answer");
    println("口ほどにもないKISS");
    break;
    case 214:
    println("Answer");
    println("冷たい水の中");
    break;
    case 215:
    println("Answer");
    println("Out of the blue");
    break;
    case 216:
    println("Answer");
    println("友情ピアス");
    break;
    case 217:
    println("Answer");
    println("ごめんねFingers crossed");
    break;
    case 218:
    println("Answer");
    println("全部 夢のまま");
    break;
    case 219:
    println("Answer");
    println("大人たちには指示されない");
    break;
    case 220:
    println("Answer");
    println("ざぶんざざぶん");
    break;
    case 221:
    println("Answer");
    println("さ～ゆ～Ready?");
    break;
    case 222:
    println("Answer");
    println("錆びたコンパス");
    break;
    case 223:
    println("Answer");
    println("猫舌カモミールティー");
    break;
    case 224:
    println("Answer");
    println("君に叱られた");
    break;
    case 225:
    println("Answer");
    println("やさしいだけなら");
    break;
    case 226:
    println("Answer");
    println("マシンガンレイン");
    break;
    case 227:
    println("Answer");
    println("もしも心が透明なら");
    break;
    case 228:
    println("Answer");
    println("私の色");
    break;
    case 229:
    println("Answer");
    println("泥だらけ");
    break;
    case 230:
    println("Answer");
    println("他人のそら似");
    break;
    case 231:
    println("Answer");
    println("最後のTight Hug");
    break;
    case 232:
    println("Answer");
    println("ゆっくりと咲く花");
    break;
    case 233:
    println("Answer");
    println("歳月の轍");
    break;
    case 234:
    println("Answer");
    println("あなたからの卒業");
    break;
    case 235:
    println("Answer");
    println("Hard to say");
    break;
    case 236:
    println("Answer");
    println("Actually…");
    break;
    case 237:
    println("Answer");
    println("深読み");
    break;
    case 238:
    println("Answer");
    println("価値あるもの");
    break;
    case 239:
    println("Answer");
    println("忘れないといいな");
    break;
    case 240:
    println("Answer");
    println("届かなくたって…");
    break;
    case 241:
    println("Answer");
    println("絶望の一秒前");
    break;
    case 242:
    println("Answer");
    println("好きになってみた");
    break;
    case 243:
    println("Answer");
    println("好きというのはロックだぜ!");
    break;
    case 244:
    println("Answer");
    println("Under's Love");
    break;
    case 245:
    println("Answer");
    println("僕が手を叩く方へ");
    break;
    case 246:
    println("Answer");
    println("ジャンピングジョーカーフラッシュ");
    break;
    case 247:
    println("Answer");
    println("バンドエイド剥がすような別れ方");
    break;
    case 248:
    println("Answer");
    println("パッションフルーツの食べ方");
    break;
    case 249:
    println("Answer");
    println("夢を見る筋肉");
    break;
    case 250:
    println("Answer");
    println("1・2・3");
    break;
    case 251:
    println("Answer");
    println("ここにはないもの");
    break;
    case 252:
    println("Answer");
    println("悪い成分");
    break;
    case 253:
    println("Answer");
    println("これから");
    break;
    case 254:
    println("Answer");
    println("銭湯ラプソディー");
    break;
    case 255:
    println("Answer");
    println("アトノマツリ");
    break;
    case 256:
    println("Answer");
    println("甘いエビデンス");
    break;
    case 257:
    println("Answer");
    println("17分間");
    break;
    case 258:
    println("Answer");
    println("人は夢を二度見る");
    break;
    case 259:
    println("Answer");
    println("僕たちのサヨナラ");
    break;
    case 260:
    println("Answer");
    println("心にもないこと");
    break;
    case 261:
    println("Answer");
    println("黄昏はいつも");
    break;
    case 262:
    println("Answer");
    println("Never say never");
    break;
    case 263:
    println("Answer");
    println("さざ波は戻らない");
    break;
    case 264:
    println("Answer");
    println("涙の滑り台");
    break;
    case 265:
    println("Answer");
    println("おひとりさま天国");
    break;
    case 266:
    println("Answer");
    println("踏んでしまった");
    break;
    case 267:
    println("Answer");
    println("誰かの肩");
    break;
    case 268:
    println("Answer");
    println("マグカップとシンク");
    break;
    case 269:
    println("Answer");
    println("考えないようにする");
    break;case 270:
    println("Answer");
    println("お別れタコス");
    break;
    case 271:
    println("Answer");
    println("命の冒涜");
    break;
  }
  }  
}
