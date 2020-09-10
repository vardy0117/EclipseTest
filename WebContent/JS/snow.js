



  //Configure below to change URL path to the snow image
  var snowsrc="http://www.paris.co.kr/images/@temp/snow2.png";
  

  // Configure below to change number of snow to render
  var no = 20;

  // Configure whether snow should disappear after x seconds (0=never):
  var hidesnowtime = 0;

  // Configure how much snow should drop down before fading ("windowheight" or "pageheight")
  var snowdistance = "pageheight";




  var ie4up = (document.all) ? 1 : 0;
  var ns6up = (document.getElementById&&!document.all) ? 1 : 0;




function iecompattest(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body

}




  var dx, xp, yp;    // coordinate and position variables
  var am, stx, sty;  // amplitude and step variables
  var i, doc_width = 1200, doc_height = 1000; 

  

  if (ns6up) {
    doc_width = self.innerWidth;
    doc_height = self.innerHeight;
  } else if (ie4up) {

    doc_width = iecompattest().clientWidth;
    doc_height = iecompattest().clientHeight;

  }




  dx = new Array();
  xp = new Array();
  yp = new Array();
  am = new Array();
  stx = new Array();
  sty = new Array();
  //snowsrc=(snowsrc.indexOf("dynamicdrive.com")!=-1)? "snow.gif" : snowsrc

  for (i = 0; i < no; ++ i) {  

	  dx[i] = 0;                        // set coordinate variables
	  xp[i] = Math.random()*(doc_width-50);  // set position variables
	  yp[i] = Math.random()*doc_height;
	  am[i] = Math.random()*20;         // set amplitude variables
	  stx[i] = 0.02 + Math.random()/10; // set step variables
	  sty[i] = 0.7 + Math.random();     // set step variables
	  var randNum = Math.floor(Math.random()*5+1);
	  if(randNum == 1) {
		  snowsrc="./images/meat.svg";  
	  } else if(randNum == 2) {
		  snowsrc="./images/noodle.svg";  
	  } else if(randNum == 3) {
		  snowsrc="./images/sushi.svg";
	  } else if(randNum == 4) {
		  snowsrc="./images/pizza.svg";
	  } else if(randNum == 5) {
		  snowsrc="./images/fried-chicken.svg";
	  }

	  if (ie4up||ns6up) {
		  if (i == 0) {
			  document.write("<div onclick='reset(this);' id=\"dot"+ i +"\" style=\" cursor:pointer; POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><img style='width:100px;' src='"+snowsrc+"' border=\"0\"><\/div>");
		  } else {
			  document.write("<div onclick='reset(this);' id=\"dot"+ i +"\" style=\"cursor:pointer; POSITION: absolute; Z-INDEX: "+ i +"; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><img style='width:100px;' src='"+snowsrc+"' border=\"0\"><\/div>");
		  }
    }

  }

  function reset(element) {
	  element.style.top = doc_height+"px"s;
  }


  function snowIE_NS6() {  // IE and NS6 main animation function
    doc_width = ns6up?window.innerWidth-10 : iecompattest().clientWidth-10;

doc_height=(window.innerHeight && snowdistance=="windowheight")? window.innerHeight : (ie4up && snowdistance=="windowheight")?  iecompattest().clientHeight : (ie4up && !window.opera && snowdistance=="pageheight")? iecompattest().scrollHeight : iecompattest().offsetHeight;

    for (i = 0; i < no; ++ i) {  // iterate for every dot

      yp[i] += sty[i];

      if (yp[i] > doc_height-50) {

        xp[i] = Math.random()*(doc_width-am[i]-30);
        yp[i] = 0;
        stx[i] = 0.02 + Math.random()/10;
        sty[i] = 0.7 + Math.random();
      }

      dx[i] += stx[i];
      document.getElementById("dot"+i).style.top=yp[i]+"px";
      document.getElementById("dot"+i).style.left=xp[i] + am[i]*Math.sin(dx[i])+"px";  
    }
    snowtimer=setTimeout("snowIE_NS6()", 10);
  }


function hidesnow(){
if (window.snowtimer) clearTimeout(snowtimer)
for (i=0; i<no; i++) document.getElementById("dot"+i).style.visibility="hidden"

}


if (ie4up||ns6up){
    snowIE_NS6();
if (hidesnowtime>0)
setTimeout("hidesnow()", hidesnowtime*1000)
}

