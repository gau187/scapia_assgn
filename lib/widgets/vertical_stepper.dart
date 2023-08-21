import 'package:flutter/material.dart';

class VerticalStepper {
  String date;
  String charge;
  bool isSuccess;

  VerticalStepper(
      {required this.date, required this.charge, required this.isSuccess});
}

class StepperWidget extends StatelessWidget {
  final List<VerticalStepper> verticalStepper;

  const StepperWidget({super.key, required this.verticalStepper});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: ListView(
        shrinkWrap: true,
        children: verticalStepper
            .map((step) => Row(
              children: [
                Column(
                  children: [
                    if (verticalStepper.indexOf(step) != 0)
                      Container(
                        height: 25,
                        child: const VerticalDivider(
                          thickness: 2.5,
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: step.isSuccess
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: step.isSuccess
                                  ? const Color(0xffD2F8B8)
                                  : const Color(0xffFFCAC5),
                              width: 4)),
                    ),
                    if (verticalStepper.indexOf(step) !=
                        verticalStepper.length - 1)
                      Container(
                        height: 25,
                        child: const VerticalDivider(
                          thickness: 2.5,
                        ),
                      ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(step.date,
                              style: const TextStyle(
                                  color: Color(0xff91A2B2),
                                  fontSize: 12))),
                      Flexible(
                          child: Text(step.charge,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12))),
                    ],
                  ),
                )
              ],
            ))
            .toList(),
      ),
    );
  }
}
