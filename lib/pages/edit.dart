import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_royalty/state.dart';
import 'package:spark_royalty/widgets/text_input.dart';
import 'package:spark_royalty/widgets/number_input.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});

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
                      TextInput(
                          textEditingController: state
                              .investments[state.activeInvestment]
                              .titleController),
                      const SizedBox(height: 10),
                      const Text(
                        "Total Amount You Need Fundraised",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      NumberInput(
                          textEditingController: state
                              .investments[state.activeInvestment]
                              .totalController),
                      const SizedBox(height: 10),
                      const Text(
                        "Minimum investment amount",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      NumberInput(
                          textEditingController: state
                              .investments[state.activeInvestment]
                              .chunkController),
                      const SizedBox(height: 10),
                      const Text(
                        "What percent royalty will you pay out",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      NumberInput(
                          textEditingController: state
                              .investments[state.activeInvestment]
                              .royaltyController),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => {
                                state.investments[state.activeInvestment]
                                    .editInvestment(
                                  state.investments[state.activeInvestment]
                                      .titleController.text,
                                  double.tryParse(state
                                      .investments[state.activeInvestment]
                                      .totalController
                                      .text)!,
                                  double.tryParse(state
                                      .investments[state.activeInvestment]
                                      .chunkController
                                      .text)!,
                                  double.tryParse(state
                                      .investments[state.activeInvestment]
                                      .royaltyController
                                      .text)!,
                                ),
                                Navigator.pushNamed(context, '/detail'),
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
