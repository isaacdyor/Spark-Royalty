import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_royalty/state.dart';
import 'package:spark_royalty/widgets/text_input.dart';
import 'package:spark_royalty/widgets/number_input.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});

  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Investment myInvestment;
    return Center(
      child: Column(
        children: [
          Consumer<AppState>(
            builder: (context, state, child) => Column(
              children: [
                Text(
                  "Add New Investment",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      TextInput(textEditingController: textController),
                      const SizedBox(height: 10),
                      const Text(
                        "Total Amount You Need Fundraised",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      NumberInput(textEditingController: textController2),
                      const SizedBox(height: 10),
                      const Text(
                        "Minimum investment amount",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      NumberInput(textEditingController: textController3),
                      const SizedBox(height: 10),
                      const Text(
                        "What percent royalty will you pay out",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      NumberInput(textEditingController: textController4),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => {
                                myInvestment = Investment(
                                  textController.text,
                                  double.tryParse(textController2.text)!,
                                  double.tryParse(textController3.text)!,
                                  double.tryParse(textController4.text)!,
                                  state.investments.length,
                                ),
                                state.addInvestment(myInvestment),
                                Navigator.pushNamed(context, '/search'),
                              },
                          child: const Text("Complete")),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
