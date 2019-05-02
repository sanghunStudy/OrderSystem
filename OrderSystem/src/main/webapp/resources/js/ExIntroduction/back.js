window.onload = function(){
    
     
        // Get the modal
        var modal1 = document.getElementById('back1');
 
        // Get the button that opens the modal
        var btn1 = document.getElementById("back_btn1");
 
               // Get the modal
        var modal2 = document.getElementById('back2');
 
        // Get the button that opens the modal
        var btn2 = document.getElementById("back_btn2");

        // Get the modal
        var modal3 = document.getElementById('back3');
 
        // Get the button that opens the modal
        var btn3 = document.getElementById("back_btn3");
 
        // Get the modal
        var modal4 = document.getElementById('back4');
 
        // Get the button that opens the modal
        var btn4 = document.getElementById("back_btn4");
 
        // Get the modal
        var modal5 = document.getElementById('back5');
 
        // Get the button that opens the modal
        var btn5 = document.getElementById("back_btn5");
 
        // Get the modal
        var modal6 = document.getElementById('back6');
 
        // Get the button that opens the modal
        var btn6 = document.getElementById("back_btn6");
    
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal1) {
                modal1.style.display = "none";
            }else if (event.target == modal2) {
                modal2.style.display = "none";
            }else if (event.target == modal3) {
                modal3.style.display = "none";
            }else if (event.target == modal4) {
                modal4.style.display = "none";
            }else if (event.target == modal5) {
                modal5.style.display = "none";
            }else if (event.target == modal6) {
                modal6.style.display = "none";
            }
        }
     
        // When the user clicks on the button, open the modal 
        btn1.onclick = function() {
            modal1.style.display = "block";
        }
 
        // When the user clicks on the button, open the modal 
        btn2.onclick = function() {
            modal2.style.display = "block";
        }
        
        // When the user clicks on the button, open the modal 
        btn3.onclick = function() {
            modal3.style.display = "block";
        }
        
        // When the user clicks on the button, open the modal 
        btn4.onclick = function() {
            modal4.style.display = "block";
        }
 
        // When the user clicks on the button, open the modal 
        btn5.onclick = function() {
            modal5.style.display = "block";
        }
 
        // When the user clicks on the button, open the modal 
        btn6.onclick = function() {
            modal6.style.display = "block";
        }
 
      }
    