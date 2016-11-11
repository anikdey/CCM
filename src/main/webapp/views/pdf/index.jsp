<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<div class="content-wrapper">
    <section class="content-header">
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-10">
                <div align="center">
                    <h1>Spring MVC PDF View Demo (using iText library)</h1>
                    <h3><a target="_blank" href="<c:url value="/admin/pdf/generate-city-list-pdf"/>">Generate PDF Of City List</a></h3>
                </div>
            </div>
        </div>
    </section>
</div>