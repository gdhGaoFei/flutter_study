// 加密的工具
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_210706_application_1/Untils/rsa/rsa_data.dart';

/**
 * 通过公钥加密
 * content = 加密前的文本
 */
Future<String> encodeString(String content) async {
  var publicKey = RSAKeyParser().parse(pubkey);
  final encrypter = Encrypter(RSA(publicKey: publicKey));

  List<int> sourceBytes = utf8.encode(content);
  int inputLen = sourceBytes.length;
  int maxLen = 117;
  List<int> totalBytes = [];

  for (var i = 0; i < inputLen; i += maxLen) {
    int endLen = inputLen - i;
    List<int> item;
    if (endLen > maxLen) {
      item = sourceBytes.sublist(i, i + maxLen);
    } else {
      item = sourceBytes.sublist(i, i + endLen);
    }
    totalBytes.addAll(encrypter.encryptBytes(item).bytes);
  }
  return base64.encode(totalBytes);
}
