var hide = false;
        function moveFrame() {
            //var icn = document.getElementById("icn");
            if(hide) {
                hide = false;
                //icn.src = "../images/frame_arrow1.gif";
                parent.document.getElementById("F2").cols = "189,10,*";
                parent.document.getElementById("leftFrame").noResize = false;
            }
            else {
                hide = true;
                //icn.src = "../images/frame_arrow2.gif";
                parent.document.getElementById("F2").cols = "0,10,*";
                parent.document.getElementById("leftFrame").noResize = true;
            }
        }