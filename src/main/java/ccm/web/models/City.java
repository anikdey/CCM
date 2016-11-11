package ccm.web.models;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Table(name = "CITY")
public class City implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "CODE", length = 30, unique = true, nullable = false)
    private String code;
    @Size(min = 3, max = 30)
    @Column(name = "CITY_NAME", length = 100, nullable = false)
    private String cityName;
    @ManyToOne
    private Country country;
    @Min(1)
    @Column(name = "NUMBER_OF_DWELLERS", length = 100, nullable = false)
    private String cityDwellers;
    @Column(name = "CITY_LOCATION", nullable = true)
    private String cityLocation;
    @Column(name = "CITY_WEATHER", nullable = true)
    private String cityWeather;
    @Column(name = "CITY_DESCRIPTION", nullable = true)
    private String cityDescription;
    @Column(name = "PICTURE", nullable = true)
    private String picturePath;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getCityDwellers() {
        return cityDwellers;
    }

    public void setCityDwellers(String cityDwellers) {
        this.cityDwellers = cityDwellers;
    }

    public String getCityLocation() {
        return cityLocation;
    }

    public void setCityLocation(String cityLocation) {
        this.cityLocation = cityLocation;
    }

    public String getCityWeather() {
        return cityWeather;
    }

    public void setCityWeather(String cityWeather) {
        this.cityWeather = cityWeather;
    }

    public String getCityDescription() {
        return cityDescription;
    }

    public void setCityDescription(String cityDescription) {
        this.cityDescription = cityDescription;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

}
