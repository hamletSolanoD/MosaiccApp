import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HCalendarSelector extends StatefulWidget {
  CarouselController _CalendarCarouselController;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _hcalendarState();
  }
}

class _HCalendarItem extends StatelessWidget {
  DateTime _toDisplay;
  OutlinedButton _innerButton;

  _HCalendarItem(DateTime ToDisplayDate) {
    _toDisplay = ToDisplayDate;
  }
  OutlinedButton InnerButton() {
    return _innerButton;
  }

  @override
  Widget build(BuildContext context) {
    _innerButton = OutlinedButton(
      
        child: Text(
      DateFormat('EEEE').format(_toDisplay).substring(0, 3) +
          "\n\n" +
          _toDisplay.day.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
    ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    primary: Colors.white,
    side: BorderSide(color: Colors.white, width: 1,),
    
    
    ));
    return Padding(padding: EdgeInsets.all(3), child: _innerButton);
  }
}

class _hcalendarState extends State<HCalendarSelector> {
  List<_HCalendarItem> _DatesToShow = [];
  List<String> _months = [
    "Jan.",
    "Feb.",
    "Mar.",
    "Apr.",
    "May.",
    "Jun.",
    "Jul.",
    "Aug.",
    "Sep.",
    "Oct.",
    "Nov.",
    "Dec."
  ];
  int _month;
  int day;
  CarouselController _datesCarouselController;

  _hcalendarState({DateTime DateToSelect}) {
    if (DateToSelect == null) {
      _month = DateTime.now().month;
      _DaysToShow(DateTime.now());
    } else {
      _month = DateToSelect.month;
      _DaysToShow(DateToSelect);
    }
  }
  void _DaysToShow(DateTime DateToSelect) {
    _DatesToShow.clear();
    for (int e = 0;
        e <= DateUtils.getDaysInMonth(DateToSelect.year, DateToSelect.month);
        e++) {
      _DatesToShow.add(
          _HCalendarItem(DateTime(DateToSelect.year, DateToSelect.month, e)));
    }
  }

  Widget _monthSelector() {
    return Align(
        alignment: Alignment.centerRight,
        child: DropdownButton<String>(
            value: _months[_month],
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.white),
            items: _months.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              for (int e = 0; e < 12; e++) {
                if (_months[e] == newValue) {
                  _month = e;
                }
              }
              setState(() {
                _DaysToShow(DateTime(DateTime.now().year, _month));
              });
            }));
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      carouselController: _datesCarouselController,
      items: _DatesToShow,
      options: CarouselOptions(
        
        initialPage: 0,
        height: 70,
        viewportFraction: 0.19,
        autoPlay: false,
        disableCenter: false,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(3),
        child: Column(children: [_monthSelector(), _buildCarousel()]));
  }
}
