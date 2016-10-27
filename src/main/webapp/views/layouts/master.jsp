<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>CCM | ${title}</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/dist/css/AdminLTE.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/dist/css/skins/_all-skins.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/iCheck/flat/blue.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/morris/morris.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/datepicker3.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/daterangepicker/daterangepicker-bs3.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/custom.css" />">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script>
            function checkDelete() {
                var $chk = confirm('Are You Sure You Want To Delete This?');
                if ($chk) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>



    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <tiles:insertAttribute name="header" />
            <tiles:insertAttribute name="sidebar" />
            <tiles:insertAttribute name="content" />
            <tiles:insertAttribute name="footer" />
        </div>
        <script src="<c:url value="/resources/js/jquery-2.2.3.min.js" />"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="<c:url value="/resources/plugins/morris/morris.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/sparkline/jquery.sparkline.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" />"></script>
        <script src="<c:url value="/resources/plugins/knob/jquery.knob.js" />"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
        <script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js" />"></script>
        <script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js" />"></script>
        <script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/fastclick/fastclick.js" />"></script>
        <script src="<c:url value="/resources/dist/js/app.min.js" />"></script>
        <script src="<c:url value="/resources/dist/js/pages/dashboard.js" />"></script>
        <script src="<c:url value="/resources/dist/js/demo.js" />"></script>
    </body>
</html>