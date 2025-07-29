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

### WiFi Configuration  
- Dual method: BLE commands + HTTP API
- AF07 characteristic with structured packets
- Format: `0x03 [ssid_length] [ssid] [password_length] [password]`

## Analysis Request for ChatGPT

Please analyze these files to identify:
1. Additional Bluetooth communication protocols
2. Media transfer mechanisms (MiShow service)
3. Power management commands (Always-On mode)
4. Device discovery and pairing sequences
5. Any missed characteristics or services

The goal is to ensure complete functional parity between the original Android app and our iOS implementation for Xiaomi AI Glass control.