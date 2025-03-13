import 'package:bmi_calculator/widgets/input_widgets_details.dart';
import 'package:flutter/material.dart';
import 'helper/bmi_chart_helper.dart';
import 'helper/bmi_meter_helper.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController ageController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  double? ans;
  double? lb;
  bool changeMaleGenderColor = false;
  bool changeFemaleGenderColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.yellow,
        elevation: 200,
        actions: [
          IconButton(
            onPressed: () {
              dispose();
            },
            icon: const Icon(Icons.replay_outlined),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputArea(),
              bmiChart(ans),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Normal Weight :  117.9 - 159.4 lb',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.2,
                    color: Colors.redAccent),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column inputArea() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: InputDetails(
              ageController: ageController,
              labelText: 'Age',
            )),
            const SizedBox(
              width: 45,
            ),
            Expanded(
                child: InputDetails(
                    ageController: feetController, labelText: "Ht (f)")),
            const SizedBox(
              width: 40,
            ),
            Expanded(
                child: InputDetails(
                    ageController: inchController, labelText: "Ht (in)")),
            const SizedBox(
              width: 50,
            ),
            const Text('ft'),
            const SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {}, child: const Icon(Icons.arrow_drop_down_outlined))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    child: InkWell(
                      onTap: () {
                        changeMaleGenderColor = true;
                        changeFemaleGenderColor = false;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.male,
                        color:
                            changeMaleGenderColor == true ? Colors.green : null,
                        size: 28,
                      ),
                    ),
                  ),
                  const Text(
                    ' | ',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 100,
                    child: InkWell(
                      onTap: () {
                        changeFemaleGenderColor = true;
                        changeMaleGenderColor = false;
                        setState(() {});
                      },
                      child: Icon(Icons.female,
                          color: changeFemaleGenderColor == true
                              ? Colors.green
                              : null,
                          size: 28),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 100,
              width: 110,
              child: TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: "Weight",
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
              onPressed: bmiCalculation,
              child: Text('Submit'),
            ),
          ],
        ),
        bmiMeter(ans),
      ],
    );
  }

  void bmiCalculation() {
    double? wt = double.tryParse(weightController.text) ?? 0;
    double? ft = double.tryParse(feetController.text) ?? 0;
    double? inch = double.tryParse(inchController.text) ?? 0;

    double? meter = (ft * 12 + inch) * 0.0254;
    ans = wt / (meter * meter);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ageController.clear();
    feetController.clear();
    inchController.clear();
    weightController.clear();
  }
}
