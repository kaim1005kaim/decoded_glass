# Native Libraries Analysis

## Overview
This directory contains analysis of critical native libraries from the Xiaomi AI Glass APK. The actual .so files are too large for GitHub (33MB total) but are available in the original APK.

## Libraries Analyzed

### 1. libglassvisioncore.arcsoft.so (27MB)
- **Architecture**: ARM64-v8a 
- **Purpose**: Core computer vision processing
- **Vendor**: ArcSoft Corporation
- **Key Functions**: Face detection, AR processing, H264/H265 encoding
- **iOS Alternative**: Vision.framework + Core ML + Metal shaders

### 2. libavcodec.so (6.2MB)  
- **Architecture**: ARM64-v8a
- **Purpose**: Video codec library (FFmpeg-based)
- **Key Functions**: Video encoding/decoding, format conversion
- **iOS Alternative**: VideoToolbox.framework

### 3. libffmpeg_mediametadataretriever_jni.so (56KB)
- **Architecture**: ARM64-v8a  
- **Purpose**: Media metadata extraction
- **Key Functions**: EXIF data, video stream information
- **iOS Alternative**: AVFoundation metadata APIs

## Symbol Analysis
- `libglassvisioncore_symbols.txt` - Exported functions from vision library
- `libavcodec_symbols.txt` - Codec function symbols  
- `library_info.txt` - File type and architecture information

## Usage for iOS Implementation
1. **Symbol mapping** - Identify required functions for iOS alternatives
2. **API compatibility** - Understand codec parameters and formats
3. **Performance analysis** - Compare native vs iOS framework capabilities

## Extraction Commands
```bash
# From original APK location:
cp lib/arm64-v8a/libglassvisioncore.arcsoft.so .
cp lib/arm64-v8a/libavcodec.so .
cp lib/arm64-v8a/libffmpeg_mediametadataretriever_jni.so .

# Symbol extraction:
objdump -T libglassvisioncore.arcsoft.so > symbols.txt
nm -D libavcodec.so > codec_symbols.txt
```

These libraries contain the low-level processing logic that our iOS implementation needs to replicate using native iOS frameworks.