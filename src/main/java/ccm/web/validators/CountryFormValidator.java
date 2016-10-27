package ccm.web.validators;

import ccm.web.models.Country;
import ccm.web.services.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CountryFormValidator implements Validator {

    @Autowired
    private CountryService countryService;

    @Override
    public boolean supports(Class<?> clazz) {
        return Country.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "countryName", "NotEmpty.country.countryName");
    }

    public boolean isUniqueCountryName(String name, Errors errors) {
        if (!countryService.isUniqueCountryName(name)) {
            errors.rejectValue("countryName", "country.countryName");
            return false;
        }
        return true;
    }

}
