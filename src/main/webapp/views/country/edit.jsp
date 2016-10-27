<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Country
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Country</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-8 ">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Update Country</h3>
                    </div>
                    <sf:form commandName="country"  method="POST" cssClass="form-horizontal" enctype="multipart/form-data">
                        <div class="box-body">
                            <sf:hidden path="id" />
                            <c:set var="countryNameHasBindError"><sf:errors path="countryName"/></c:set>
                            <div class="form-group <c:if test="${!empty countryNameHasBindError}" > has-error </c:if> ">
                                <sf:label path="countryName" cssClass="col-sm-3 control-label">Country Name</sf:label>
                                    <div class="col-sm-9">
                                    <sf:input path="countryName" cssClass="form-control" />
                                    <p><sf:errors path="countryName" /></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <sf:label path="countryDescription" cssClass="col-sm-3 control-label">Description</sf:label>
                                    <div class="col-sm-9">
                                    <sf:textarea path="countryDescription" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" id="picture">Picture</label>
                                <div class="col-sm-9">
                                    <input type="file" name="picture" class="form-control" />
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="" class="col-sm-3 control-label"></label>
                                <div class="col-sm-3">
                                    <input type="submit" class="btn btn-success" value="Update Country" />
                                </div>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </section>
</div>
