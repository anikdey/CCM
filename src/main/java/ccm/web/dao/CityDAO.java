package ccm.web.dao;

import ccm.web.models.City;
import java.util.List;

public interface CityDAO {

    List<City> findAll();

    void saveCity(City city);

    boolean isUniqueCity(String cityName, int countryId);

    List<City> searchCityByName(String cityName);

    List<City> searchCityByCountryId(String countryId);

    City findCityById(int cityId);

    void updateCityById(int cityId, City city);

    void deleteCityById(int cityId);

    public String getLastInsertId();
}
