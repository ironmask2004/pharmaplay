import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:pharmaplay_server/src/utilites/config.dart';

sendVerificationCodeByMail(String verificationcode, String email) async {
  print('The MAil with Code $verificationcode');

  print('  hase been Cent to $email');
  // try {
  sendMail(email, 'Verifcation code from pharmaplay', verificationcode);
  // } catch (err) {
  //   print(err.toString());
//  }
}

void sendMail(String toEmail, String mailSubject, String mailBody,
    {String? SenderMail}) async {
  final Env sysEnv = Env();
  String username = sysEnv.smtpEmail;
  String password = sysEnv.smtpPassword;

  SenderMail = SenderMail ?? username;
  print('email  username:  $username  SenderMail : $SenderMail  ******');

  //'1093543773313-dhs6sfjvvvrsr6r2823grqq83qmlbncn.apps.googleusercontent.com'; //
  //String accessToken = sysEnv.smtpPassword;

  //'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'; //

  final smtpServer = gmail(username, password);
  // gmailRelaySaslXoauth2(username, accessToken);
  final equivalentMessage = Message()
    ..from = Address(SenderMail, 'Pharmaplay APP')
    ..recipients.add(Address(toEmail))
    //..ccRecipients.addAll([Address(email)])
    //..bccRecipients.add('bccAddress@example.com')
    ..subject = '$mailSubject:: ${DateTime.now()}'
    //..text =
    //     mailBody; //  'This is the plain text.\nThis is line 2 of the text part.'
    ..html =
        "<h1> $mailBody </h1>\n<p>الرجاء اعادة الدخول إلى البرنامج واستخدام كود التحقق الوارد في هذه الرسالة </p>";

  await send(equivalentMessage, smtpServer);
}
