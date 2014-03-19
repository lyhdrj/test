var hide = false;
function moveFrame() {
    if(hide) {
        hide = false;
        parent.welcome.hidenLogo();
        parent.document.getElementById("F1").rows = "81,12,*";
        parent.document.getElementById("topFrame").noResize = false;
    }
    else {
        hide = true;
        parent.welcome.showLogo();
        parent.document.getElementById("F1").rows = "0,12,*";
        parent.document.getElementById("topFrame").noResize = true;
    }
}

function moveoverFrame() {
    if(hide) {
        hide = true;
        parent.document.getElementById("F1").rows = "20,3,*,0";
        parent.document.getElementById("bottomFrame").noResize = true;
    }
}