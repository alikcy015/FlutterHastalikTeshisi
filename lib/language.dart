import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'english_ENGLİSH': {
          'welcome': 'WELCOME',
          'email': 'Email',
          'password': 'Password',
          'enter your email': 'Enter your email',
          'enter your password': 'Enter your password',
          'login': 'Login',
          'register': 'Register',
          'info': 'İnfo',
        },
        'türkçe_TÜRKÇE': {
          'welcome': 'HOŞGELDİNİZ',
          'email': 'Eposta',
          'password': 'Şifre',
          'enter your email': 'Email giriniz',
          'enter your password': 'Şifrenizi giriniz',
          'Login': 'Giriş Yap',
          'Register': 'Kayıt Ol',
          'info': 'Bilgi',
        },
        'deutsch_DEUTSCH': {
          'welcome': 'WELCOMEN',
        },
        'zazaki_ZAZAKİ': {
          'welcome': 'ŞIMA XEYR AMEY',
          'email': 'Eposte',
          'password': 'Şifre dekewten',
          'enter your email': 'Email dekewten',
          'enter your password': 'Şifrenizi dekewten',
          'Login': 'Dekewtiş Bıke',
          'Register': 'Kayıt Vıraziyayış',
          'info': 'Zanay',
        },
      };
}
