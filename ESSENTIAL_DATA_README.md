# Essential Data Collection - おすすめデータ 📊

## 🎯 Overview
This collection contains the most critical files for iOS implementation, protocol analysis, and automated code generation from the decoded Xiaomi AI Glass APK.

## 📁 Directory Structure

### 1. `protobuf/` - Protocol Buffer Definitions
#### **NearbyConnectFlow.proto**
- **Purpose**: Device discovery and connection flow protocol
- **Usage**: Generate Swift models with `protoc-gen-swift`
- **iOS Impact**: Automated pairing sequence implementation

#### **ProxyCmd.proto** 
- **Purpose**: Proxy command structure for BLE communication
- **Usage**: Generate Python parsers for Wireshark analysis
- **iOS Impact**: Command validation and error handling

**Usage Examples:**
```bash
# Generate Swift models
protoc --swift_out=. NearbyConnectFlow.proto

# Generate Python for Wireshark
protoc --python_out=. ProxyCmd.proto
```

### 2. `native_libs/` - Critical Native Libraries
#### **libglassvisioncore.arcsoft.so** (11.2MB)
- **Role**: Core computer vision processing for Glass
- **Contains**: H264/H265 encoding, AR processing, face detection
- **iOS Alternative**: Vision.framework + custom Metal shaders
- **Analysis**: `objdump -T` for symbol analysis

#### **libavcodec.so** (2.1MB)
- **Role**: Media codec for video compression
- **Contains**: Video encoding parameters, quality settings  
- **iOS Alternative**: VideoToolbox.framework
- **Critical**: Codec compatibility for Glass recordings

#### **libffmpeg_mediametadataretriever_jni.so** (890KB)
- **Role**: Media metadata extraction for transferred files
- **Contains**: EXIF data processing, video stream info
- **iOS Alternative**: AVFoundation metadata APIs

### 3. `assets/` - Configuration & Mapping Data
#### **o95_map.json** 
```json
{
  "1": {
    "eventName": "miwear_dev_active",
    "paramKeys": ["active_reason_id", "start_timestamp", "stop_timestamp", "duration_sec", "battery_value"]
  },
  "2": {
    "eventName": "miwear_dev_app_usage", 
    "paramKeys": ["device_app_id", "start_timestamp", "stop_timestamp", "duration_sec", "from", "endinfo", "value"]
  }
}
```
- **Purpose**: Event mapping for telemetry and analytics
- **iOS Usage**: Translate to Core Data model or UserDefaults
- **Critical**: Battery monitoring event structure

#### **hexaappinfo.json**
- **Purpose**: App configuration and version management
- **Contains**: Update URLs, feature flags, server endpoints
- **iOS Usage**: App configuration service integration

#### **asr_final.aac** (Sample Audio)
- **Purpose**: Audio format reference for Glass communication
- **Usage**: Test audio codec compatibility
- **iOS Impact**: AVAudioSession configuration validation

### 4. `payment_vision/` - QR Payment & Vision Recognition
#### **Common$PaymentType.smali**
- **Role**: Payment method enumeration (Alipay, WeChat Pay, etc.)
- **iOS Conversion**: 
  ```swift
  enum PaymentType {
    case alipay
    case wechatPay
    case payPay  // New for Japan
  }
  ```

#### **MultiModal$VisionRecognizeResult.smali**
- **Role**: QR code and visual recognition results
- **Contains**: Confidence scores, bounding boxes, recognition data
- **iOS Implementation**: Vision.framework + VNRecognizeTextRequest
- **PayPay Integration**: QR format conversion logic

### 5. `localization/` - Internationalization Data
#### **strings_default.xml** & **strings_zh_CN.xml**
- **Purpose**: Complete UI text for Chinese → Japanese translation
- **Contains**: 847 string resources with context
- **Usage**: Generate Swift LocalizedStringKey mappings
- **Tool**: Extract with custom script → strings.json → Localizable.strings

**Translation Pipeline:**
```bash
# Extract translatable strings
grep -o 'name="[^"]*">[^<]*' strings_zh_CN.xml > translation_base.txt

# Generate Swift localization keys
# Convert to Localizable.strings format for Xcode
```

## 🚀 Immediate Usage Recommendations

### **Phase 1: Protocol Generation (High Priority)**
1. **Generate Swift Protobuf models:**
   ```bash
   protoc --swift_out=../XiaomiGlassApp/Generated/ protobuf/*.proto
   ```

2. **Create Wireshark dissectors:**
   ```bash
   protoc --lua_out=. protobuf/*.proto  # For Wireshark analysis
   ```

### **Phase 2: Native Library Analysis**
1. **Symbol extraction:**
   ```bash
   objdump -T native_libs/libglassvisioncore.arcsoft.so > glass_symbols.txt
   nm -D native_libs/libavcodec.so > codec_symbols.txt
   ```

2. **iOS alternative mapping:**
   - Computer vision: Vision.framework + Core ML
   - Video codecs: VideoToolbox.framework  
   - Media processing: AVFoundation

### **Phase 3: Configuration Integration**
1. **Parse O95 event mapping:**
   ```swift
   struct O95Event {
     let id: Int
     let eventName: String
     let paramKeys: [String]
   }
   ```

2. **Localization automation:**
   - Extract 847 Chinese strings
   - Generate Japanese translations
   - Create Localizable.strings files

## 🔍 Missing High-Value Data (Next Extraction)

### **Still Needed:**
1. **VisionPayService complete implementation** - QR payment flow
2. **Bluetooth/WiFi packet captures** - Real protocol traces  
3. **Initial pairing logs** - Authentication sequences
4. **Sample media chunks** - H265 payload examples

### **Search Commands for Next Phase:**
```bash
# Find complete VisionPay implementation
find . -path "*vision*" -name "*.smali" | grep -i pay

# Extract pairing authentication
grep -r "PAIRING_KEY" . | head -20

# Find media chunk processors  
find . -name "*chunk*" -o -name "*h264*" -o -name "*h265*"
```

## 📊 File Size Summary
```
protobuf/           8KB   (2 .proto files)
native_libs/        14MB  (3 .so files) 
assets/             12KB  (3 config files + 1 audio)
payment_vision/     15KB  (2 .smali files)
localization/       45KB  (2 strings.xml files)
────────────────────────
Total:              14MB  (vs original 30GB)
```

## 🎯 Expected Impact on iOS Implementation

### **Immediate Benefits:**
- **Automated Swift model generation** from protobuf
- **Complete localization** with 847 Chinese → Japanese strings
- **Payment system foundation** for PayPay integration
- **Native codec compatibility** understanding

### **Next Phase Capabilities:**
- **Protocol validation** with Wireshark dissectors
- **Media format compliance** testing
- **Complete QR payment flow** implementation
- **Professional localization** with context

This essential data collection provides the foundation for achieving 100% functional parity with the original Android app while enabling automated development workflows.