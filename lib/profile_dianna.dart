import 'package:flutter/material.dart';

class DiannaProfileScreen extends StatefulWidget {
  const DiannaProfileScreen({super.key});

  @override
  State<DiannaProfileScreen> createState() => _DiannaProfileScreenState();
}

class _DiannaProfileScreenState extends State<DiannaProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Insert name here");
  final TextEditingController _emailController = TextEditingController(text: "Insert email here");

  bool isMusicChecked = false;
  bool isSportsChecked = false;
  bool isReadingChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 216, 235), // Matches Aaron's color theme
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40), 
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/network_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40),
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
                            image: AssetImage('assets/dianna.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Hi, I'm Dianna!",
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
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 10),

                      const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text("Interests", style: TextStyle(fontWeight: FontWeight.bold)),
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
                          onChanged: (bool? value) {
                            setState(() {
                              isMusicChecked = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Sports"),
                          value: isSportsChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isSportsChecked = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Reading"),
                          value: isReadingChecked,
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Matches Aaron's button color
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
      ),
    );
  }
}
