# Xiaomi AI Glass (O95) - Essential Analysis Files

## Overview
Critical files extracted from decoded Xiaomi AI Glass companion app (eco-android-glass.apk v1.0.1) for ChatGPT analysis.

**Original APK:** 339MB, Package: `com.xiaomi.superhexa`

## Files Included

### 1. AndroidManifest.xml
- App permissions and component declarations
- Bluetooth, WiFi, camera permissions
- Service definitions for Glass communication
- Companion Device API usage

### 2. AfterSaleTestSpeakerViewModel$startSpeakerTest$1.smali  
- **Key Discovery**: Contains audio routing implementation
- Shows HFP (Hands-Free Profile) usage for Glass speakers
- Critical for understanding audio streaming protocol

### 3. core_classes/ - 本命クラス (Core Classes)
#### **BLE Management**
- `BaseObservableBleManager.smali` - BLE connection foundation
- `O95DeviceDecorator$connectDevice$2.smali` - Connection sequence
- `MiWearDeviceStatusHandler$handler$2.smali` - Device state management

#### **Media Transfer Protocol**  
- `InterconnectionProtos$MiShow.smali` - MiShow protobuf definition
- `MiWearMediaHandler$syncMediaFileData$1$media$1.smali` - Media sync core
- `O95DownloadMediaFileService$mediaDownloadHelper$2.smali` - Download service

#### **Camera & Control**
- `SelfCheckingStepRequest$CheckingStepRequest$Camera.smali` - Camera commands
- `SetMediaSetting$Companion$VideoDuration.smali` - Video settings

#### **WiFi & Network**
- `ConnectMiWearAPFragment$handler$2.smali` - WiFi AP connection
- `TaskState$O95LowBattery.smali` - Battery management

## Key Findings for iOS Implementation

### Audio Routing Protocol
From `AfterSaleTestSpeakerViewModel` analysis:
- Uses Android's `AudioManager.startBluetoothSco()` 
- Enables `setBluetoothScoOn(true)` for HFP connection
- Routes audio through Bluetooth SCO (Synchronous Connection-Oriented) link

### Required iOS Implementation
```swift
// HFP-optimized audio session
try audioSession.setCategory(.playAndRecord, 
                           mode: .voiceChat,  // Key: HFP optimization
                           options: [.allowBluetooth])

// Glass-specific audio command (AF07 characteristic)
let audioCommand = Data([0x01, 0x01, 0x01])  // Audio control + Enable + HFP
```

### Bluetooth Characteristics Discovered
- **AF07**: Command write (audio control, WiFi config)
- **AF08**: Status read (battery level, device state) 
- **FF11**: Notifications from Glass
- **005E**: Media control (photo/video commands)
- **005F**: Audio control (speaker routing)

### Battery Protocol
- Custom O95 protocol: `0x02 0x02 [battery_level]`
- Not standard Battery Service (180F/2A19)
- Uses AF08 characteristic for status reading
- Low battery threshold: 15% (from `TaskState$O95LowBattery.smali`)

### WiFi Configuration  
- Dual method: BLE commands + HTTP API
- AF07 characteristic with structured packets
- Format: `0x03 [ssid_length] [ssid] [password_length] [password]`
- WiFi AP connection via `ConnectMiWearAPFragment$handler$2.smali`

### Media Transfer Discovery
- **MiShow Service**: Protobuf-based media management
- **Sync Protocol**: From `MiWearMediaHandler$syncMediaFileData$1$media$1.smali`
- **Download Service**: Wi-Fi Direct transfer via `O95DownloadMediaFileService`
- **Camera Control**: Self-checking and duration settings

## Analysis Request for ChatGPT

### 🎯 Priority Analysis Areas

#### **1. Complete Protocol Reconstruction**
- Analyze `InterconnectionProtos$MiShow.smali` for complete protobuf schema
- Extract exact command sequences from `O95DeviceDecorator$connectDevice$2.smali`
- Identify missing characteristics from `BaseObservableBleManager.smali`

#### **2. Media Transfer Deep-Dive**
- `MiWearMediaHandler` sync mechanisms - chunk sizes, protocols
- `O95DownloadMediaFileService` - Wi-Fi Direct/UDP transfer details
- File format support and compression algorithms

#### **3. Still Missing Critical Classes**
Please identify if these patterns exist in the provided files:
- **VisionPayService** - QR payment (Alipay → PayPay conversion)
- **Transport Layer** - UDP/P2P transfer specifics  
- **Initial Pairing** - First-time device authentication

#### **4. iOS Implementation Gaps**
Compare provided Android implementations with our current iOS code:
- Connection sequence improvements
- Error handling patterns
- State management optimization
- Protocol command format validation

### 🚀 Expected Outcomes
1. **Complete BLE command dictionary**
2. **Media transfer protocol specification**  
3. **Missing functionality identification**
4. **iOS implementation recommendations**

The goal is to achieve 100% functional parity between the original Android app and our iOS implementation for Xiaomi AI Glass control.