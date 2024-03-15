class PDFFileGenerator {
  void generate() {
    print('Generating PDF file');
  }
}

class TextFileGenerator {
  void generate() {
    print('Generating text file');
  }
}

class FileGenerator {
  void generate(String type) {
    if (type == 'pdf') {
      PDFFileGenerator().generate();
    } else if (type == 'text') {
      TextFileGenerator().generate();
    }
  }
}

void main() {
  var fileGenerator = FileGenerator();
  fileGenerator.generate('pdf');
  fileGenerator.generate('text');
}
