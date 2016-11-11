package ccm.web.controllers;

import ccm.web.models.City;
import ccm.web.services.CityService;
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
    private CityService cityService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listCity(Model model) {
        model.addAttribute("title", "Generate PDF");
        return "pdf/index";
    }

    @RequestMapping(value = "/generate-city-list-pdf", method = RequestMethod.GET)
    public ModelAndView generateCountryListPdf() {
        List<City> cities = cityService.findAll();
        return new ModelAndView("pdfView", "cities", cities);
    }
}
