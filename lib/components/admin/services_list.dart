import 'package:ca_junction/theme/daytheme.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatefulWidget {
  final String selectedService;
  final Function(String) onServiceSelected;

  const ServiceList({
    Key? key,
    required this.selectedService,
    required this.onServiceSelected,
  }) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  String selectedService = 'All';


  void selectService(String service) {
    setState(() {
      selectedService = service;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Adjust the height according to your design
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ServiceItem(
            title: 'All',
            isSelected: selectedService == 'All',
            onSelect: () =>{
              widget.onServiceSelected('All'),
              selectService('All'),
            }
          ),
          ServiceItem(
            title: 'GST',
            isSelected: selectedService == 'GST',
            onSelect: () => {
              widget.onServiceSelected('GST'),
              selectService('GST'),
            }
          ),
          ServiceItem(
            title: 'Income Tax',
            isSelected: selectedService == 'Income Tax',
            onSelect: () => {
              widget.onServiceSelected('Income Tax'),
              selectService('Income Tax'),
            }
          ),
          ServiceItem(
            title: 'FSSAI',
            isSelected: selectedService == 'FSSAI',
            onSelect: () => {
              widget.onServiceSelected('FSSAI'),
              selectService('FSSAI'),
            }
          ),
          ServiceItem(
            title: 'DSE',
            isSelected: selectedService == 'DSE',
            onSelect: () =>{
              widget.onServiceSelected('DSE'),
              selectService('DSE'),
            }
          ),
          ServiceItem(
            title: 'MSME',
            isSelected: selectedService == 'MSME',
            onSelect: ()=>{
              selectService('MSME'),
              widget.onServiceSelected('DSE')
            },
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onSelect;

  const ServiceItem({
    required this.title,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 8),
        padding:const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(0),
          border: isSelected
              ?const Border(bottom: BorderSide(color: AppColors.primaryColor, width: 4))
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.primaryColor : AppColors.mutedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
