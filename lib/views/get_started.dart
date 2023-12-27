import 'package:flutter/material.dart';

import 'search_view.dart';

class GETStarted extends StatelessWidget {
  const GETStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/slide_1.jpg"),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(Size(200, 60)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              )),
              backgroundColor:
                  const MaterialStatePropertyAll(Colors.lightBlueAccent),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchView(),

              ));
            },
            child: const Text(
              "Searching Now 🔍",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
