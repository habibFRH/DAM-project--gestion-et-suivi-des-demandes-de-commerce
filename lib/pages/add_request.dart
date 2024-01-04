// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import '../components/textFormField.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  int _currentstep = 0;
  final TextEditingController companynamecontroller = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController activitytypeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController idnumberController = TextEditingController();
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Request',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromRGBO(94, 23, 235, 1),
        ),
        body: Column(
          children: [
            Expanded(
                child: Stepper(
                    currentStep: _currentstep,
                    type: StepperType.vertical,
                    physics: const ScrollPhysics(),
                    onStepTapped: (int Index) {
                      setState(() {
                        _currentstep = Index;
                      });
                    },
                    onStepContinue: () {
                      if (_currentstep != 2) {
                        setState(() {
                          _currentstep += 1;
                        });
                      }
                    },
                    onStepCancel: () {
                      if (_currentstep != 0) {
                        setState(() {
                          _currentstep -= 1;
                        });
                      }
                    },
                    steps: [
                  Step(
                    title: const Text("Company information"),
                    content: Column(
                      children: [
                        CustomTextForm(
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          label: "Company name",
                          hinttext: 'Enter Your company name',
                          mycontroller: companynamecontroller,
                        ),
                        CustomTextForm(
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          label: "Address",
                          hinttext: 'Enter Your address',
                          mycontroller: addressController,
                        ),
                        CustomTextForm(
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          label: "Phone Number",
                          hinttext: 'Enter Your phone number',
                          mycontroller: numberController,
                        ),
                        CustomTextForm(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          label: "Email",
                          hinttext: 'Enter Your email',
                          mycontroller: emailController,
                        ),
                        CustomTextForm(
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          label: "Activty Type",
                          hinttext: 'Enter Your activity type',
                          mycontroller: activitytypeController,
                        ),
                      ],
                    ),
                    isActive: _currentstep >= 0,
                    state: _currentstep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                      isActive: _currentstep >= 0,
                      state: _currentstep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                      title:
                          const Text("Personal information of the applicant"),
                      content: Column(
                        children: [
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            label: "Full Name",
                            hinttext: 'Enter Your full name',
                            mycontroller: nameController,
                          ),
                          // CustomTextForm(
                          //   obscureText: false,
                          //   keyboardType: TextInputType.datetime,
                          //   label: "Birthday date",
                          //   hinttext: 'Enter Your birthday',
                          //   mycontroller: birthdayController,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Birthady Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Container(
                                height: 10,
                              ),
                              DateTimeFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your birthday date",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                    ),
                                  ),
                                ),
                                firstDate: DateTime.now()
                                    .add(const Duration(days: 10)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 40)),
                                initialPickerDateTime: DateTime.now()
                                    .add(const Duration(days: 20)),
                                onChanged: (DateTime? value) {},
                              ),
                              Container(
                                height: 10,
                              ),
                            ],
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            label: "Nationality",
                            hinttext: 'Enter Your nationality',
                            mycontroller: nationalityController,
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            label: "Id Bumber",
                            hinttext: 'Enter Your id number',
                            mycontroller: idnumberController,
                          ),
                        ],
                      )),
                  Step(
                      isActive: _currentstep >= 0,
                      state: _currentstep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                      title: const Text("Statement"),
                      content: Column(
                        children: [
                          CheckboxListTile(
                            title: const Text("Confirmation"),
                            subtitle: const Text(
                                'I declare that all information provided is accurate and complete.'),
                            value: val,
                            onChanged: (bool? value) {
                              setState(() {
                                val = !val;
                              });
                            },
                            secondary: const Icon(Icons.check),
                          ),
                        ],
                      )),
                ]))
          ],
        ),
      ),
    );
  }
}
