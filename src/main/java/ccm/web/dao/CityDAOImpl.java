package ccm.web.dao;

import ccm.web.models.City;
import ccm.web.models.Country;
import java.util.List;
import java.util.Random;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CityDAOImpl implements CityDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private City city;

    @Override
    public List<City> findAll() {
        return sessionFactory.getCurrentSession().createCriteria(City.class).list();
    }

    @Override
    public void saveCity(City city) {
        sessionFactory.getCurrentSession().persist(city);
    }

    @Override
    public boolean isUniqueCity(String cityName, int countryId) {
        boolean result = true;
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(City.class);
        criteria.add(Restrictions.eq("cityName", cityName));
        //criteria.add(Restrictions.eq("country", countryId));
        city = (City) criteria.uniqueResult();
        if (city != null) {
            result = false;
        }
        return result;
    }

    @Override
    public List<City> searchCityByName(String cityName) {
        return null;
    }

    @Override
    public List<City> searchCityByCountryId(String countryId) {
        return null;

//        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(City.class);
//        criteria.add(Restrictions.eq("country", countryId));
//        city = (City) criteria.uniqueResult();
//        return city;
    }

    @Override
    public City findCityById(int cityId) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(City.class);
        criteria.add(Restrictions.eq("id", cityId));
        city = (City) criteria.uniqueResult();
        return city;
    }

    @Override
    public void updateCityById(int cityId, City city) {
        Query query = sessionFactory.getCurrentSession().createQuery("update " + City.class.getSimpleName()
                + " set cityName = :cityName, "
                + "country = :country, "
                + "cityDwellers = :cityDwellers, "
                + "cityLocation = :cityLocation, "
                + "cityWeather = :cityWeather, "
                + "cityDescription = :cityDescription "
                // + "picturePath = :picturePath "
                + " where id = :id");
        query.setParameter("cityName", city.getCityName());
        query.setParameter("country", city.getCountry());
        query.setParameter("cityDwellers", city.getCityDwellers());
        query.setParameter("cityLocation", city.getCityLocation());
        query.setParameter("cityWeather", city.getCityWeather());
        query.setParameter("cityDescription", city.getCityDescription());
        //query.setParameter("picturePath", country.getPicturePath());
        query.setParameter("id", city.getId());
        query.executeUpdate(); // return type of this line is int.
    }

    @Override
    public void deleteCityById(int cityId) {
        City cityOjb = (City) sessionFactory.getCurrentSession().get(City.class, cityId);
        if (cityOjb != null) {
            sessionFactory.getCurrentSession().delete(cityOjb);
        }
    }

    @Override
    public String getLastInsertId() {
        final String sql = "SELECT max( i.id ) FROM " + City.class.getSimpleName() + " i";
        Integer lastId = (Integer) sessionFactory.getCurrentSession().createQuery(sql).uniqueResult();
        Random random = new Random();
        int randomNumber = random.nextInt(9999 - 1 + 1) + 1;
        if (lastId == null) {
            return "CITY-" + randomNumber + "-" + 1;
        } else {
            Integer nextInsertId = lastId + 1;
            return "CITY-" + randomNumber + "-" + nextInsertId;
        }
    }

}
