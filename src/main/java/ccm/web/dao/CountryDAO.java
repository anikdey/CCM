package ccm.web.dao;

import ccm.web.models.Country;
import java.util.List;

public interface CountryDAO {

    List<Country> findAll();

    void saveCountry(Country country);

    boolean isUniqueCountryName(String countryName);

    List<Country> searchCountryByName(String countryName);

    Country findCountryById(int id);

    Country findCountryByCode(String code);

    void updateCountryById(int id, Country country);

    void deleteCountryById(int id);

    public String getLastInsertId();

    List<Country> showCategoryWithPaginition(int startPosition, int endPosition);
}
