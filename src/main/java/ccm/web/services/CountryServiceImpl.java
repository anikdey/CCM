package ccm.web.services;

import ccm.web.dao.CountryDAO;
import ccm.web.models.Country;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CountryServiceImpl implements CountryService {
    
    @Autowired
    private CountryDAO countryDao;
    
    @Override
    public List<Country> findAll() {
        return countryDao.findAll();
    }
    
    @Override
    public void saveCountry(Country country) {
        countryDao.saveCountry(country);
    }
    
    @Override
    public boolean isUniqueCountryName(String countryName) {
        return countryDao.isUniqueCountryName(countryName);
    }
    
    @Override
    public List<Country> searchCountryByName(String countryName) {
        return countryDao.searchCountryByName(countryName);
    }
    
    @Override
    public Country findCountryById(int id) {
        return countryDao.findCountryById(id);
    }
    
    @Override
    public Country findCountryByCode(String code) {
        return countryDao.findCountryByCode(code);
    }
    
    @Override
    public void updateCountryById(int id, Country country) {
        countryDao.updateCountryById(id, country);
    }
    
    @Override
    public void deleteCountryById(int id) {
        countryDao.deleteCountryById(id);
    }

    @Override
    public String getLastInsertId() {
        return countryDao.getLastInsertId();
    }

    @Override
    public List<Country> showCategoryWithPaginition(int startPosition, int endPosition) {
        return countryDao.showCategoryWithPaginition(startPosition, endPosition);
    }
    
}
