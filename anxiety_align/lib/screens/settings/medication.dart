import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/settings/settings.dart';
import 'package:anxiety_align/screens/settings/medpage.dart';
import 'package:anxiety_align/widgets/bottombar.dart';

class Medication extends StatefulWidget {
  final bool noMedications;
  final String name;
  final double? dosage;
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
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    children.add(widget.sectionSpace);
    children.add(Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Settings())
        ),
        icon: const Icon(
          Icons.arrow_back_sharp,
          size: 40,
          color: Colors.black
        )
      )
    ));
    children.add(widget.sectionSpace);
    children.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      child: title()
    ));
    if(widget.noMedications) {
      children.add(widget.widgetSpace);
      children.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: none()
      ));
      children.add(widget.widgetSpace);
      children.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: addMedicationButton()
      ));
    }
    else {
      children.add(Expanded(child: Container()));
      children.add(medicationBody());
      children.add(widget.sectionSpace);
      children.add(traverseMedicationButtons());
      children.add(Expanded(child: Container()));
      children.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Row(
          children: <Widget>[
            removeMedicationButton(),
            Expanded(child: Container()),
            addMedicationButton()
          ],
        )
      ));
    }
    children.add(widget.widgetSpace);
    return Scaffold(
      backgroundColor: widget.lightGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      ),
      bottomNavigationBar: const BottomBar()
    );
  }

  Widget medicationBody() => Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            name(),
            widget.widgetSpace,
            widget.widgetSpace,
            dosage(),
            widget.widgetSpace,
            frequencyPerWeek(),
            widget.widgetSpace,
            widget.widgetSpace,
            frequencyPerDay()
          ]
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

  Widget title() => const Text('Current Medications:',
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
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0)
    ),
    width: width,
    height: 35.0,
    child: subtitle(text)
  );

  Widget name() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      subtitle('Name:'),
      const SizedBox(height: 5.0),
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
      const SizedBox(height: 5.0),
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
        : () => widget.removeMedication!(),
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      child: const Center(child: Icon(Icons.delete_rounded))
    )
  );

  Widget addMedicationButton() => SizedBox(
    width: 50.0,
    height: 50.0,
    child: TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MedPage())
      ),
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.white,
        side: BorderSide(
          color: widget.darkGreen,
          width: 3.0
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      child: const Center(child: Icon(Icons.add))
    )
  );
}
