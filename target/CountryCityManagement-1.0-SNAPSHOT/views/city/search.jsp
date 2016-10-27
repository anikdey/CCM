<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            City
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Search City</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="box">      	
                    <div class="box-header with-border">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box-tools ">
                                    <form class="form-inline" action="/CCM/city/search" method="POST">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <div class="input-group pull-right input-group-sm" >
                                                        <input type="radio" name="searchCriteria" onClick="disableCountryDropdown()" id="cityNameRadio" value="byCityName" checked="checked" > By City
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group pull-left ">
                                                        <input type="text" name="cityName" id="cityNameInput" class="form-control col-md-12" placeholder="City Name">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="input-group pull-right input-group-sm" >
                                                        <input type="radio" onClick="disableCityInput()" name="searchCriteria" id="countryRadio" value="byCountryId" > By Country
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="input-group pull-left ">
                                                        <select  class="form-control col-md-12" name="countryId" id="selectCountry" >
                                                            <option value="">Select A Country</option>
                                                            <c:forEach items="${countries}" var="country">
                                                                <option value="${country.id}"><c:out value="${country.countryName}" /></option>
                                                            </c:forEach>
                                                        </select>


                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <input type="submit" value="Search" class="btn btn-success" />
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                    <script type="text/javascript">
                                        function disableCountryDropdown() {
                                            var selectCountry = document.getElementById("selectCountry");
                                            var cityNameInput = document.getElementById("cityNameInput");

                                            selectCountry.setAttribute("disabled", "disabled");
                                            cityNameInput.removeAttribute("disabled");


                                        }

                                        function disableCityInput() {
                                            var selectCountry = document.getElementById("selectCountry");
                                            var cityNameInput = document.getElementById("cityNameInput");
                                            cityNameInput.setAttribute("disabled", "disabled");
                                            selectCountry.removeAttribute("disabled");
                                        }


                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="box-body">
                        <table class="table table-bordered table-striped table-hover">
                            <tbody>
                                <tr>
                                    <th>ID</th>
                                    <th>City Name</th>
                                    <th>No Of Dwellers</th>
                                    <th>Country</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach items="${cities}" var="city">
                                    <tr>
                                        <td><c:out  value="${city.cityId}" /></td>
                                        <td><c:out  value="${city.cityName}" /></td>
                                        <td><c:out  value="${city.cityDwellers}" /></td>
                                        <td>
                                            <c:forEach items="${countries}" var="country">
                                                <c:if test="${ country.id == city.countryId }">
                                                    <c:out  value="${country.countryName}" />
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/city/edit/${city.cityId}" />"><span class="badge bg-green">Edit</span></a>
                                            <a href="<c:url value="/city/show/${city.cityId}" />"><span class="badge bg-light-blue">Show</span></a>
                                            <a href="<c:url value="/city/delete/${city.cityId}" />" onClick="checkDelete()"><span class="badge bg-red">Delete</span></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
















                </div>
            </div>
        </div>
    </section>
</div>
