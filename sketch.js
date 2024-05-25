let player;
let baseTime, decision;
const numSongs = 1; // 曲数を1に設定（他の曲を追加する場合は変更）
let playbackTime;
let currentSong, totalTime;
let songs = [
  // Googleドライブの直接ダウンロードリンク
  'https://drive.google.com/uc?export=download&id=14SchnBcLReW3-6kw_Bh7r3bhsxDPq0G_'
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
    // 曲の名前をここに追加
    let answers = [
      "曲名" // 曲名を入力
    ];
    println("Answer: " + answers[decision]);
  }
}

function onSoundLoadSuccess() {
  println('Sound loaded successfully');
}

function onSoundLoadError() {
  println('Error loading sound');
}
