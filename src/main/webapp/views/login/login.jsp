<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="login-box">
    <div class="login-logo">
        <b>CC</b>M
    </div>
    <div class="login-box-body">
        <c:if test="${!empty success_message}">
            <div class="box-header with-border">
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h4>
                                <i class="icon fa fa-check"></i> ${success_message}
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </c:if> 
        <c:choose>
            <c:when test="${!empty message}">
                <p class="login-box-msg">${message}</p>
            </c:when>
            <c:otherwise>
                <p class="login-box-msg">Sign in to start your session</p>
            </c:otherwise>
        </c:choose>
        <c:if test="${not empty param.error}" >
            <p class="login-box-msg">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
        </c:if>
        <c:if test="${param.logout != null }" >
            You have been logged out.
        </c:if>
        <form class="form-signin" method="POST" action="${loginProcessingUrl}">
            <div class="form-group has-feedback">
                <input type="text" name="username" id="username" class="form-control" placeholder="Username" required="">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <div class="row">
                <div class="col-xs-4 col-xs-offset-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>          
                </div>
            </div> 
        </form>
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2 text-center">
                <a class="" href="<c:url value="/register/" />" class="text-center">Register a new membership</a>
            </div>
        </div>
    </div>
</div>