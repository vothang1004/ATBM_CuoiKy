package ego.wear.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;

public class CreatePDF {
	public static void main(String[] args) {
		try {
			// Create a new document
			Document document = new Document();

			// Create a PDF writer and set the output file
			PdfWriter.getInstance(document, new FileOutputStream("D:\\LAP-TRINH\\document.pdf"));

			// Open the document for writing
			document.open();

			// Add some content to the document
			document.add(new Paragraph("Hello, friends"));
			document.add(new Paragraph("I am Vo Minh thang"));
			document.add(new Paragraph("I am twenty one years old!"));

			// Close the document
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
