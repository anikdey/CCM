<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <div class="row">
                            <div class="col-lg-3"><h3 class="box-title">Country List</h3></div>
                            <div class="col-lg-5">
                                <c:if test="${!empty message}">
                                    <p><i class="icon fa fa-check"></i> ${message}</p>
                                </c:if>  
                            </div>
                            <div class="col-lg-1">
                                <a href="<c:url value="/admin/country/add"/>"><small class="label pull-right bg-green">Add New Country</small></a>
                            </div>
                            <div class="col-lg-3">
                                <div class="input-group pull-left input-group-sm" style="width: 150px;">
                                    <input type="text" name="countryName" class="form-control" placeholder="Search">
                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered table-striped table-hover">
                            <tbody>
                                <tr>
                                    <th>Country Name</th>
                                    <th class="col-md-6">Description</th>
                                    <th>Picture</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach items="${countries}" var="country">
                                    <tr>
                                        <td class="text-center"><c:out value="${country.countryName}" /></td>
                                        <td class="text-center"><c:out value="${country.countryDescription}" /></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${!empty country.picturePath}">
                                                    <c:url var='picFile' value='/admin/country/getPhotoTumb/${country.picturePath}'/>
                                                    <img alt='${country.picturePath}' height="40" width="40" src='${picFile}'/>
                                                </c:when>    
                                                <c:otherwise>
                                                    No Image Found
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/admin/country/edit/${country.id}" />"><span class="badge bg-green">Edit</span></a>
                                            <a href="<c:url value="/admin/country/show/${country.id}" />"><span class="badge bg-light-blue">Show</span></a>
                                            <a href="<c:url value="/admin/country/delete/${country.id}" />" onClick="return checkDelete();"><span class="badge bg-red">Delete</span></a>
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
