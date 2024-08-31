$(".menu-toggler").click(function () {

    if ($('body').hasClass('sidebar-open')) {
        $("body").removeClass("sidebar-open");
        console.log("REMOVE CLASS")
    } else {
        $("body").addClass("sidebar-open");
        console.log("NO CLASS")
    }



});



function openCenteredWindow(url, title, width, height) {
    // Calculate the position to center the window
    const left = (screen.width / 2) - (width / 2);
    const top = (screen.height / 2) - (height / 2);
  
    // Open a new window with calculated position and size
    window.open(url, title, `width=${width}, height=${height}, left=${left}, top=${top}`);
  }