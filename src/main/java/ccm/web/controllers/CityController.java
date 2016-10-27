package ccm.web.controllers;

import ccm.web.models.City;
import ccm.web.models.Country;
import ccm.web.services.CityService;
import ccm.web.services.CountryService;
import ccm.web.validators.CityFormValidator;
import java.beans.PropertyEditorSupport;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/admin/city")
public class CityController extends AbstractBaseController {

    private City city;

    @Autowired
    private CityService cityService;

    @Autowired
    private CountryService countryService;
    @Autowired
    private CityFormValidator cityFormValidator;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listCity(Model model) {
        model.addAttribute("title", "City List");
        model.addAttribute("cities", cityService.findAll());
        return "city/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String create(Model model) {
        model.addAttribute("title", "Add City");
        model.addAttribute("countries", countryService.findAll());
        model.addAttribute(new City());
        return "city/create";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String save(Model model, @Valid City city, BindingResult result,
            RedirectAttributes redirectAttributes, MultipartHttpServletRequest request) {

        city.setCode(countryService.getLastInsertId());
        cityFormValidator.isUniqueCity(city.getCityName(), city.getCountry().getId(), result);
        cityFormValidator.validate(city, result);
        if (result.hasErrors()) {
            model.addAttribute("title", "Add City");
            model.addAttribute("countries", countryService.findAll());
            return "city/create";
        }
        String picPath = multipartImageFileHandler(request, "picture");
        city.setPicturePath(picPath);
        cityService.saveCity(city);
        redirectAttributes.addFlashAttribute("message", "City was successfully inserted.");
        return "redirect:/admin/city/";
    }

    @RequestMapping(value = "show/{id}", method = RequestMethod.GET)
    public String show(Model model, @PathVariable("id") int id) {
        city = cityService.findCityById(id);
        model.addAttribute("title", "City - " + city.getCityName());
        model.addAttribute("city", city);
        return "city/show";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("id") int id) {
        city = cityService.findCityById(id);
        model.addAttribute("countries", countryService.findAll());
        model.addAttribute("title", "Edit City - " + city.getCityName());
        model.addAttribute("city", city);
        return "city/edit";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String edit(Model model, @PathVariable("id") int id, @Valid City city, BindingResult result,
            RedirectAttributes redirectAttributes, MultipartHttpServletRequest request) {

        cityFormValidator.validate(city, result);
        if (result.hasErrors()) {
            model.addAttribute("title", "Edit City");
            model.addAttribute("countries", countryService.findAll());
            return "city/edit";
        }
        //String picPath = multipartImageFileHandler(request, "picture");
        //city.setPicturePath(picPath);
        cityService.updateCityById(id, city);
        redirectAttributes.addFlashAttribute("message", "City was successfully updated.");
        return "redirect:/admin/city/";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteCountryById(Model model, @PathVariable("id") int id,
            RedirectAttributes redirectAttributes) {
        cityService.deleteCityById(id);
        redirectAttributes.addFlashAttribute("message", "Successfully Deleted.");
        return "redirect:/admin/city/";
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        binder.registerCustomEditor(Country.class, "country", new CountryEditor());
    }

    private class CountryEditor extends PropertyEditorSupport {

        @Override
        public void setAsText(String text) {
            if (text != null && !text.isEmpty()) {
                Country country = (Country) countryService.findCountryByCode(text);
                setValue(country);
            }
        }

        @Override
        public String getAsText() {
            try {
                Country country = (Country) getValue();
                return country.getCode();
            } catch (Exception exception) {
            }
            return null;
        }
    }

}
