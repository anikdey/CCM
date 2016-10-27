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
        <li class="active">Search Country</li>
      </ol>
    </section>
	<section class="content">
      <div class="row">
        <div class="col-md-10 col-md-offset-1">
          <div class="box">      	
   
            <div class="box-header with-border">
            	<div class="row">
            		<div class="col-md-3 col-md-offset-2">
            			<h3 class="box-title" style="margin-top: 5px;">Search Country By Name :</h3>
            		</div>
            		<div class="col-md-3">
	            	    <div class="box-tools ">
		            	    <form class="form-inline" action="/CCM/country/search" method="POST">
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
            <div class="box-body">
              <table class="table table-bordered table-striped table-hover">
              
                <tbody>
	                <tr>
	                  <th>ID</th>
	                  <th>Country Name</th>
	                  <th class="col-md-6">Description</th>
	                  <th>Action</th>
	                </tr>
	                <tr>
	                  <td>01.</td>
	                  <td>Bangladesh</td>
	                  <td>Nice</td>
	                  <td>
	                  	<a href=""><span class="badge bg-green">Edit</span></a>
	                  	<a href=""><span class="badge bg-light-blue">Show</span></a>
	                  	<a href=""><span class="badge bg-red">Delete</span></a>
	                  </td>
	                </tr>
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