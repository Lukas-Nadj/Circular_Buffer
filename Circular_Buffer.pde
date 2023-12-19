String input = "";
circ_buff lo = new circ_buff(32, 0);
Boolean shift = false;


//stuff
import java.io.*;

Process myProcess;
InputStream myInputStream;
OutputStream myOutputStream;
PrintWriter myPrintWriter;
BufferedReader myBufferedReader;





void setup() {
  size(400, 400);
  textAlign(LEFT, CENTER);
  for (int i = 0; i<32; i++) {
    lo.add("");
  }
  try {
    // Start the external executable
    ProcessBuilder pb = new ProcessBuilder("./gpt4all-lora-quantized-OSX-m1");
    pb.directory(new File("/Users/lukasnadj/Projects/gpt4all/chat"));
    pb.redirectErrorStream(true);
    myProcess = pb.start();

    // Get the input and output streams for the external process
    myInputStream = myProcess.getInputStream();
    myOutputStream = myProcess.getOutputStream();

    // Create PrintWriter and BufferedReader objects for writing to and reading from the external process
    myPrintWriter = new PrintWriter(myOutputStream);
    myBufferedReader = new BufferedReader(new InputStreamReader(myInputStream));
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}



void draw() {
  background(0);
  try {
    while (myInputStream.available() > 0) {
      String output = myBufferedReader.readLine();
      if (output == null) {
        break;
      }
      lo.add(output);
    }
  }
  catch (IOException e) {
    e.printStackTrace();
  }
  fill(#67F275);
  for (int i = 0; i<32; i++) {
    text((String)lo.get(i), 10, i*12);
  }
  text("> "+input, 10, 32*12);
}


void keyPressed() {
  if (key==SHIFT) {
    shift = true;
  }
  if ((key >= '!' && key <= 'z'|| key == ' '||key >= 128 && key <= 255)) {  // 12865
    input = input + key;
    // lånt kode slutter
  } else if (key==BACKSPACE) {  //   opsummering: delete key
    try {
      input = input.substring(0, input.length()-1);
    }
    catch(StringIndexOutOfBoundsException e) {
    }
  } else if (key==ENTER) {

    lo.add(input);
    myPrintWriter.println(input);
    myPrintWriter.flush();
    input = "";
  }
}

void keyReleased() {
  if (key==SHIFT) {
    shift = false;
  }
}
