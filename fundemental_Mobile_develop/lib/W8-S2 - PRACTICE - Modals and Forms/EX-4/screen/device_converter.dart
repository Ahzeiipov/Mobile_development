import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CurrencyType { euro, riels, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

//  1. Track Cash selected ;

class _DeviceConverterState extends State<DeviceConverter> {
  CurrencyType? _selectedCurrency = CurrencyType.euro;

//  declare attribute
  double _amountUSD = 0.0;
  double _convertedAmount = 0.0;

// define the conversion rates

  final Map<CurrencyType, double> _currencyRate = {
    CurrencyType.riels: 4000,
    CurrencyType.dong: 24000,
    CurrencyType.euro: 0.93,
  };

  void _convertCurrency() {
    setState(() {
      _convertedAmount = _amountUSD * (_currencyRate[_selectedCurrency] ?? 1.0);
    });
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          // input the value

          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollar',
                hintStyle: const TextStyle(color: Colors.white)),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                _amountUSD = double.tryParse(value) ?? 0.0;
              });
              //  pel ot mean ah nes it ot display nv value del yg convert tam kar selecte currency te
              _convertCurrency(); //   Trigger conversion whenever the input changes
            },
          ),
          const SizedBox(height: 30),

//         dropdown button

          DropdownButton<CurrencyType>(
              value: _selectedCurrency,
              items: CurrencyType.values.map((CurrencyType currency) {
                return DropdownMenuItem<CurrencyType>(
                    value: currency,
                    child: Text(currency.toString().split('.').last));
              }).toList(),
              onChanged: (CurrencyType? newCurrency) {
                setState(() {
                  _selectedCurrency = newCurrency;
                });
                // pel yg change the value hx yg hav ah nes mk use for convert the currency
                //  if ot mean ah ng teh vea ng ot covert teh
                _convertCurrency();
              }),
          // const Text("Device: (TODO !)"),

//          output
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                  '${_convertedAmount.toStringAsFixed(2)}')) // display converted amount
        ],
      )),
    );
  }
}
