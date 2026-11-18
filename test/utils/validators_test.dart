import 'package:flutter_test/flutter_test.dart';
import '../../lib/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    test('isValidEmail memvalidasi format email dengan benar', () {
      expect(Validators.isValidEmail('mahasiswa@amikom.ac.id'), isTrue);
      expect(Validators.isValidEmail('user.name@gmail.com'), isTrue);
      expect(Validators.isValidEmail('email-tanpa-at.com'), isFalse);
      expect(Validators.isValidEmail('user@domain'), isFalse);
      expect(Validators.isValidEmail(''), isFalse);
    });

    test('sanitize membersihkan karakter berbahaya HTML/XSS', () {
      const dangerousInput = '<script>alert("XSS")</script>';
      final sanitized = Validators.sanitize(dangerousInput);

      expect(sanitized.contains('<'), isFalse);
      expect(sanitized.contains('>'), isFalse);
      expect(sanitized.contains('"'), isFalse);
      expect(sanitized, '&lt;script&gt;alert(&quot;XSS&quot;)&lt;/script&gt;');
    });

    test('validateText memeriksa kekosongan dan rentang panjang teks', () {
      expect(
        Validators.validateText('', fieldName: 'Nama'),
        'Nama tidak boleh kosong',
      );
      expect(
        Validators.validateText('Ab', fieldName: 'Nama', minLength: 3, maxLength: 20),
        'Nama harus antara 3-20 karakter',
      );
      expect(
        Validators.validateText('Budi Santoso', fieldName: 'Nama', minLength: 3, maxLength: 20),
        isNull,
      );
    });

    test('validatePhone, validateUrl, dan validatePassword bekerja sesuai aturan', () {
      // Phone
      expect(Validators.validatePhone('081234567890'), isNull);
      expect(Validators.validatePhone('08123'), isNotNull);
      expect(Validators.validatePhone('0812abcd9012'), isNotNull);

      // URL
      expect(Validators.validateUrl('https://amikom.ac.id'), isNull);
      expect(Validators.validateUrl('ftp://amikom.ac.id'), isNotNull);

      // Password
      expect(Validators.validatePassword('Amikom#2026'), isNull);
      expect(Validators.validatePassword('lemah123'), isNotNull);
    });
  });
}