class Memory {
  // the operations simbols
  static const operations = const ['%', '/', '-', 'x', '+', '='];
  // initial value
  String _value = '0';
  String _operation;
  // the value
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  bool _wipeValue = false;

  void applyCommand(String command) {
    // call the clear function
    if (command == 'C') {
      _clear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      // increment value
      _addDigit(command);
    }
  }

  _setOperation(String newOperation) {
    // change to second element
    if (_bufferIndex == 0) {
      _operation = newOperation;
      _bufferIndex = 1;
    } else {
      //call the calculate function and clean the second element
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      //convert to string to show in device
      _value = _buffer[0].toString();
      // if the number was intenger, the function will hide the dot
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
      bool isEqualSign = newOperation == '=';
      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }

    _wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipevalue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipevalue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipevalue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    //convert the String to double
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  _clear() {
    _value = '0';
  }

  String get value {
    return _value;
  }
}
