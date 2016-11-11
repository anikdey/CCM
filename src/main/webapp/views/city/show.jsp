<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-8">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <p class="box-title">City : <c:out value="${city.cityName}" /></p><br/>
                        <p class="box-title">Country : <c:out value="${city.country.countryName}" /></p>
                    </div>
                    <div class="box-body">
                        <p class="box-title">Number Of Dwellers : <c:out value="${city.cityDwellers}" /></p>
                        <p class="box-title">Location : <c:out value="${city.cityLocation}" /></p>
                        <p class="box-title">Weather : <c:out value="${city.cityWeather}" /></p>
                        <p class="box-title">Description :</p>
                        <p>
                            <c:out value="${city.cityDescription}" />
                        </p>   
                        <p>
                            <c:choose>
                                <c:when test="${!empty city.picturePath}">
                                    <c:url var='picFile' value='/admin/city/getPhoto/${city.picturePath}'/>
                                    <img height="110px" width="90px" alt='${city.picturePath}' src='${picFile}'/>
                                </c:when>    
                                <c:otherwise>
                                    No Image Found
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>