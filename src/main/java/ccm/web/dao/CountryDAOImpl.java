package ccm.web.dao;

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
public class CountryDAOImpl implements CountryDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Country country;

    @Override
    public List<Country> findAll() {
        return sessionFactory.getCurrentSession().createCriteria(Country.class).list();
    }

    @Override
    public void saveCountry(Country country) {
        sessionFactory.getCurrentSession().persist(country);
    }

    @Override
    public boolean isUniqueCountryName(String countryName) {
        boolean result = true;
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Country.class);
        criteria.add(Restrictions.eq("countryName", countryName));
        country = (Country) criteria.uniqueResult();
        if (country != null) {
            result = false;
        }
        return result;
    }

    @Override
    public List<Country> searchCountryByName(String countryName) {
        return null;
    }

    @Override
    public Country findCountryById(int id) {
        return (Country) sessionFactory.getCurrentSession().get(Country.class, id);
    }

    @Override
    public Country findCountryByCode(String code) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Country.class);
        criteria.add(Restrictions.eq("code", code));
        country = (Country) criteria.uniqueResult();
        return country;
    }

    @Override
    public void updateCountryById(int id, Country country) {
        Query query = sessionFactory.getCurrentSession().createQuery("update " + Country.class.getSimpleName()
                + " set countryName = :countryName, "
                + "countryDescription = :countryDescription "
               // + "picturePath = :picturePath "
                + " where id = :id");
        query.setParameter("countryName", country.getCountryName());
        query.setParameter("countryDescription", country.getCountryDescription());
        //query.setParameter("picturePath", country.getPicturePath());
        query.setParameter("id", country.getId());
        query.executeUpdate(); // return type of this line is int.

    }

    @Override
    public void deleteCountryById(int id) {
        Country countryObj = (Country) sessionFactory.getCurrentSession().get(Country.class, id);
        if (countryObj != null) {
            sessionFactory.getCurrentSession().delete(countryObj);
        }
    }

    @Override
    public String getLastInsertId() {
        final String sql = "SELECT max( i.id ) FROM " + Country.class.getSimpleName() + " i";
        Integer lastId = (Integer) sessionFactory.getCurrentSession().createQuery(sql).uniqueResult();
        Random random = new Random();
        int randomNumber = random.nextInt(9999 - 1 + 1) + 1;
        if (lastId == null) {
            return "COUNTRY-" + randomNumber + "-" + 1;
        } else {
            Integer nextInsertId = lastId + 1;
            return "COUNTRY-" + randomNumber + "-" + nextInsertId;
        }
    }

    @Override
    public List<Country> showCategoryWithPaginition(int startPosition, int endPosition) {
        Query query = sessionFactory.getCurrentSession().createQuery("From " + Country.class.getSimpleName());
        query.setFirstResult(startPosition);
        query.setMaxResults(endPosition);
        return query.list();
    }

}
