let player;
let baseTime, decision;
const numSongs = 279; // これは後で動的に変更される
let playbackTime;
let currentSong, totalTime;
let songLinks = [];

// Google Apps ScriptのURL
const apiURL = 'https://script.google.com/macros/s/AKfycbykj7KI4wYmBs6HZ1PHeykXaWNO_mxUPbBUM_IlY0Dht1OTvmiBA80DQq8gwhEEzD5wYg/exec';

function preload() {
  loadJSON(apiURL, gotData);
}

function gotData(data) {
  songLinks = data.map(file => `https://drive.google.com/uc?export=download&id=${file.id}`);
  numSongs = songLinks.length;
}

function setup() {
  createCanvas(400, 400);
  textSize(16);
  textAlign(LEFT, TOP);

  try {
    decision = int(random(numSongs));
    currentSong = songLinks[decision];
    playbackTime = 1000; //再生時間の初期値
    totalTime = (playbackTime / 1000.0) + "s";

    // 音楽ファイルを読み込む
    loadAudioFile();

    player.pause(); // 初期状態では再生停止状態とする
  } catch (e) {
    handleInitializationError(e);
  }
}

//------------------------
// 音楽ファイルを読み込む
//------------------------
function loadAudioFile() {
  player = loadSound(currentSong, () => {
    player.pause();
  }, () => {
    let errorMessage = "エラー: 音楽ファイルの読み込みに失敗しました: " + currentSong;
    throw new Error(errorMessage);
  });
}

//------------------------
// ネクストオーディオの読み込みエラーを処理する
//------------------------
function handleNextAudioLoadingError(e) {
  let errorMessage = "エラー: 次の音楽ファイルの読み込みに失敗しました。\n" + e.message;
  console.error("エラー: " + errorMessage);
  showErrorMessage(errorMessage);
}

//------------------------
// 初期化エラーを処理する
//------------------------
function handleInitializationError(e) {
  let errorMessage = "エラー: アプリケーションの初期化に失敗しました。\n" + e.message;
  console.error("エラー: " + errorMessage);
  showErrorMessage(errorMessage);
  noLoop();
  noCanvas();
}

//------------------------
// 描画処理関数
//------------------------
function draw() {
  background(255);

  // 状態表示
  let status;
  if (player.isPlaying()) {
    status = "Playing";
  } else {
    status = "Stopped";
  }
  
  // 再生状態に基づいてボタンの色を設定する
  let buttonColor;
  if (player.isPlaying()) {
    buttonColor = color(0, 255, 0); // 再生中の色
  } else {
    buttonColor = color(129, 41, 144); // 停止中の色
  }

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

//------------------------
// キーボード押下イベント
//------------------------
function keyPressed() {
  if (keyCode === 32) { // スペースキーのkeyCodeは32
    if (!player.isPlaying()) {
      player.jump(0);
      baseTime = millis();
      player.play();
    } else {
      player.pause();
    }
  }
}

//------------------------
// マウス押下イベント
//------------------------
function mousePressed() {
  //マウス押下縦位置検査
  if (20 < mouseX && mouseX < 380 && 20 < mouseY && 20 < mouseY && mouseY < 170) { //ボタン1
    if (!player.isPlaying()) {
      //必ず先頭から演奏開始
      player.jump(0);
      baseTime = millis();
      player.play();
    }
  }

  if (20 < mouseX && mouseX < 120 && 190 < mouseY && mouseY < 290) { //ボタン2
    if (playbackTime >= 100) {
      playbackTime -= 100;
      totalTime = (playbackTime / 1000.0) + "s";
    }
  }

  if (140 < mouseX && mouseX < 240 && 190 < mouseY && mouseY < 290) { //ボタン3
    playbackTime += 100;
    totalTime = (playbackTime / 1000.0) + "s";
  }

  if (210 < mouseX && mouseX < 380 && 310 < mouseY && mouseY < 390) { // ボタン5
    player.pause();
    decision = int(random(numSongs));
    currentSong = songLinks[decision];

    try {
      loadAudioFile();
    } catch (e) {
      handleNextAudioLoadingError(e);
    }

    console.log("\n\n\n\n");
    console.log("next");
  }

  if (20 < mouseX && mouseX < 190 && 310 < mouseY && mouseY < 390) { // ボタン4
    player.pause();
    switch (decision) {
        // Add all your cases here with the appropriate song names
        // Example:
        case 0:
          console.log("Answer");
          console.log("ぐるぐるカーテン");
          break;
        case 1:
          console.log("Answer");
          console.log("左胸の勇気");
          break;
        // Continue adding cases up to numSongs - 1
        default:
          console.log("No answer available.");
          break;
    }
  }
}
