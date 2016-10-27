package ccm.web.services;

import ccm.web.dao.CityDAO;
import ccm.web.models.City;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CityServiceImpl implements CityService {

    @Autowired
    private CityDAO cityDao;

    @Override
    public List<City> findAll() {
        return cityDao.findAll();
    }

    @Override
    public void saveCity(City city) {
        cityDao.saveCity(city);
    }

    @Override
    public boolean isUniqueCity(String cityName, int countryId) {
        return cityDao.isUniqueCity(cityName, countryId);
    }

    @Override
    public List<City> searchCityByName(String cityName) {
        return cityDao.searchCityByName(cityName);
    }

    @Override
    public List<City> searchCityByCountryId(String countryId) {
        return cityDao.searchCityByCountryId(countryId);
    }

    @Override
    public City findCityById(int cityId) {
        return cityDao.findCityById(cityId);
    }

    @Override
    public void updateCityById(int cityId, City city) {
        cityDao.updateCityById(cityId, city);
    }

    @Override
    public void deleteCityById(int cityId) {
        cityDao.deleteCityById(cityId);
    }

    @Override
    public String getLastInsertId() {
        return cityDao.getLastInsertId();
    }

}
