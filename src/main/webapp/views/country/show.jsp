<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Dashboard
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Country : <c:out value="${country.countryName}" /></h3>
                    </div>
                    <div class="box-body">
                        <h4 class="box-title">Description</h4>
                        <p>
                            <c:out value="${country.countryDescription}" />
                        </p>      
                        <p>
                            <c:choose>
                                <c:when test="${!empty country.picturePath}">
                                    <c:url var='picFile' value='/admin/country/getPhoto/${country.picturePath}'/>
                                    <img height="110px" width="90px" alt='${country.picturePath}' src='${picFile}'/>
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