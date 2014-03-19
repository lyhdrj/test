<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
<head>

		<title>tree</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script language="javascript" src="<%=request.getContextPath()%>/js/dtrees.js"></script>
		<link style="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index/dtree.css">
		<link style="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
		<link style="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/index/left.css">
	<SCRIPT src="<%=request.getContextPath()%>/js/dtree.js" type=text/javascript></SCRIPT>
	<script language="javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js" type="text/javascript"></script>
	<SCRIPT type=text/javascript>
function carousel(params){
  if(!(params.width>0 && isFinite(params.width)))params.width=100;
  if(!(params.height>0 && isFinite(params.height)))params.height=100;
  if(!(params.sides>2 && isFinite(params.sides)))params.sides=4;
  if(!(params.steps>0 && params.steps<100 && isFinite(params.steps)))params.steps=20;
  if(!(params.speed>0 && isFinite(params.speed)))params.speed=8;
  if(!(params.image_border_width>=0 && isFinite(params.image_border_width)))params.image_border_width=0;
  if(isFinite(params.id)||!params.id)params.id='bad_id_given_'+Math.random();
  
  document.write("<div style='position:relative;overflow:hidden;' id='"+params.id.replace(/[\r\n\t ]+/g,'_')+"'></div>");
  var cdiv=document.getElementById(params.id.replace(/[\r\n\t ]+/g,'_'))
  cdiv.style.width=params.width+'px';
  cdiv.style.height=params.height+'px';
  cdiv.style.border=params.border;
  cdiv.style.position='relative';
  cdiv.style.overflow='hidden';
  cdiv.title=params.id;
    
  var counter=0,spinning=true,interval=Math.floor(60000/params.sides/params.steps/params.speed)-5;
  interval=isNaN(interval)?200:interval;
  var img_position=[],images=[],img_dimension=[];
  var img_index=params.images.length+1,img_index_cap=2*params.images.length;
  var faces=Math.ceil(params.sides/2), dimension, direction;

  function init(){
    if(params.direction=="left" || params.direction=="right"){
      direction=params.direction;
      dimension="width";
      }
    else if(params.direction=="top" || params.direction=="bottom"){
      direction=params.direction;
      dimension="height";
      }
    else {
      direction="left";
      dimension="width";
      }      
    cdiv.style[dimension]=params[dimension]/(params.size_mode=='image'?Math.sin(Math.PI/params.sides):1)+'px';
    var img=new Image();
    img.style.position='absolute';
    img.style[direction]='10000px';
    img.style.width=params.width-2*params.image_border_width+'px';
    img.style.height=params.height-2*params.image_border_width+'px';
    img.style.border=(params.image_border_width||0)+'px solid '+params.image_border_color;
  
    for(var i=0;i<params.images.length;i++){
      images[i]=img.cloneNode(true);
      images[i].src=params.images[i];
      if(params.links && params.links[i] && params.links[i]!=''){
        images[i].onclick=new Function("window.location='"+params.links[i]+"'");
        images[i].style.cursor=document.all?'hand':'pointer';
        }
      if(params.titles && params.titles[i] && params.titles[i]!='')
        images[i].title=params.titles[i];
      images[i+params.images.length]=images[i];
      if(params.images.length==faces)
        images[i+2*params.images.length]=images[i];
      cdiv.appendChild(images[i]);
      }
  
    var face_size=params.size_mode=='image'?params[dimension]:params[dimension]*Math.sin(Math.PI/params.sides);
    var face_offset=params[dimension]*Math.cos(Math.PI/params.sides)/(params.size_mode=='image'?Math.sin(Math.PI/params.sides):1)/2-.5;
    var pi_piece=2*Math.PI/params.steps/params.sides;
    for(i=0;i<=params.steps*faces;i++){
      img_dimension[i]=face_size*Math.sin(pi_piece*i);
      img_position[i]=(i<params.steps*params.sides/2)?Math.floor(params[dimension]/2/(params.size_mode=='image'?Math.sin(Math.PI/params.sides):1)-face_offset*Math.cos(pi_piece*i)-img_dimension[i]/2)+'px':'10000px';
      img_dimension[i]=img_dimension[i]-2*params.image_border_width>1?Math.ceil(img_dimension[i])-2*params.image_border_width+'px':'1px';
      }
    }
  init();

  cdiv.rotate = function(){
    setTimeout('document.getElementById("'+cdiv.id+'").rotate()',interval);
    if(!spinning) return;
    if(++counter>=params.steps){
      counter=0;
      if(++img_index>=img_index_cap)
        img_index=params.images.length;
      }
    images[img_index-faces].style[direction]='20000px';
    for(var i=faces-1;i>=0;i--){
      images[img_index-i].style[direction]=img_position[counter+i*params.steps];
      images[img_index-i].style[dimension]=img_dimension[counter+i*params.steps];
      }
    }
  cdiv.onmouseover=function(){
    spinning=false;
    }
  cdiv.onmouseout=function(){
    spinning=true;
    }
  setTimeout('document.getElementById("'+cdiv.id+'").rotate()',200);
  }
