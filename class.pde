class circ_buff {
  int begin = 0;
  int populated = 10;
  int length;
  Object[] data;
  circ_buff(Object[] data, int begin) {
    this.data = data;
    this.begin = begin;
    length = data.length;
  }

  circ_buff(int len, int begin) {
    this.begin = begin;
    data = new Object[len];
    for(int i = 0; i<data.length; i++){
      data[i] = 0;
    }
    length = len;
  }

  Object get(int index) {
    int temp = begin+index;
    if ((begin+index)>data.length-1) {
      temp = (begin+index)-data.length;
    }
    return data[temp];
  }

  void add(Object value) {
    populated += 1;
    data[begin] = value;
    if (begin==data.length-1) {
      this.begin = 0;
    } else {
      this.begin++;
    }
  }
}


/*

 class circ_buff {       // The class
 public:             // Access specifier
     int begin = 0;
     int length;
     Object[] data;
 };
 
 
 
 
 
 
 
 */
