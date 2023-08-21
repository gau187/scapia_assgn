import 'package:flutter/material.dart';
import 'package:scapia_assgn/widgets/horizontal_stepper.dart';
import 'package:scapia_assgn/widgets/vertical_stepper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Steps", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            StepperWidget(
              verticalStepper: [
                VerticalStepper(
                    date: "Till 05th Jun'23, 02:00 PM",
                    charge: "₹ 0",
                    isSuccess: true),
                VerticalStepper(
                    date: "Till 05th Jun'23, 02:00 PM",
                    charge: "₹ 0",
                    isSuccess: true),
                VerticalStepper(
                    date:
                        "From 05th Jun'23, 02:00 PM, till 08th June'23, 2:00 PM",
                    charge: "100% of the booking amount will be charged.",
                    isSuccess: false),
                VerticalStepper(
                    date:
                        "From 05th Jun'23, 02:00 PM, till 08th June'23, 2:00 PM",
                    charge: "100% of the booking amount will be charged.",
                    isSuccess: false),
              ],
            ),
            const SizedBox(height: 50),
            HorizontalStepper(steps: [
              HorizontalStep(
                  basicDetails: FlightDetails(
                      time: "15:50",
                      date: "30th Jun 2023",
                      airportName: "Pune (PNQ)",
                      terminal: "Terminal 1",
                      flightName: "Spice Jet",
                      flightNumber: "SG-532",
                      duration: "01h45m")),
              HorizontalStep(
                  basicDetails: FlightDetails(
                      time: "17:35",
                      date: "30th Jun 2023",
                      airportName: "Bangalore",
                      terminal: "Terminal 1",
                      duration: "04h20m",
                      flightName: "Spice Jet",
                      flightNumber: "SG-532",
                      isLayover: true)),
              HorizontalStep(
                  basicDetails: FlightDetails(
                      time: "21:55",
                      date: "30th Jun 2023",
                      airportName: "Bangalore (BLR)",
                      terminal: "Terminal 1",
                      flightName: "Spice Jet",
                      flightNumber: "SG-198",
                      duration: "02h45m")),
              HorizontalStep(
                  basicDetails: FlightDetails(
                      time: "00:40",
                      date: "1st July 2023",
                      airportName: "Delhi (DEL)",
                      terminal: "Terminal 1C",
                      flightName: "",
                      flightNumber: "",
                      duration: "")),
            ]),
          ],
        ),
      ),
    );
  }
}
