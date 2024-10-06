import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

// class TranslateScreen extends StatefulWidget {
//   const TranslateScreen({super.key});
//   @override
//   State<TranslateScreen> createState() => _TranslateScreenState();
// }

// class _TranslateScreenState extends State<TranslateScreen> {
//   /// text controller
//   final _txtWord = TextEditingController();

//   late OpenAI openAI;

//   Future<CompleteResponse?>? _translateFuture;
//   void _translateEngToThai() async {
//     final request = CompleteText(
//         prompt: translateEngToThai(word: _txtWord.text.toString()),
//         maxTokens: 200,
//         model: Gpt3TurboInstruct());

//     setState(() {
//       _translateFuture = openAI.onCompletion(request: request);
//     });
//   }

//   ///parameter name is require
//   void gptFunctionCalling() async {
//     final request = ChatCompleteText(
//       messages: [
//         Messages(
//                 role: Role.user,
//                 content: "What is the weather like in Boston?",
//                 name: "get_current_weather")
//             .toJson(),
//       ],
//       maxToken: 200,
//       model: Gpt41106PreviewChatModel(),
//       tools: [
//         {
//           "type": "function",
//           "function": {
//             "name": "get_current_weather",
//             "description": "Get the current weather in a given location",
//             "parameters": {
//               "type": "object",
//               "properties": {
//                 "location": {
//                   "type": "string",
//                   "description": "The city and state, e.g. San Francisco, CA"
//                 },
//                 "unit": {
//                   "type": "string",
//                   "enum": ["celsius", "fahrenheit"]
//                 }
//               },
//               "required": ["location"]
//             }
//           }
//         }
//       ],
//       toolChoice: 'auto',
//     );

//     ChatCTResponse? response = await openAI.onChatCompletion(request: request);
//     debugPrint("$response");
//   }

//   void imageInput() async {
//     final request = ChatCompleteText(
//       messages: [
//         {
//           "role": "user",
//           "content": [
//             {"type": "text", "text": "What’s in this image?"},
//             {
//               "type": "image_url",
//               "image_url": {
//                 "url":
//                     "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"
//               }
//             }
//           ]
//         }
//       ],
//       maxToken: 200,
//       model: Gpt4VisionPreviewChatModel(),
//     );

//     ChatCTResponse? response = await openAI.onChatCompletion(request: request);
//     debugPrint("$response");
//   }

//   void gpt4() async {
//     final request = ChatCompleteText(messages: [
//       Messages(role: Role.assistant, content: 'Hello!').toJson(),
//     ], maxToken: 200, model: Gpt4ChatModel());

//     await openAI.onChatCompletion(request: request);
//   }

//   @override
//   void initState() {
//     openAI = OpenAI.instance.build(
//         token:
//             "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",
//         baseOption: HttpSetup(
//             receiveTimeout: const Duration(seconds: 20),
//             connectTimeout: const Duration(seconds: 20)),
//         enableLog: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//           child: Column(
//         children: [],
//       )),
//     );
//   }
// }

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final gemini = Gemini.instance;
  String? initialPrompt;

  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: 'How Can Help you...',
      user: ChatUser(
        id: '2',
        firstName: 'Nemo',
        lastName: 'ChatBot',
      ),
      createdAt: DateTime.now(),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trainBot();
  }

  void trainBot() async {
    // JSON dosyasını okuma
    String jsonString =
        await rootBundle.loadString('assets/jsons/prompts.json');

    // JSON verisini çözümleme
    final jsonResponse = json.decode(jsonString);
    initialPrompt =
        String.fromEnvironment(jsonResponse["system_prompt"]["description"]);
    print(jsonResponse.toString());
    await gemini.text(
        String.fromEnvironment(jsonResponse["system_prompt"]["description"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nemo Chat Bot'),
      ),
      body: DashChat(
        currentUser: ChatUser(
          id: '1',
          firstName: 'Charles',
          lastName: 'Leclerc',
        ),
        onSend: (ChatMessage m) async {
          setState(() {
            messages.insert(0, m);
          });

          await gemini
              .text("$initialPrompt\nUser: ${m.text}\n Nemo:")
              .then((value) {
            messages.insert(
              0,
              ChatMessage(
                text: value?.content?.parts?.last.text ?? "i forgot",
                user: ChatUser(
                  id: '2',
                  firstName: 'Nemo',
                  lastName: 'ChatBot',
                ),
                createdAt: DateTime.now(),
              ),
            );
          }).catchError((e) => print(e));
          setState(() {});
        },
        messages: messages,
      ),
    );
  }
}
