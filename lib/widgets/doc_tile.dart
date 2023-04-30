import 'package:flutter/material.dart';
import 'package:veinline/models/doctor_model.dart';
import 'package:veinline/styles/style_utils.dart';

class DocTile extends StatefulWidget {
  final DoctorModel doctor;
  final Function()? onTap;
  const DocTile({super.key, this.onTap, required this.doctor});

  @override
  State<DocTile> createState() => _DocTileState();
}

class _DocTileState extends State<DocTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ChatPage(
        //         user: widget.user,
        //       ),
        //     ));
      },
      child: Ink(
        width: double.infinity,
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                widget.doctor.photoUrl.toString(),
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 240),
                  child: Text(
                    widget.doctor.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 18,
                        color: VeinLineColors.dark,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 240),
                  child: Text(
                    'Experience: ${widget.doctor.experience} Yrs',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
