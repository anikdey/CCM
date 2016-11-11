<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="box">      	
                    <div class="box-header with-border">
                        <div class="row">
                            <div class="col-lg-4 text-right">
                                <h3 class="box-title" style="margin-top: 5px;">Search Country By Name :</h3>
                            </div>
                            <div class="col-lg-3">
                                <div class="box-tools ">
                                    <form class="form-inline" action="/search" method="POST">
                                        <div class="input-group pull-left input-group-sm" style="width: 350px;">
                                            <input type="text" name="countryName" class="form-control" placeholder="Search">
                                            <div class="input-group-btn">
                                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>