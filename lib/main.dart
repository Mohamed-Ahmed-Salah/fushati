import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fushati/src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';
import 'package:fushati/src/edit_profile/presentation/app/bloc/edit_profile_bloc.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/manage_card/presentation/app/bloc/card_transaction_bloc.dart';
import 'package:fushati/src/manage_card/presentation/app/delete_card_bloc/delete_card_bloc.dart';
import 'package:fushati/src/moyasar_transfer/presentation/app/bloc/transfer_money_bloc.dart';
import 'package:fushati/src/moyasar_transfer/presentation/app/cubit/amount_to_transfer_cubit.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/get_card_details_bloc/get_card_details_bloc.dart';
import 'package:fushati/src/on_boarding/presentation/app/bloc/cubit/page_cubit.dart';
import 'package:fushati/src/profile/presentation/app/delete_user_bloc/delete_user_bloc.dart';
import 'package:fushati/src/profile/presentation/app/profile_transaction_bloc/profile_transaction_bloc.dart';
import 'package:fushati/src/profile/presentation/app/user_info_bloc/user_info_bloc.dart';
import 'package:fushati/src/splash/presentation/app/app_redirection_bloc/app_redirection_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/res/theme/app_theme.dart';
import 'core/services/injection_container.dart';
import 'core/services/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'l10n/I10n.dart';
import 'src/app_language/presentation/app/cubit/app_language_cubit.dart';
import 'src/auth/presentation/app/blocs/customer_info_bloc/customer_info_bloc.dart';
import 'src/auth/presentation/app/blocs/otp_bloc/otp_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'src/home/presentation/apps/registration_fees_bloc/registration_fees_bloc.dart';
import 'src/new_card/presentation/app/nfc_availability_checker_cubit/nfc_scanner_cubit.dart';
import 'src/new_card/presentation/app/nfc_reader_bloc/nfc_reader_bloc.dart';
import 'src/splash/presentation/app/get_schools_bloc/get_schools_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  tz.initializeTimeZones();

  await init();

  runApp(
    BlocProvider<AppLanguageCubit>(
        create: (BuildContext context) =>
            AppLanguageCubit(cacheHelper: sl())..getLanguage(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AppRedirectionBloc>(
            create: (BuildContext context) => AppRedirectionBloc(),
          ),
          BlocProvider<AddNewCardBloc>(
            create: (BuildContext context) =>
                AddNewCardBloc(addCard: sl(), addCardByNumber: sl()),
          ),
          BlocProvider<CustomerInfoBloc>(
            create: (BuildContext context) => CustomerInfoBloc(
              addUserInfo: sl(),
              cacheHelper: sl(),
            ),
          ),
          BlocProvider<OtpBloc>(
            create: (BuildContext context) => OtpBloc(
              loginOrRegister: sl(),
              verifyOTP: sl(),
              cacheHelper: sl(),
            ),
          ),
          BlocProvider<AuthenticatorBloc>(
            create: (BuildContext context) => AuthenticatorBloc(
              loginOrRegister: sl(),
              cacheHelper: sl(),
            ),
          ),
          BlocProvider<GetCardDetailsBloc>(
            create: (BuildContext context) => GetCardDetailsBloc(
              getCardDetails: sl(),
            ),
          ),
          BlocProvider<DeleteCardBloc>(
              create: (BuildContext context) => DeleteCardBloc(
                    deleteCard: sl(),
                  )),
          BlocProvider<TransferMoneyBloc>(
              create: (BuildContext context) =>
                  TransferMoneyBloc(depositWallet: sl())),
          BlocProvider<AmountToTransferCubit>(
            create: (BuildContext context) => AmountToTransferCubit(),
          ),
          BlocProvider<CardsBloc>(
            create: (BuildContext context) => CardsBloc(
              getCard: sl(),
            ),
          ),
          BlocProvider<UserInfoBloc>(
            create: (BuildContext context) => UserInfoBloc(
              getUserInfo: sl(),
            ),
          ),
          BlocProvider<DeleteUserBloc>(
            create: (BuildContext context) => DeleteUserBloc(
              deleteUserInfo: sl(),
            ),
          ),
          BlocProvider<EditProfileBloc>(
            create: (BuildContext context) => EditProfileBloc(
              editUserInfo: sl(),
            ),
          ),
          BlocProvider<OnBoardingPageCubit>(
            create: (BuildContext context) =>
                OnBoardingPageCubit(cacheHelper: sl()),
          ),
          BlocProvider<CardTransactionBlocBloc>(
            create: (BuildContext context) =>
                CardTransactionBlocBloc(getCardTransactions: sl()),
          ),
          BlocProvider<ProfileTransactionBloc>(
            create: (BuildContext context) =>
                ProfileTransactionBloc(getUserTransactions: sl()),
          ),
          BlocProvider<NfcScannerCubit>(
            create: (BuildContext context) => NfcScannerCubit(),
          ),
          BlocProvider<NfcReaderBloc>(
            create: (BuildContext context) => NfcReaderBloc(),
          ),
          BlocProvider<RegistrationFeesBloc>(
            create: (BuildContext context) =>
                RegistrationFeesBloc(getRegistrationFeesUseCase: sl()),
          ),
          BlocProvider<GetSchoolsBloc>(
            create: (BuildContext context) => GetSchoolsBloc(getSchools: sl())
              ..add(const GetSchoolsEvent.getSchools()),
          ),
        ],
        child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
            builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            scaffoldMessengerKey: scaffoldKey,
            debugShowCheckedModeBanner: false,
            title: 'Fushati',
            locale: state.locale,
            theme: CustomTheme.lightTheme(),
          );
        }),
      );
    });
  }
}
///----------------------------------------------------------------
// import 'dart:async';
// import 'dart:io' show Platform, sleep;
// import 'dart:math';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:logging/logging.dart';
// import 'package:ndef/ndef.dart' as ndef;
// import 'package:ndef/utilities.dart';
//
// void main() {
//   Logger.root.level = Level.ALL; // defaults to Level.INFO
//   Logger.root.onRecord.listen((record) {
//     print('${record.level.name}: ${record.time}: ${record.message}');
//   });
//   runApp(MaterialApp(theme: ThemeData(useMaterial3: true), home: MyApp()));
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
//   String _platformVersion = '';
//   NFCAvailability _availability = NFCAvailability.not_supported;
//   NFCTag? _tag;
//   String? _result, _writeResult, _mifareResult;
//   late TabController _tabController;
//   List<ndef.NDEFRecord>? _records;
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (!kIsWeb)
//       _platformVersion = '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';
//     else
//       _platformVersion = 'Web';
//     initPlatformState();
//     _tabController = new TabController(length: 2, vsync: this);
//     _records = [];
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     NFCAvailability availability;
//     try {
//       availability = await FlutterNfcKit.nfcAvailability;
//     } on PlatformException {
//       availability = NFCAvailability.not_supported;
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       // _platformVersion = platformVersion;
//       _availability = availability;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             title: const Text('NFC Flutter Kit Example App'),
//             bottom: TabBar(
//               tabs: <Widget>[
//                 Tab(text: 'Read'),
//                 Tab(text: 'Write'),
//               ],
//               controller: _tabController,
//             )),
//         body: new TabBarView(controller: _tabController, children: <Widget>[
//           Scrollbar(
//               child: SingleChildScrollView(
//                   child: Center(
//                       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//                         const SizedBox(height: 20),
//                         Text('Running on: $_platformVersion\nNFC: $_availability'),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () async {
//                             try {
//                               NFCTag tag = await FlutterNfcKit.poll();
//                               setState(() {
//                                 _tag = tag;
//                               });
//                               await FlutterNfcKit.setIosAlertMessage("Working on it...");
//                               _mifareResult = null;
//                               if (tag.standard == "ISO 14443-4 (Type B)") {
//                                 String result1 = await FlutterNfcKit.transceive("00B0950000");
//                                 String result2 = await FlutterNfcKit.transceive("00A4040009A00000000386980701");
//                                 setState(() {
//                                   _result = '1: $result1\n2: $result2\n';
//                                 });
//                               } else if (tag.type == NFCTagType.iso18092) {
//                                 String result1 = await FlutterNfcKit.transceive("060080080100");
//                                 setState(() {
//                                   _result = '1: $result1\n';
//                                 });
//                               } else if (tag.ndefAvailable ?? false) {
//                                 var ndefRecords = await FlutterNfcKit.readNDEFRecords();
//                                 var ndefString = '';
//                                 for (int i = 0; i < ndefRecords.length; i++) {
//                                   ndefString += '${i + 1}: ${ndefRecords[i]}\n';
//                                 }
//                                 setState(() {
//                                   _result = ndefString;
//                                 });
//                               } else if (tag.type == NFCTagType.webusb) {
//                                 var r = await FlutterNfcKit.transceive("00A4040006D27600012401");
//                                 print(r);
//                               } else if (tag.type == NFCTagType.iso7816) {
//                                 // var r = await FlutterNfcKit.transceive(
//                                 //     "00A40400A0000030208000");
//                                 // print("r: $r");
//                                 try {
//                                   // Select PSE
//                                   String response =
//                                   await FlutterNfcKit.transceive("00A404000E325041592E5359532E4444463031");
//
//                                   print("response: $response");
//
//                                   // Select AID (example for Visa)
//                                   // response = await FlutterNfcKit.transceive("00A4040007A0000000031010");
//                                   List<String> aids = extractAIDs(response);
//                                   if (aids.isNotEmpty) {
//                                     for (var i = 0; i < aids.length; i++) {
//                                       String selectedAid = aids[i]; // Select the first AID for simplicity
//
//                                       String selectAidCommand = "00A40400" +
//                                           (selectedAid.length ~/ 2).toRadixString(16).padLeft(2, '0') +
//                                           selectedAid;
//                                       String aidSelectionResponse =
//                                       await FlutterNfcKit.transceive(selectAidCommand);
//                                       print("AID Selection Response: $aidSelectionResponse");
//                                       response = await FlutterNfcKit.transceive("00A4040007" + selectedAid);
//                                       print("GPO Response: $response");
//
//                                       // Parse AFL and read records (implement according to card's response)
//                                       // Example placeholders:
//                                       String afl = _parseAFL(response);
//                                       String recordCommand = afl; // Adjust based on AFL
//                                       String recordResponse = await FlutterNfcKit.transceive(recordCommand);
//                                       print("Record Response: $recordResponse");
//                                     }
//                                   } else {
//                                     print("No AID found in PSE response.");
//                                   }
//
//                                   // print("response: $response");
//
//                                   // Read PAN
//                                   // response = await FlutterNfcKit.transceive("00B2010C00");
//                                   //
//                                   // print("response: $response");
//
//                                   // Parse response to extract PAN
//                                   String pan = extractPAN(
//                                       response); // Implement the extraction logic based on your card's data format
//
//                                   print("Card Number (PAN): $pan");
//                                 } catch (e) {
//                                   print("Error reading card: $e");
//                                 }
//                               }
//                             } catch (e) {
//                               setState(() {
//                                 _result = 'error: $e';
//                               });
//                             }
//
//                             // Pretend that we are working
//                             if (!kIsWeb) sleep(new Duration(seconds: 1));
//                             await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
//                           },
//                           child: Text('Start polling'),
//                         ),
//                         const SizedBox(height: 10),
//                         Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: _tag != null
//                                 ? Text(
//                                 'ID: ${_tag!.id}\nStandard: ${_tag!.standard}\nType: ${_tag!.type}\nATQA: ${_tag!.atqa}\nSAK: ${_tag!.sak}\nHistorical Bytes: ${_tag!.historicalBytes}\nProtocol Info: ${_tag!.protocolInfo}\nApplication Data: ${_tag!.applicationData}\nHigher Layer Response: ${_tag!.hiLayerResponse}\nManufacturer: ${_tag!.manufacturer}\nSystem Code: ${_tag!.systemCode}\nDSF ID: ${_tag!.dsfId}\nNDEF Available: ${_tag!.ndefAvailable}\nNDEF Type: ${_tag!.ndefType}\nNDEF Writable: ${_tag!.ndefWritable}\nNDEF Can Make Read Only: ${_tag!.ndefCanMakeReadOnly}\nNDEF Capacity: ${_tag!.ndefCapacity}\nMifare Info:${_tag!.mifareInfo} Transceive Result:\n$_result\n\nBlock Message:\n$_mifareResult')
//                                 : const Text('No tag polled yet.')),
//                       ])))),
//           Center(
//             child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_records!.length != 0) {
//                         try {
//                           NFCTag tag = await FlutterNfcKit.poll();
//                           setState(() {
//                             _tag = tag;
//                           });
//                           if (tag.type == NFCTagType.mifare_ultralight ||
//                               tag.type == NFCTagType.mifare_classic ||
//                               tag.type == NFCTagType.iso15693) {
//                             await FlutterNfcKit.writeNDEFRecords(_records!);
//                             setState(() {
//                               _writeResult = 'OK';
//                             });
//                           } else {
//                             setState(() {
//                               _writeResult = 'error: NDEF not supported: ${tag.type}';
//                             });
//                           }
//                         } catch (e, stacktrace) {
//                           setState(() {
//                             _writeResult = 'error: $e';
//                           });
//                           print(stacktrace);
//                         } finally {
//                           await FlutterNfcKit.finish();
//                         }
//                       } else {
//                         setState(() {
//                           _writeResult = 'error: No record';
//                         });
//                       }
//                     },
//                     child: Text("Start writing"),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return SimpleDialog(title: Text("Record Type"), children: <Widget>[
//                               SimpleDialogOption(
//                                 child: Text("Text Record"),
//                                 onPressed: () async {
//                                   Navigator.pop(context);
//
//                                 },
//                               ),
//                               SimpleDialogOption(
//                                 child: Text("Uri Record"),
//                                 onPressed: () async {
//                                   Navigator.pop(context);
//
//                                 },
//                               ),
//                               SimpleDialogOption(
//                                 child: Text("Raw Record"),
//                                 onPressed: () async {
//
//                                 },
//                               ),
//                             ]);
//                           });
//                     },
//                     child: Text("Add record"),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text('Result: $_writeResult'),
//               const SizedBox(height: 10),
//               Expanded(
//                 flex: 1,
//                 child: ListView(
//                     shrinkWrap: true,
//                     children: List<Widget>.generate(
//                         _records!.length,
//                             (index) => GestureDetector(
//                           child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Text(
//                                   'id:${_records![index].idString}\ntnf:${_records![index].tnf}\ntype:${_records![index].type?.toHexString()}\npayload:${_records![index].payload?.toHexString()}\n')),
//                           onTap: () async {
//
//                           },
//                         ))),
//               ),
//             ]),
//           )
//         ]),
//       ),
//     );
//   }
//
//   String extractPAN(String response) {
//     // Convert the response from hexadecimal string to byte array
//     List<int> bytes = _hexToBytes(response);
//
//     // Search for the Track 2 equivalent data tag (usually 0x57)
//     for (int i = 0; i < bytes.length; i++) {
//       print("bytes: ${bytes[i]}");
//       if (bytes[i] == 0x4F) {
//         // 0x57 is the Track 2 Equivalent Data tag
//         int length = bytes[i + 1]; // The next byte is the length of the data
//
//         // The PAN is typically the first part of the Track 2 data up to the separator (0xD)
//         String track2Data = _bytesToHex(bytes.sublist(i + 2, i + 2 + length));
//         return track2Data.split('D')[0];
//       }
//     }
//
//     // If no Track 2 equivalent data is found, return an empty string or throw an error
//     return "";
//   }
//
// // Helper function to convert a hex string to a byte array
//   List<int> _hexToBytes(String hex) {
//     if (hex.length % 2 != 0) {
//       throw ArgumentError("Hex string must have an even length.");
//     }
//
//     List<int> bytes = [];
//     for (int i = 0; i < hex.length; i += 2) {
//       String byteString = hex.substring(i, i + 2);
//       int byteValue = int.parse(byteString, radix: 16);
//       bytes.add(byteValue);
//     }
//     return bytes;
//   }
//
// // Helper function to convert a byte array to a hex string
//   String _bytesToHex(List<int> bytes) {
//     return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join('').toUpperCase();
//   }
//
//   List<String> extractAIDs(String pseResponse) {
//     List<String> aids = [];
//     int currentIndex = 0;
//
//     while (currentIndex < pseResponse.length) {
//       // Look for the AID tag, typically '4F'
//       int aidIndex = pseResponse.indexOf("4F", currentIndex);
//
//       if (aidIndex == -1) {
//         break; // No more AIDs found
//       }
//
//       // Length of the AID (next byte after '4F')
//       int aidLength = int.parse(pseResponse.substring(aidIndex + 2, aidIndex + 4), radix: 16) * 2;
//
//       // Extract the AID
//       String aid = pseResponse.substring(aidIndex + 4, aidIndex + 4 + aidLength);
//
//       // Add to the list of AIDs
//       aids.add(aid);
//
//       // Move to the next part of the response
//       currentIndex = aidIndex + 4 + aidLength;
//     }
//
//     return aids;
//   }
//
//   String _parseAFL(String gpoResponse) {
//     const aflTag = '94';  // AFL tag in hex
//
//     // Find the index of AFL tag
//     final aflTagIndex = gpoResponse.indexOf(aflTag);
//
//     if (aflTagIndex == -1) {
//       return "AFL tag not found in GPO response";
//     }
//
//     // Extract AFL length
//     final aflLengthHex = gpoResponse.substring(aflTagIndex + 2, aflTagIndex + 4);
//     final aflLength = int.tryParse(aflLengthHex, radix: 16);
//
//     if (aflLength == null || aflLength <= 0) {
//       return "Invalid AFL length";
//     }
//
//     // Extract AFL data safely
//     final aflStart = aflTagIndex + 4; // Skip tag and length
//     final aflEnd = aflStart + (aflLength * 2); // Length in bytes
//
//     if (aflEnd > gpoResponse.length) {
//       return "AFL data length exceeds GPO response length";
//     }
//
//     final aflDataHex = gpoResponse.substring(aflStart, aflEnd);
//
//     // Parse AFL Data
//     String parsedAFL = "";
//     int index = 0;
//
//     while (index < aflDataHex.length) {
//       try {
//         final sfi = int.parse(aflDataHex.substring(index, index + 2), radix: 16);
//         final recordCount = int.parse(aflDataHex.substring(index + 2, index + 4), radix: 16);
//         final firstRecord = int.parse(aflDataHex.substring(index + 4, index + 6), radix: 16);
//         final lastRecord = int.parse(aflDataHex.substring(index + 6, index + 8), radix: 16);
//
//         parsedAFL += "SFI: $sfi, Records: $firstRecord-$lastRecord\n";
//         index += 8; // Move to the next SFI record
//       } catch (e) {
//         return "Error parsing AFL data: $e";
//       }
//     }
//
//     return parsedAFL;
//   }
// }
