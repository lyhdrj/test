Log=new function(){var a=escape,g="length",f="indexOf",h="apply",j=2000,e=a("["),d=0,i=0,c,m=_G.TestEnv?"":"http://a4.bing.com",k=_G.lsUrl+"&TYPE=Event.ClientInst&DATA=";this.Log=function(d,e,f,a){if(!i){l("Init","CI","Base",false);c=sb_st(b,j);i=1;sj_be(_w,"beforeunload",b,false)}l(d,e,f,a,[].slice.apply(arguments).slice(4))};function l(p,m,o,n,i){var j="";if(i)for(var l=0;l<i.length;l+=2){var h=i[l],c=i[l+1];if(typeof h!="string"||h[f]('"')<0)h='"'+h+'"';if(typeof c=="string"&&c[f]("{")<0&&c[f]('"')<0)c='"'+c+'"';j+=a(h+":"+c+",")}j+='"T":"CI.'+p+'",'+(typeof m=="number"?'"K":'+m:'"FID":"'+m+'"')+',"Name":"'+o+'","TS":'+(new Date).getTime();if(k[g]+e[g]+j[g]>=2048)b();e+=(d?",":"")+a("{")+j+a("}");d=1;if(n)b()}this.Wrap=function(d,b,c,a){var e=d[b];d[b]=function(){var b=arguments;if(a)c[h](this,b);var g=e[h](this,b);if(!a){var d=[];for(var f=0;f<b.length;f++)d.push(b[f]);d.push(g);c[h](this,d)}return g}};function b(){if(c)sb_ct(c);if(d){(new Image).src=m+k+e+a("]");d=0;e=a("[")}c=sb_st(b,j)}}