package ccm.web.controllers;

import ccm.web.models.Country;
import ccm.web.services.CountryService;
import ccm.web.validators.CountryFormValidator;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/admin/country")
public class CountryController extends AbstractBaseController {

    @Autowired
    private CountryService countryService;
    @Autowired
    private CountryFormValidator countryFormValidator;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listCountry(Model model) {
        model.addAttribute("title", "Country List");
        model.addAttribute("countries", countryService.findAll());
        return "country/index";
    }

    @RequestMapping(value = "/showing/{startPosition}", method = RequestMethod.GET)
    public String pager(Model model, @PathVariable("startPosition") int startPosition
           // @PathVariable("endPosition") int endPosition
    ) {

        String mess = startPosition + " - " /* + endPosition */;
        model.addAttribute("totalCategories", mess);
        //model.addAttribute("totalCategories", categoryService.findAll().size());
        model.addAttribute("title", "Country List");
        model.addAttribute("countries", countryService.showCategoryWithPaginition(startPosition, 5));
        return "country/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String create(Model model) {
        model.addAttribute("title", "Add Country");
        model.addAttribute(new Country());
        return "country/create";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String saveCountry(Model model, @Valid Country country, BindingResult result,
            RedirectAttributes redirectAttributes, MultipartHttpServletRequest request) {

        country.setCode(countryService.getLastInsertId());
        countryFormValidator.isUniqueCountryName(country.getCountryName(), result);
        countryFormValidator.validate(country, result);
        if (result.hasErrors()) {
            model.addAttribute("title", "Add Country");
            return "country/create";
        }
        String picPath = multipartImageFileHandler(request, "picture");
        country.setPicturePath(picPath);
        countryService.saveCountry(country);
        redirectAttributes.addFlashAttribute("message", "Country was successfully inserted.");
        return "redirect:/admin/country/";
    }

    @RequestMapping(value = "show/{id}", method = RequestMethod.GET)
    public String show(Model model, @PathVariable("id") int id) {
        Country country = countryService.findCountryById(id);
        model.addAttribute("title", "Country - " + country.getCountryName());
        model.addAttribute("country", country);
        return "country/show";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") int id) {
        Country country = countryService.findCountryById(id);
        model.addAttribute("title", "Edit Country - " + country.getCountryName());
        model.addAttribute("country", country);
        return "country/edit";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String update(Model model, @PathVariable("id") int id, @Valid Country country, BindingResult result,
            RedirectAttributes redirectAttributes, MultipartHttpServletRequest request) {

        countryFormValidator.validate(country, result);
        if (result.hasErrors()) {
            model.addAttribute("title", "Edit Country");
            return "country/edit";
        }
        //String picPath = multipartImageFileHandler(request, "picture");
        //country.setPicturePath(picPath);
        countryService.updateCountryById(id, country);
        redirectAttributes.addFlashAttribute("message", "Country was successfully updated.");
        return "redirect:/admin/country/";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model) {
        model.addAttribute("title", "Search Country");
        return "country/search";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchResult(Model model, RedirectAttributes redirectAttributes,
            @RequestParam Map<String, String> countrySearch) {
        String countryName = countrySearch.get("countryName");
        model.addAttribute("countryName", countryName);
        model.addAttribute("title", "Search Country");
        model.addAttribute("countries", countryService.searchCountryByName(countryName));
        model.addAttribute("countryName", countryName);
        return "country/search_result";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteCountryById(Model model, @PathVariable("id") int id,
            RedirectAttributes redirectAttributes) {
        countryService.deleteCountryById(id);
        redirectAttributes.addFlashAttribute("message", "Successfully Deleted.");
        return "redirect:/admin/country/";
    }

}
