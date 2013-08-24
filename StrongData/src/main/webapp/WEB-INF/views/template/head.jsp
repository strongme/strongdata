<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Head</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/darkstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/nprogress.css">
</head>
<body>

<!--  <nav class="navbar" role="navigation">
  <div class="navbar-header">
    <a class="navbar-brand" href="#">Strong Data</a>
  </div>
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">API Preview</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">API Select <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">Movie</a></li>
          <li><a href="#">Menu</a></li>
        </ul>
      </li>
      <li><a href="#">About Me</a></li>
    </ul>
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#">Sign In</a></li>
      <li><a href="#">Sign Up</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav> -->

<div id="YOUDAO_SELECTOR_WRAPPER" style="display:none; margin:0; border:0; padding:0; width:320px; height:240px;"></div>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.xml2json.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/d3/d3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/nprogress.js"></script>
<!-- <script type="text/javascript" src="http://fanyi.youdao.com/openapi.do?keyfrom=StrongData&key=1449956097&type=selector&version=1.0&translate=on" charset="utf-8" ></script> --> 
<script type="text/javascript">
var i = 0;
var IntervalId = -1;
function inc() {
	if(i==1) {
		NProgress.done();
		clearInterval(IntervalId);
	}else {
		NProgress.set(i);
		i+=0.1;
	}
}

IntervalId = setInterval(inc,100);

</script>
</body>
</html>