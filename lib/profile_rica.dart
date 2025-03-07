import 'package:flutter/material.dart';

class RicaProfileScreen extends StatefulWidget {
  const RicaProfileScreen({super.key});

  @override
  State<RicaProfileScreen> createState() => _RicaProfileScreenState();
}

class _RicaProfileScreenState extends State<RicaProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Insert name here");
  final TextEditingController _emailController = TextEditingController(text: "Insert email here");

  bool isMusicChecked = false;
  bool isSportsChecked = false;
  bool isReadingChecked = false;

  void _printSelectedInterests() {
    String name = _nameController.text;
    String email = _emailController.text;

    List<String> selectedInterests = [];
    if (isMusicChecked) selectedInterests.add("Music");
    if (isSportsChecked) selectedInterests.add("Sports");
    if (isReadingChecked) selectedInterests.add("Reading");

    print("\n==============  RICA'S PROFILE  ==============");
    print("📌 Name: $name");
    print("📌 Email: $email");
    print("📌 Selected Interests: ${selectedInterests.isNotEmpty ? selectedInterests.join(', ') : 'None'}");
    print("=================================================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 216, 235), // Matches theme
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40), // Matches Aaron & Dianna
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40), // Matches Aaron & Dianna
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blueAccent, width: 4),
                          image: const DecorationImage(
                            image: AssetImage('assets/rica.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Hi, I'm Rica!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[100], // Matches theme
                        ),
                      ),
                      const SizedBox(height: 10),

                      const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[100], // Matches theme
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text("Interests", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Card(
                  elevation: 2,
                  color: Colors.grey[50],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text("Music"),
                          value: isMusicChecked,
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              isMusicChecked = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Sports"),
                          value: isSportsChecked,
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              isSportsChecked = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Reading"),
                          value: isReadingChecked,
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            setState(() {
                              isReadingChecked = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: ElevatedButton(
                    onPressed: _printSelectedInterests,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Matches Aaron & Dianna
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      minimumSize: const Size(150, 50),
                      elevation: 3,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
