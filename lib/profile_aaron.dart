import 'package:flutter/material.dart';

class AaronProfileScreen extends StatefulWidget {
  const AaronProfileScreen({super.key});

  @override
  State<AaronProfileScreen> createState() => _AaronProfileScreenState();
}

class _AaronProfileScreenState extends State<AaronProfileScreen> {
  final TextEditingController profilename = TextEditingController();
  final TextEditingController profileemail = TextEditingController();

  final Map<String, bool> _interests = {
    "Music": false,
    "Contemplating": false,
    "Depression": false,
    "Traveling": false,
    "Driving": false,
    "Studying": false,
    "Thesising": false,
  };

  void _submitData() {
    String name = profilename.text.trim();
    String email = profileemail.text.trim();
    List<String> selectedInterests = _interests.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    print("\n==============  YOUR PROFILE  ==============");
    print("📌 Name: $name");
    print("📌 Email: $email");
    print("📌 Selected Interests: ${selectedInterests.isNotEmpty ? selectedInterests.join(', ') : 'None'}");
    print("=================================================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 216, 235),
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40), 
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40), 
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 4),
                    image: const DecorationImage(
                      image: AssetImage('assets/aaron.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                const Text(
                  "Ako si Aaron Pearl :)",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: profilename,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: profileemail,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Choose your interests:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Card(
                  elevation: 2,
                  color: Colors.grey[50],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: _interests.keys.map((String key) {
                        return CheckboxListTile(
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          title: Text(key, style: const TextStyle(fontWeight: FontWeight.w500)),
                          value: _interests[key],
                          onChanged: (bool? value) {
                            setState(() {
                              _interests[key] = value!;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    minimumSize: const Size(150, 50),
                    elevation: 3,
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
