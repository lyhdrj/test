sc_fade_inc=10;sc_ci=function(a){return clearInterval(a)};sc_gt=function(){return (new Date).getTime()};sc_bgLog=function(){};sc_fadeCb=function(){};function sc_fi(a,b,d,g){function f(){var b=sc_gt()-e;if(b>=c){a.style.filter="";a.style.opacity=1;if(d)d();a.iFI=false;sc_ci(a.fII);a.fII=null}else{var f=100*b/c;sc_so(a,f)}}var e=sc_gt(),c=100*b/sc_fade_inc;if(a.iFI||a.iV)return;a.iV=a.iFI=true;if(g)a.style.visibility="visible";a.fII=setInterval(f,b)}function sc_so(b,a){b.style.filter=a>=100?"":"alpha(opacity="+a+")";b.style.opacity=a/100}function sc_bgL(){var a=g_img,b=_ge(a.id);if(_w.si_PP&&!_G.PPS){d();return}if(_w.sc_Popup){d();return}function d(){sb_st(sc_bgL,500)}function c(g,i){var e=a.cN;if(e){var d=g+"="+i,c=new RegExp("\\b"+g+"=[^&]*"),b=_d.cookie.match(new RegExp("\\b"+e+"=[^;]+"));if(b){var h=b[0].match(c)?b[0].replace(c,d):b[0]+"&"+d,f=location.hostname.match(/([^.]+\.[^.]*)$/);_d.cookie=h+(f?";domain="+f[0]+";path=/":"")}}}function e(){var l=a.d,f=null,e=i,d=new Image;function h(){e()}function g(){g=e=i}function i(){function e(){b.style.backgroundImage="url('"+d.src+"')";b.className+=" sw_imLd"}d.onerror=d.onload=null;var g=sc_gt()-m;sc_bgLog("Load","HP","bg",false,"Time",g);if(g>l){sc_so(b,0);e();sb_st(sj_wf(sc_fi,b,25,sc_fadeCb),500)}else{e();sc_so(b,100);sc_fadeCb()}sj_ue(sj_b,"keydown",j);sb_ct(f);c(a.crN,a.hash);sb_st(h,50);function h(){if(a.crN=="bIm"){var e=new Image,b=d.src;e.onload=function(){var a=new Image;a.onload=function(){c("hIm",b.substr(b.length-7,3))};a.src="/fd/s/a/j1.png"};e.src=b.replace(/\.jpg/,"s.jpg")}}}function j(){e=g;sb_ct(f);f=sb_st(h,1100)}function n(){g=e=function(){};a.x=true;d=null;sb_ct(f)}if(sb_ie)try{_d.execCommand("BackgroundImageCache",false,true)}catch(o){}sc_bgLog("Dims","HP","br",false,"W",sb_de.clientWidth,"H",sb_de.clientHeight);sc_bgLog("Test","HP","IsLive",false,"Data",typeof isHp=="function"?isHp()?1:0:-1);var k=_ge("sb_form");if(k){sj_be(sj_b,"keydown",j);sj_be(k,"submit",n)}d.onload=h;var m=sc_gt();d.src=a.url}sb_st(e,5)}