# Core Classes - 本命クラス分析

## 🎯 追加抽出された重要クラス

### 1. **BLE Management Layer**

#### BaseObservableBleManager.smali
- **役割**: BLE接続の基盤となる観察可能マネージャー
- **重要性**: 初期ペアリング、再接続ロジック、Write/Notifyの順序制御
- **iOS実装への影響**: CBCentralManagerの実装パターン参考

### 2. **Media Transfer Protocol**

#### MiWearMediaHandler$syncMediaFileData$1$media$1.smali
- **役割**: メディアファイル同期の中核処理
- **プロトコル**: MiShow serviceを使用したファイル転送
- **重要性**: 写真/動画のダウンロードプロトコル詳細

#### InterconnectionProtos$MiShow.smali
- **役割**: MiShowプロトコルのProtobuf定義
- **重要性**: ギャラリー転送、プレビュー更新の通信形式
- **iOS実装**: カスタムプロトコルとしてSwiftで再実装が必要

#### O95DownloadMediaFileService$mediaDownloadHelper$2.smali
- **役割**: O95専用メディアダウンロード処理
- **プロトコル**: Wi-Fi Direct/UDP転送の詳細実装
- **重要性**: 大容量ファイル転送の最適化手法

### 3. **Device Connection & State Management**

#### O95DeviceDecorator$connectDevice$2.smali
- **役割**: O95デバイス接続のデコレーターパターン実装
- **重要性**: 接続シーケンス、エラーハンドリング、状態遷移
- **iOS実装**: 接続プロセスの正確な再現に必須

#### MiWearDeviceStatusHandler$handler$2.smali
- **役割**: MiWearデバイス状態管理ハンドラー
- **重要性**: デバイス状態の監視、通知処理
- **プロトコル**: リアルタイム状態更新メカニズム

#### TaskState$O95LowBattery.smali
- **役割**: O95バッテリー低電力状態の管理
- **重要性**: 電力管理アルゴリズム、アラート機能
- **iOS実装**: バッテリー監視の精度向上

### 4. **Camera & Media Control**

#### SelfCheckingStepRequest$CheckingStepRequest$Camera.smali
- **役割**: カメラ機能のセルフチェック処理
- **重要性**: 撮影前の機能確認、品質制御
- **プロトコル**: カメラコマンドの正確な形式

#### SetMediaSetting$Companion$VideoDuration.smali
- **役割**: 動画撮影時間設定の制御
- **重要性**: メディア設定パラメータの詳細
- **iOS実装**: 撮影設定の完全再現

### 5. **WiFi & Network Connectivity**

#### ConnectMiWearAPFragment$handler$2.smali
- **役割**: MiWear AP接続処理のハンドラー
- **重要性**: Wi-Fi Direct接続、Soft-AP設定
- **プロトコル**: ネットワーク確立シーケンス

## 🔍 発見された重要プロトコル

### MiShow Service Protocol
```protobuf
// InterconnectionProtos$MiShow.smali より推定
message MiShow {
    optional SlideRequest slide_request = 1;
    optional Demo demo = 2;
    // メディア転送制御
}
```

### Device Connection Sequence
```kotlin
// O95DeviceDecorator$connectDevice$2.smali より推定
1. デバイススキャン開始
2. 特性発見 (AF00, FD2D, FE95)
3. 認証シーケンス
4. 状態同期
5. メディア取得準備
```

### Battery Management Protocol
```kotlin
// TaskState$O95LowBattery.smali より推定
- 低電力閾値: 15%
- 警告表示: バッテリーアイコン + 通知
- 省電力モード自動移行
```

## 📋 未発見・要追加抽出クラス

### 高優先度
1. **VisionPayService.smali 系**
   - QR決済処理 (Alipay deep-link)
   - PayPay実装の参考として重要

2. **Transport Layer詳細**
   - Wi-Fi Direct UDP通信の実装
   - ファイル転送のチャンク処理

3. **Initial Pairing Sequence**
   - 初回ペアリングの詳細プロトコル
   - 認証キー交換メカニズム

### 検索コマンド候補
```bash
# VisionPayサービス検索
find . -name "*Vision*" -o -name "*Pay*" -o -name "*QR*" | grep -i service

# Transport層検索  
find . -name "*Transport*" -o -name "*UDP*" -o -name "*P2P*"

# 初期ペアリング検索
find . -name "*Pair*" -o -name "*Auth*" -o -name "*Bond*"
```

## 🎯 iOS実装への影響

### 1. **接続シーケンス改善**
- O95DeviceDecoratorのパターンを参考にしたエラーハンドリング
- MiWearDeviceStatusHandlerの状態管理ロジック採用

### 2. **メディア転送最適化**
- MiShowプロトコルの正確な実装
- チャンク転送とプログレス表示

### 3. **電力管理精度向上**
- O95LowBatteryの閾値とアルゴリズム採用
- 省電力モードの自動制御

### 4. **WiFi設定機能完成**
- ConnectMiWearAPFragmentのAP接続ロジック
- Wi-Fi Direct通信の実装

これらのコアクラスにより、iOS実装の完全性が大幅に向上し、本家アプリとほぼ同等の機能を実現できます。