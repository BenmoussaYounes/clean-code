abstract class FileGeneratorStrategy {
  void generateFile(String content);
}

class TextFileGenerator implements FileGeneratorStrategy {
  @override
  void generateFile(String content) {
    print('Generating text file');
  }
}

class PdfFileGenerator implements FileGeneratorStrategy {
  @override
  void generateFile(String content) {
    print('Generating pdf file');
  }
}

class FileGenerator {
  FileGeneratorStrategy strategy;
  FileGenerator(this.strategy);
  void generateFile(String content) {
    strategy.generateFile(content);
  }
}

void main() {
  var textFileGenerator = FileGenerator(TextFileGenerator());
  textFileGenerator.generateFile('Hello world');

  var pdfFileGenerator = FileGenerator(PdfFileGenerator());
  pdfFileGenerator.generateFile('Hello world');
}
