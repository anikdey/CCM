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
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-10">
                <div class="box">
                    <c:if test="${!empty message}">
                        <div class="box-header with-border">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="alert alert-success alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h4>
                                            <i class="icon fa fa-check"></i> ${message}
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>          	
                    <div class="box-header with-border">
                        <h3 class="box-title">City List</h3>
                        <div class="box-tools">
                            <!--  <form class="form-inline" action="/CCM/city/search" method="POST">
                                     <div class="input-group pull-left input-group-sm" style="width: 150px;">
                                             <input type="text" name="cityName" class="form-control" placeholder="Search by Name">
                                             <div class="input-group-btn">
                                             <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                             </div>
                                     </div>
                             </form> -->
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
                                    <th>Picture</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach items="${cities}" var="city">
                                    <tr>
                                        <td><c:out  value="${city.id}" /></td>
                                        <td><c:out  value="${city.cityName}" /></td>
                                        <td><c:out  value="${city.cityDwellers}" /></td>
                                        <td><c:out  value="${city.country.countryName}" /></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${!empty city.picturePath}">
                                                    <c:url var='picFile' value='/admin/city/getPhotoTumb/${city.picturePath}'/>
                                                    <img alt='${city.picturePath}' height="40" width="40" src='${picFile}'/>
                                                </c:when>    
                                                <c:otherwise>
                                                    No Image Found
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/admin/city/edit/${city.id}" />"><span class="badge bg-green">Edit</span></a>
                                            <a href="<c:url value="/admin/city/show/${city.id}" />"><span class="badge bg-light-blue">Show</span></a>
                                            <a href="<c:url value="/admin/city/delete/${city.id}" />" onClick="return checkDelete();"><span class="badge bg-red">Delete</span></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin ">
                            <li><a href="#">«</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">»</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>