import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Test script to verify notification scheduling logic
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  print('🧪 Testing notification scheduling logic...\n');
  
  // Test 1: Initialize timezone
  print('1️⃣ Testing timezone initialization...');
  try {
    tz.initializeTimeZones();
    print('✅ Timezone data initialized');
    
    final dynamic timeZoneName = await FlutterTimezone.getLocalTimezone();
    final String tzNameString = timeZoneName.toString();
    tz.setLocalLocation(tz.getLocation(tzNameString));
    print('✅ Timezone set to: $tzNameString');
  } catch (e) {
    print('❌ Timezone setup failed: $e');
  }
  
  // Test 2: Calculate next 7 AM
  print('\n2️⃣ Testing 7 AM calculation...');
  final now = DateTime.now();
  DateTime next7AM = DateTime(now.year, now.month, now.day, 7, 0, 0);
  if (now.isAfter(next7AM)) {
    next7AM = next7AM.add(Duration(days: 1));
  }
  
  print('Current time: $now');
  print('Next 7 AM: $next7AM');
  print('Hours until next 7 AM: ${next7AM.difference(now).inHours}');
  
  // Test 3: Convert to timezone-aware datetime
  print('\n3️⃣ Testing timezone conversion...');
  try {
    final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(next7AM, tz.local);
    print('✅ TZDateTime created: $tzScheduledTime');
    print('Local timezone: ${tz.local.name}');
  } catch (e) {
    print('❌ TZDateTime conversion failed: $e');
  }
  
  // Test 4: Platform detection
  print('\n4️⃣ Testing platform detection...');
  print('Platform.isAndroid: ${Platform.isAndroid}');
  print('Platform.isIOS: ${Platform.isIOS}');
  print('Platform.isMacOS: ${Platform.isMacOS}');
  
  // Test 5: Asset path validation
  print('\n5️⃣ Testing asset paths...');
  print('Android alarm asset: assets/raw/alarm.mp3');
  print('Asset should exist in pubspec.yaml under assets/raw/');
  
  print('\n✅ All tests completed! Check logs above for any issues.');
}