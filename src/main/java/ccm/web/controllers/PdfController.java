package ccm.web.controllers;

import ccm.web.models.Book;
import ccm.web.models.Country;
import ccm.web.services.CountryService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin/pdf")
public class PdfController {

    @Autowired
    private CountryService countryService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listCity(Model model) {
        model.addAttribute("title", "Generate PDF");
        return "pdf/index";
    }

    @RequestMapping(value = "/downloadPDF", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
        List<Country> countries = countryService.findAll();
        return new ModelAndView("pdfView", "countries", countries);
        
        
//         create some sample data
//        List<Book> listBooks = new ArrayList<Book>();
//        listBooks.add(new Book("Spring in Action", "Craig Walls", "1935182358","June 29th 2011", 31.98F));
//        listBooks.add(new Book("Spring in Practice", "Willie Wheeler, Joshua White","1935182056", "May 16th 2013", 31.95F));
//        listBooks.add(new Book("Pro Spring 3","Clarence Ho, Rob Harrop", "1430241071", "April 18th 2012", 31.85F));
//        listBooks.add(new Book("Spring Integration in Action", "Mark Fisher", "1935182439","September 26th 2012", 28.73F));
//        listBooks.add(new Book("Anik Dey 1", "Mark Fisher", "1935182439","September 26th 2012", 28.73F));
//        listBooks.add(new Book("Anik Dey 2", "Mark Fisher", "1935182439","September 26th 2012", 28.73F));
//         return a view which will be resolved by an excel view resolver
//        return new ModelAndView("pdfView", "listBooks", listBooks);
        
    }

}
