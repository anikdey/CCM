<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<c:url value="/resources/" />dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${user.firstName} ${user.lastName}</p>
            </div>
        </div>
        <ul class="sidebar-menu">
            <li class="active treeview">
                <a href="<c:url value="/admin/"/>">
                    <i class="fa fa-dashboard"></i><span>Dashboard</span>
                </a>
            </li>
            <li class="treeview">
                <a href="<c:url value="/admin/country/"/>">
                    <i class="fa fa-share"></i> <span>Country</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<c:url value="/admin/country/"/>"><i class="fa fa-share"></i>Country List</a></li>
                    <li><a href="<c:url value="/admin/country/add"/>"><i class="fa fa-share"></i>Add New Country</a></li>
                    <li>
                        <a href="<c:url value="/admin/country/search"/>"><i class="fa fa-share"></i>Search Country</a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="<c:url value="/admin/city/"/>">
                    <i class="fa fa-share"></i> <span>City</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<c:url value="/admin/city/"/>"><i class="fa fa-share"></i>City List</a></li>
                    <li><a href="<c:url value="/admin/city/add"/>"><i class="fa fa-share"></i>Add New City</a></li>
                    <li>
                        <a href="<c:url value="/admin/city/search"/>"><i class="fa fa-share"></i>Search City</a>
                    </li>
                </ul>
            </li>
            <li class="active treeview">
                <a href="<c:url value="/admin/pdf/"/>">
                    <i class="fa fa-dashboard"></i><span>PDF</span>
                </a>
            </li>
        </ul>
    </section>
</aside>