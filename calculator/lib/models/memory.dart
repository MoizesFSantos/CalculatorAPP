class Memory {
  // initial value 
  String _value = '0';

  void applyCommand(String command) {
    // call the clear function
    if (command == 'C') {
      _clear();
    }else{
      // increment value
      _value += command;
    }
  }

  _clear() {
    _value = '0';
  }

  String get value {
    return _value;
  }
}
