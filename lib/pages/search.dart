import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_royalty/state.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  int id = 0;
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
                  for (var invesment in state.investments)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => {
                        id = invesment.id,
                        state.setActiveInvestment(id),
                        Navigator.pushNamed(context, '/detail'),
                      },
                      child: InkResponse(
                        mouseCursor: SystemMouseCursors.click,
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          padding: const EdgeInsets.all(16.0),
                          width: 700,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                invesment.title,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "Seeking a total of ${invesment.total} dollars.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "The minimum investment amount is ${invesment.chunk} dollars.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                " Royalty paid out will be ${invesment.royalty} percent.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (state.investments.isEmpty)
                    const Text("No investment opportunities available")
                ])),
      ],
    );
  }
}
