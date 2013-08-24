<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body class="container">
<div class="page-header">
  <small>What we call failure is not the falling down but the staying down.  -- <strong>大傻逼</strong> </small>
  <!-- <script type="text/javascript" src="http://open.iciba.com/ds_open.php?id=939&name=StrongData&auth=0279D9DAF21B2021D44E50F08F3EF6F1" charset="utf-8"></script> -->
</div>
  
	<div class="form-search">
  <input type="text" class="input-medium search-query" id="Name">
  <button onclick="getTranslateInfo()" class="btn btn-primary">Translate</button>
</div>
  <ul id="result">
  </ul>
  
  <div id="result-translate" style="display: none;">
  	<div class="page-header">
  		<h3 id="translate-target">Hello World<small id="FromYouDao"></small></h3>
	</div>
  	<span class="label label-primary">Basic Translate Info</span>
  	<p id="basic-translate" style="margin-top: 20px;margin-bottom: 20px;font-family: Helvetica;font-size:15px; "></p>
  	<span class="label label-primary">Web Translate Info</span>
  	<p id="web-translate" style="margin-top: 20px;margin-bottom: 20px;font-family: Helvetica;font-size:15px;"></p>
  </div>
  
<div class="alert alert-danger fade well" id="alert" style="display: none;">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <h4>Query Target Miss</h4>
  Please input the word that you need for translating !
</div>
<script type="text/javascript">

function getMovieInfo() {
	var movieName = $('#Name').val();
	d3.json('movie/'+movieName,function(data) {
		if(data.resultcode==200) {
			if(data.result.length!=0) {
				d3.select('ul').html('');
				d3.select('ul').selectAll('li').data(data.result).enter().append('li').html(function(d){return d.title;});
			}else{
				$('#no_data').css('display','block');
			}
		}
	});
}
function getMenuInfo() {
	var menName = $('#Name').val();
	d3.select($('#result')[0]).html('');
	d3.json('menu/'+menName+'/1/20',function(data) {
		if(data.resultcode==200) {
				d3.select($('#result')[0]).selectAll('li').data(data.result.data).enter().append('li')
				.html(function(d){
					var imgHtml = d.steps.map(function(dd) {
						return '<img src="'+dd.img+'" class="img-circle" title="'+dd.step+'" width="120" height="100">';
					});
					imgHtml = imgHtml.join('&nbsp;');
					return '<span class="label label-success">'+d.title+'</span><span class="label label-info">'+d.tags+'</span><span class="label label-important">'+d.ingredients+'</span>'+'<p>'+imgHtml+'</p>';
				});
		}else if(data.resultcode==202) {
			$('#no_data').css('display','block');
		}
	});
}

/**
 * 0 - 正常
　20 - 要翻译的文本过长
　30 - 无法进行有效的翻译
　40 - 不支持的语言类型
　50 - 无效的key
 */
function getTranslateInfo() {
	var textName = $('#Name').val();
	if(textName!='') {
		d3.select($('#result')[0]).html('');
	 	d3.json('translate/'+textName,function(data) {
			if(data.errorCode==0) {
				handleTranslateResult(data);
			}
		}); 
	}else {
		$('#result-translate').hide();
	}
}

function handleTranslateResult(data) {
	$('#translate-target').text(data.query);
	$('#FromYouDao').text(data.translation.join(','));
	if(data.basic) {
		var basic = '';
		var phonetic='' ;
		if(data.basic.phonetic){
			phonetic= data.basic.phonetic;
			phonetic = '<em>['+phonetic+']</em>:';
		}
		var explains_basic = data.basic.explains.join(',');
		basic = phonetic+explains_basic;
		$('#basic-translate').html(basic);
	}else {
		$('#basic-translate').html('');
	}
	if(data.web) {
		var web = '';
		web = data.web.map(function(d) {
			return '<tr><td><em>'+d.key+'</em>:</td><td>'+d.value.join(',')+'</td></tr>';
		});
		web = '<table>'+web.join('')+'</table>';
		$('#web-translate').html(web);
	}else {
		$('#web-translate').html('');
	}
	$('#result-translate').delay(200).fadeIn('slow');
}



</script>
</body>
</html>