</SCRIPT>
</head>
<body onkeydown="KeyDown()" scroll="no">
		<div style="left:10px;position: relative;">
			<div style="height: 30px;width: 185px;">
				<div style="background-image: url('<%=request.getContextPath()%>/images/index/bg_left_tl.gif');float: left;width:10px;height: 100%;"></div>
				<div style="background: url('<%=request.getContextPath()%>/images/index/bg_left_tc.gif') top left repeat-x;float: left;width: 155px;height: 100%;padding-top: 5px;" align="center">PineapplePie Menu</div>
				<div style="background-image: url('<%=request.getContextPath()%>/images/index/bg_left_tr.gif');float: left;width:10px;height: 100%;"></div>
			</div>
			<div style="height:410px;">
				<div style="background-image: url('<%=request.getContextPath()%>/images/index/bg_left_ls.gif');float: left;width:10px;height: 100%;"></div>
				<div  style="background-color: #fff;height: 100%;float:left;width:155px;">
					<div id="treeDiv"><script type="text/javascript">
  
		tree = new dTree('tree');
		tree.add(0,-1,'系统菜单');
	 
	<s:iterator id="menuListPage" value="#session.menuList">
     	<s:if test="#menuListPage.status==1">
     		tree.add("<s:property value="#menuListPage.menuID"/>","<s:property value="#menuListPage.parentMenuID"/>","<s:property value="#menuListPage.menuName"/>", "<s:property value="#menuListPage.menuFunc"/>","<s:property value="#menuListPage.menuName"/>","right");
		</s:if>
		<s:if test="#menuListPage.status==0">
     		tree.add("<s:property value="#menuListPage.menuID"/>","<s:property value="#menuListPage.parentMenuID"/>","<s:property value="#menuListPage.menuName"/>", null,"<s:property value="#menuListPage.menuName"/>");
		</s:if>
	</s:iterator>
	document.write(tree);
</script></div>
				</div>
				<div style="background-image: url('<%=request.getContextPath()%>/images/index/bg_left_rs.gif');float: left;width:10px;height: 100%;"></div>
			</div>
			<div style="height: 10px;">
				<div style="background:url('<%=request.getContextPath()%>/images/index/bg_left_bl.gif') no-repeat;float: left;width:10px;height: 100%;"></div>
				<div style="background: url('<%=request.getContextPath()%>/images/index/bg_left_bc.gif') repeat-x;float: left;width: 155px;height: 100%;">&nbsp;</div>
				<div style="background: url('<%=request.getContextPath()%>/images/index/bg_left_br.gif') no-repeat;float: left;width:10px;height: 100%;"></div>
			</div>
		</div>
	</body>
</html>
