<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ page session="false" %>
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
</head>
<body class="hold-transition login-page">
	<div class="wrapper">
		<tiles:insertAttribute name="content" />
	</div>
<script src="<c:url value="/resources/plugins/jQuery/jQuery-2.2.0.min.js" />"></script>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/plugins/iCheck/icheck.min.js" />"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>