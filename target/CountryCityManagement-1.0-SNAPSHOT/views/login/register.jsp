<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="col-md-6 col-md-offset-3">
    <div class="login-logo">
        <b>CC</b>M
    </div>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-left: 100px;">Register a new membership</h3>
                        <a href="<c:url value="/" />" class="pull-right">Back To Login</a>
                    </div>
                    <div class="box-body">
                        <sf:form method="POST" commandName="user" cssClass="form-horizontal" enctype="multipart/form-data">
                            <c:set var="firstNameHasBindError"><sf:errors path="firstName"/></c:set>
                            <div class="form-group <c:if test="${!empty firstNameHasBindError}" > has-error </c:if> ">
                                <sf:label path="firstName" cssClass="control-label col-sm-4 text-center">First Name</sf:label>
                                    <div class="col-sm-8">
                                    <sf:input path="firstName" cssClass="form-control" />
                                    <p><sf:errors path="firstName" /></p>
                                </div>
                            </div>
                            <c:set var="lastNameHasBindError"><sf:errors path="lastName"/></c:set>
                            <div class="form-group <c:if test="${!empty lastNameHasBindError}" > has-error </c:if> ">
                                <sf:label path="lastName" cssClass="control-label col-sm-4 text-center">Last Name</sf:label>
                                    <div class="col-sm-8">
                                    <sf:input path="lastName" cssClass="form-control" />
                                    <p><sf:errors path="lastName" /></p>
                                </div>
                            </div>
                            <c:set var="emailHasBindError"><sf:errors path="email"/></c:set>
                            <div class="form-group <c:if test="${!empty emailHasBindError}" > has-error </c:if> ">
                                <sf:label path="email" cssClass="control-label col-sm-4 text-center">Email</sf:label>
                                    <div class="col-sm-8">
                                    <sf:input path="email" cssClass="form-control" />
                                    <p><sf:errors path="email" /></p>
                                </div>
                            </div>
                            <c:set var="usernameHasBindError"><sf:errors path="username"/></c:set>
                            <div class="form-group <c:if test="${!empty usernameHasBindError}" > has-error </c:if> ">
                                <sf:label path="username" cssClass="control-label col-sm-4 text-center">Username</sf:label>
                                    <div class="col-sm-8">
                                    <sf:input path="username" cssClass="form-control" />
                                    <p><sf:errors path="username" /></p>
                                </div>
                            </div>
                            <c:set var="passwordHasBindError"><sf:errors path="password"/></c:set>
                            <div class="form-group <c:if test="${!empty passwordHasBindError}" > has-error </c:if> ">
                                <sf:label path="password" cssClass="control-label col-sm-4 text-center">Password</sf:label>
                                    <div class="col-sm-8">
                                    <sf:password path="password" cssClass="form-control" />
                                    <p><sf:errors path="password" /></p>
                                </div>
                            </div>
                            <c:set var="confirmPasswordHasBindError"><sf:errors path="confirmPassword"/></c:set>
                            <div class="form-group <c:if test="${!empty confirmPasswordHasBindError}" > has-error </c:if> ">
                                <sf:label path="confirmPassword" cssClass="control-label col-sm-4 text-center">Confirm Password</sf:label>
                                    <div class="col-sm-8">
                                    <sf:password path="confirmPassword" cssClass="form-control" />
                                    <p><sf:errors path="confirmPassword" /></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" id="picture">Picture</label>
                                <div class="col-sm-8">
                                    <input type="file" name="picture" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="control-label col-sm-4"></div>
                                <div class="col-sm-8 text-left">
                                    <input type="submit" class="btn btn-info" value="Register" />
                                    <input type="reset" class="btn btn-danger" value="Reset" />
                                </div>
                            </div>
                        </sf:form>
                    </div>
                    <div class="box-footer">
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>