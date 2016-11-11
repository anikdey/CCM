<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-10">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Update City</h3>
                    </div>
                    <sf:form commandName="city" method="POST" cssClass="form-horizontal" enctype="multipart/form-data">
                        <div class="box-body">
                            <c:set var="cityNameHasBindError"><sf:errors path="cityName"/></c:set>
                            <div class="form-group <c:if test="${!empty cityNameHasBindError}" > has-error </c:if> ">
                                <sf:label path="cityName" cssClass="col-sm-3 control-label">City Name</sf:label>
                                    <div class="col-sm-9">
                                    <sf:input path="cityName" cssClass="form-control" palceholder="City Name" />
                                    <p><sf:errors path="cityName" /></p>
                                </div>
                            </div>
                            <c:set var="cityDescriptionHasBindError"><sf:errors path="cityDescription"/></c:set>
                            <div class="form-group <c:if test="${!empty cityDescriptionHasBindError}" > has-error </c:if>">
                                <sf:label path="cityDescription" cssClass="col-sm-3 control-label">Description</sf:label>
                                    <div class="col-sm-9">
                                    <sf:textarea path="cityDescription" cssClass="form-control"/>
                                    <p><sf:errors path="cityDescription" /></p>
                                </div>
                            </div> 
                            <c:set var="cityDwellersHasBindError"><sf:errors path="cityDwellers"/></c:set>
                            <div class="form-group <c:if test="${!empty cityDwellersHasBindError}" > has-error </c:if> ">
                                <sf:label path="cityDwellers" cssClass="col-sm-3 control-label">Number Of Dwellers</sf:label>
                                    <div class="col-sm-9">
                                    <sf:input path="cityDwellers" type="number" cssClass="form-control" />
                                    <p><sf:errors path="cityDwellers" /></p>
                                </div>
                            </div>
                            <c:set var="cityLocationHasBindError"><sf:errors path="cityLocation"/></c:set>
                            <div class="form-group <c:if test="${!empty cityLocationHasBindError}" > has-error </c:if> ">
                                <sf:label path="cityLocation" cssClass="col-sm-3 control-label">Location</sf:label>
                                    <div class="col-sm-9">
                                    <sf:input path="cityLocation" cssClass="form-control" />
                                    <p><sf:errors path="cityLocation" /></p>
                                </div>
                            </div>
                            <c:set var="cityWeatherHasBindError"><sf:errors path="cityLocation"/></c:set>
                            <div class="form-group <c:if test="${!empty cityWeatherHasBindError}" > has-error </c:if> ">
                                <sf:label path="cityWeather" cssClass="col-sm-3 control-label">Weather</sf:label>
                                    <div class="col-sm-9">
                                    <sf:input path="cityWeather" cssClass="form-control" />
                                    <p><sf:errors path="cityWeather" /></p>
                                </div>
                            </div>
                            <c:set var="countryHasBindError"><sf:errors path="country"/></c:set>
                            <div class="form-group <c:if test="${!empty countryHasBindError}" > has-error </c:if> ">
                                <sf:label path="country" cssClass="col-sm-3 control-label">Country</sf:label>
                                    <div class="col-sm-9">
                                    <sf:select path="country" cssClass="form-control" required="required">
                                        <sf:options items="${countries}" itemValue="code" itemLabel="countryName"/>
                                    </sf:select>
                                    <p><sf:errors path="country" /></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" id="picture">Picture</label>
                                <div class="col-sm-9">
                                    <input type="file" name="picture" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3 control-label"></div>
                                <div class="col-sm-9">
                                    <input type="submit" value="Update City" class="btn btn-success" />
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </section>
</div>
