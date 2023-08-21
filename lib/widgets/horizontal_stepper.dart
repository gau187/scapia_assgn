import 'package:flutter/material.dart';

class FlightDetails {
  final String time;
  final String date;
  final String airportName;
  final String terminal;
  final String duration;
  final String flightName;
  final String flightNumber;
  final bool isLayover;

  FlightDetails(
      {required this.time,
      required this.date,
      required this.airportName,
      required this.terminal,
      required this.duration,
      required this.flightName,
      required this.flightNumber,
      this.isLayover = false});
}

class HorizontalStep {
  final FlightDetails basicDetails;

  const HorizontalStep({required this.basicDetails});
}

class HorizontalStepper extends StatelessWidget {
  final List<HorizontalStep> steps;

  const HorizontalStepper({super.key, required this.steps})
      : assert(steps.length > 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: steps
            .map((step) => Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xffFFC9AF),
                                      width: 3)),
                            ),
                            if (steps.indexOf(step) != steps.length - 1)
                              SizedBox(
                                  width: 100,
                                  child: Divider(
                                    height: 10,
                                    thickness: 2,
                                    color: step.basicDetails.isLayover
                                        ? Colors.red
                                        : const Color(0xffCCE3F8),
                                  )),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step.basicDetails.time,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  step.basicDetails.date,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                Text(
                                  step.basicDetails.airportName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                Text(
                                  step.basicDetails.terminal,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                      ],
                    ),
                    if (steps.indexOf(step) != steps.length - 1)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          step.basicDetails.isLayover
                              ? const Text(
                                  "Layover in",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              : Text(
                                  step.basicDetails.flightName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                          step.basicDetails.isLayover
                              ? Text(
                                  step.basicDetails.airportName,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              : Text(
                                  step.basicDetails.flightNumber,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                          Container(
                            margin: const EdgeInsets.only(top: 10,bottom: 140),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                                color: step.basicDetails.isLayover
                                    ? const Color(0xffFFF0F0)
                                    : const Color(0xffF0F6FC),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              child: Text(step.basicDetails.duration),
                            ),
                          ),
                        ],
                      ),
                    if (steps.indexOf(step) != steps.length - 1)
                      Container(
                          width: 100,
                          margin: const EdgeInsets.only(bottom: 90),
                          child: Divider(
                            height: 10,
                            thickness: 2,
                            color: step.basicDetails.isLayover
                                ? Colors.red
                                : const Color(0xffCCE3F8),
                          )),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
