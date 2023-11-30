import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_vending_machine/description.dart';
import 'package:medicine_vending_machine/splashcreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharma Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List medicines = [
    MedicineData(
        name: "Paracetamol",
        description:
            "Relieves pain and reduces fever. Commonly used for headaches and minor aches.",
        count: 50),
    MedicineData(
        name: "Aspirin",
        description:
            "Anti-inflammatory and pain-relieving medication. Also used to prevent blood clots.",
        count: 100),
    MedicineData(
        name: "Januvia",
        description:
            "Prescribed for type 2 diabetes. Helps control blood sugar levels.",
        count: 80),
    MedicineData(
        name: "Amoxicillin",
        description:
            "Antibiotic used to treat bacterial infections. Commonly prescribed for various conditions.",
        count: 90),
    MedicineData(
        name: "Metformin",
        description:
            "Oral medication for type 2 diabetes. Improves insulin sensitivity.",
        count: 100),
    MedicineData(
        name: "Lisinopril",
        description:
            "Angiotensin-converting enzyme (ACE) inhibitor. Treats high blood pressure and heart failure.",
        count: 60),
    MedicineData(
        name: "Levothyroxine",
        description:
            "Thyroid hormone replacement. Used to treat hypothyroidism.",
        count: 80),
    MedicineData(
        name: "Acrivastine",
        description:
            "Antihistamine for allergy relief. Helps alleviate symptoms like sneezing and itchy eyes.",
        count: 75),
    MedicineData(
        name: "Allopurinol",
        description:
            "Used to lower uric acid levels. Helps prevent gout and kidney stones.",
        count: 35)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        leading: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Hero(
              tag: "title",
              child: Text(
                "List of Available Medicine",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  final medicine = medicines[index];
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DescriptionPage(medicine: medicine),
                            ));
                      },
                      leading: SvgPicture.asset(
                        "assets/pill.svg",
                        height: 16,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicine.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            "Quantity Available: ${medicine.count.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineData {
  final String name;
  final String description;
  final int count;

  MedicineData(
      {required this.name, required this.description, required this.count});
}
