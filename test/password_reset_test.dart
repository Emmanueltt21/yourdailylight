import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

// Test to validate password reset functionality
void main() {
  group('Password Reset Tests', () {
    test('Password reset API endpoint validation', () async {
      const String baseUrl = 'https://yourdailylight.com/api/';
      const String resetPasswordUrl = baseUrl + 'resetPassword';
      
      print('Testing Password Reset API...');
      print('Endpoint: $resetPasswordUrl');
      
      final dio = Dio();
      
      try {
        // Test with a valid email format
        final response = await dio.post(
          resetPasswordUrl,
          data: jsonEncode({
            "data": {"email": "test@example.com"}
          }),
        );
        
        print('Status Code: ${response.statusCode}');
        print('Response Data Type: ${response.data.runtimeType}');
        
        // Check if response is JSON or HTML
        if (response.data is String && response.data.contains('<html>')) {
          print('❌ API returned HTML instead of JSON - endpoint may not exist');
          expect(false, true, reason: 'API endpoint returned HTML instead of JSON');
        } else {
          print('✅ API returned proper response format');
          
          if (response.statusCode == 200) {
            dynamic res = jsonDecode(response.data);
            print('Response Status: ${res["status"]}');
            print('Response Message: ${res["message"]}');
            expect(res, isA<Map<String, dynamic>>());
          }
        }
        
      } on DioException catch (e) {
        print('Dio Exception: ${e.message}');
        print('Error Type: ${e.type}');
        
        if (e.response != null) {
          print('Response Status: ${e.response?.statusCode}');
          print('Response Data: ${e.response?.data}');
          
          // If we get a 404, the endpoint doesn't exist
          if (e.response?.statusCode == 404) {
            print('❌ Password reset endpoint not found (404)');
            expect(false, true, reason: 'Password reset endpoint returns 404');
          }
        }
        
        rethrow;
      }
    });
    
    test('Email validation test', () {
      // Test email validation logic
      const validEmails = [
        'test@example.com',
        'user.name@domain.co.uk',
        'user+tag@example.org'
      ];
      
      const invalidEmails = [
        'invalid-email',
        '@domain.com',
        'user@',
        '',
        'user space@domain.com'
      ];
      
      for (String email in validEmails) {
        expect(isValidEmail(email), true, reason: '$email should be valid');
      }
      
      for (String email in invalidEmails) {
        expect(isValidEmail(email), false, reason: '$email should be invalid');
      }
    });
  });
}

// Simple email validation function
bool isValidEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}