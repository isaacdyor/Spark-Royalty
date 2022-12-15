import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_royalty/state.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<AppState>(
            builder: (context, state, child) => Column(children: [
                  Center(
                    child: Text(
                      "Investment Opportunities",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  state.investments.isNotEmpty
                      ? Container(
                          width: 700,
                          margin: const EdgeInsets.all(16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.investments[state.activeInvestment].title,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "Seeking a total of: ${state.investments[state.activeInvestment].total} dollars.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "The minimum investment amount is ${state.investments[state.activeInvestment].chunk} dollars.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Royalty paid out will be ${state.investments[state.activeInvestment].royalty} percent.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () => {
                                            Navigator.pushNamed(
                                                context, '/edit'),
                                          },
                                      child: const Text("Edit")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () => {
                                            state.deleteInvestment(
                                                state.activeInvestment),
                                            Navigator.pushNamed(
                                                context, '/search'),
                                          },
                                      child: const Text("Delete"))
                                ],
                              )
                            ],
                          ),
                        )
                      : const Text("No investment opportunities available")
                ])),
      ],
    );
  }
}
