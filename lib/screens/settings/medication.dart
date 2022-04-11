import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/settings/settings.dart';
import 'package:anxiety_align/screens/settings/medpage.dart';
import 'package:anxiety_align/widgets/bottombar.dart';

class Medication extends StatefulWidget {
  final bool noMedications;
  final String name;
  final int? dosage;
  final List<String> days;
  final int? frequency;
  final Function? previousMedication;
  final Function? nextMedication;
  final Function? removeMedication;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const Medication({
    Key? key,
    this.noMedications = false,
    this.name = '',
    this.dosage,
    this.days = const <String>[],
    this.frequency,
    this.previousMedication,
    this.nextMedication,
    this.removeMedication,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 15.0,
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: widget.noMedications ? Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      child: noMedicationBody()) : medicationBody(),
    bottomNavigationBar: const BottomBar()
  );

  Widget noMedicationBody() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      widget.widgetSpace,
      button(
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Settings())
        ),
        Icons.arrow_back_sharp
      ),
      widget.sectionSpace,
      title(),
      widget.widgetSpace,
      none(),
      widget.widgetSpace,
      addMedicationButton()
    ],
  );

  Widget medicationBody() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.widgetSpace,
            button(
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings())
              ),
              Icons.arrow_back_sharp
            ),
            widget.sectionSpace,
            title(),
            widget.widgetSpace,
            name(),
            widget.widgetSpace,
            dosage(),
            widget.widgetSpace,
            frequencyPerWeek(),
            widget.widgetSpace,
            frequencyPerDay()
          ]
        )
      ),
      widget.sectionSpace,
      traverseMedicationButtons(),
      widget.widgetSpace,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Row(
          children: <Widget>[
            removeMedicationButton(),
            const SizedBox(width: 10.0),
            addMedicationButton()
          ],
        )
      )
    ]
  );

  Widget button(Function onPressed, IconData icon) => OutlinedButton(
    onPressed: () => onPressed(),
    style: OutlinedButton.styleFrom(
      primary: Colors.black,
      backgroundColor: Colors.white,
      fixedSize: const Size(100.0, 40.0),
      side: BorderSide(
        color: widget.darkGreen,
        width: 3.0
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: widget.darkGreen)
      )
    ),
    child: Center(child: Icon(icon, size: 28))
  );

  Widget title() => const Text('Current\nMedications:',
    style: TextStyle(
      color: Colors.black,
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      height: 1.0,
      fontFamily: 'WingDings'
    )
  );

  Widget subtitle(String text) => Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'WingDings'
    )
  );

  Widget none() => const Text(
    'None',
    style: TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'WingDings'
    )
  );

  Widget textbox(String text, [double? width]) => Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: widget.darkGreen,
        width: 2.5
      ),
      borderRadius: BorderRadius.circular(10.0)
    ),
    width: width,
    height: 40.0,
    child: subtitle(text)
  );

  Widget name() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      subtitle('Name:'),
      widget.widgetSpace,
      textbox(widget.name, 350.0)
    ]
  );

  Widget dosage() => Row(
    children: <Widget>[
      subtitle('Dosage:'),
      const SizedBox(width: 5.0),
      textbox(
        widget.dosage == null ? '' : widget.dosage.toString(),
        150.0
      ),
      const SizedBox(width: 5.0),
      subtitle('mg')
    ]
  );

  Widget frequencyPerWeek() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      subtitle('Frequency per week:'),
      widget.widgetSpace,
      textbox(widget.days.join(' '), 350.0)
    ]
  );

  Widget frequencyPerDay() => Row(
    children: <Widget>[
      subtitle('Frequency per day:'),
      const SizedBox(width: 5.0),
      textbox(
        widget.frequency == null ? ' ' : widget.frequency.toString(),
        75.0
      )
    ]
  );

  Widget traverseMedicationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: widget.previousMedication == null
            ? const SizedBox(width: 100.0, height: 40.0) : button(
              () => widget.previousMedication!(),
              Icons.arrow_back_sharp
            )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: widget.nextMedication == null
            ? const SizedBox(width: 100.0, height: 40.0) : button(
              () => widget.nextMedication!(),
              Icons.arrow_forward_sharp
            )
        )
      ]
    );
  }

  Widget removeMedicationButton() => SizedBox(
    width: 50.0,
    height: 50.0,
    child: TextButton(
      onPressed: widget.removeMedication == null ? () { }
        : () => widget.removeMedication!(widget.name),
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      child: const Center(child: Icon(Icons.delete_rounded))
    )
  );

  Widget addMedicationButton() => OutlinedButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MedPage())
    ),
    style: OutlinedButton.styleFrom(
      primary: Colors.black,
      backgroundColor: Colors.white,
      fixedSize: const Size(200.0, 50.0),
      side: BorderSide(
        color: widget.darkGreen,
        width: 3.0
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: widget.darkGreen)
      )
    ),
    child: Center(child: subtitle('+ add another'))
  );
}
