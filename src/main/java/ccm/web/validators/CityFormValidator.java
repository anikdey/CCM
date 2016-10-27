package ccm.web.validators;

import ccm.web.models.City;
import ccm.web.services.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CityFormValidator implements Validator {

    @Autowired
    private CityService cityService;

    @Override
    public boolean supports(Class<?> clazz) {
        return City.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cityName", "NotEmpty.city.cityName");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cityDescription", "NotEmpty.city.cityDescription");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cityDwellers", "NotEmpty.city.cityDwellers");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cityLocation", "NotEmpty.city.cityLocation");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cityWeather", "NotEmpty.city.cityWeather");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "country", "NotEmpty.city.country");
    }

    public boolean isUniqueCity(String cityName, int countryId, Errors errors) {
        if (!cityService.isUniqueCity(cityName, countryId)) {
            errors.rejectValue("cityName", "city.alreadyTaken");
            return false;
        }
        return true;
    }

}
