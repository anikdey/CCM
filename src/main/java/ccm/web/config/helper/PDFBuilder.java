package ccm.web.config.helper;

import ccm.web.models.City;
import ccm.web.models.Country;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PDFBuilder extends AbstractITextPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
            PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        List<City> listOfCountries = (List<City>) model.get("cities");
        doc.add(new Paragraph("City List"));
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[]{4.0f, 6.0f});
        table.setSpacingBefore(10);
        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.WHITE);
        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(5);
        // write table header
        cell.setPhrase(new Phrase("City Name", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Country Name", font));
        table.addCell(cell);
        for (City aCity : listOfCountries) {
            table.addCell(aCity.getCityName());
            table.addCell(aCity.getCountry().getCountryName());
        }
        doc.add(table);

    }
}
