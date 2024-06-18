window.onload = function(){
    var muteInfo = document.getElementById('muteInfo');
    var rangeInfo = document.getElementById('rangeInfo');
    var container = document.getElementById('container');
    var meters = document.getElementById('meters');
    window.addEventListener('message', function(event) {
        console.log(event.data.range)
        if (event.data.isMuted != null) {
            if(event.data.isMuted) {
                muteInfo.style.fontSize = "3vh";
            }
            else {
                muteInfo.style.fontSize = "0vh";
            }
        }
        if(event.data.range != null) {
            console.log(rangeInfo.style.fontSize)
            if (rangeInfo.style.fontSize == "0px") {
                rangeInfo.style.fontSize = "1.5vh"
            }
            meters.innerHTML = event.data.range;
        }
        if (event.data.playerIsInVehicle != null) {
            if (event.data.playerIsInVehicle) {
                container.style.bottom = "4vh"
            }
            else {
                container.style.bottom = "0"
            }
        }
    });
}