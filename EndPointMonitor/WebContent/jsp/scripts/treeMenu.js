
        $(document).ready(function() {

            //Class 'contentContainer' refers to 'li' that has child with it.
            //By default the child ul of 'contentContainer' will be set to 'display:none'

            $("#treeMenu li").toggle(

				  function() { // START FIRST CLICK FUNCTION
            if ($(this).hasClass('contentContainer')) {
                $(this).children('ul').slideDown()
                $(this).removeClass('contentContainer').addClass('contentViewing');
            }
            if (($(this).hasClass('contentContainerMain') || $(this).hasClass('contentViewingMain'))&& $('.contentViewingMain').text() != $(this).text()) {								        
				              $('.contentViewingMain').children('ul').slideUp()
				              $('.contentViewingMain').removeClass().addClass('contentContainerMain');
				          }				      
				     
				      if ($(this).hasClass('contentContainerMain')) {
				          $(this).children('ul').slideDown()
				          $(this).removeClass('contentContainerMain').addClass('contentViewingMain');
				      }
				      else if ($(this).hasClass('contentViewingMain')) {
				          $(this).children('ul').slideUp()
				          $(this).removeClass('contentViewingMain').addClass('contentContainerMain');
				      }

				  }, // END FIRST CLICK FUNCTION

				  function() { // START SECOND CLICK FUNCTION
				  if (($(this).hasClass('contentContainerMain') || $(this).hasClass('contentViewingMain')) && $('.contentViewingMain').text() != $(this).text()) {								        
				          $('.contentViewingMain').children('ul').slideUp()
				          $('.contentViewingMain').removeClass().addClass('contentContainerMain');
				      }				  
				      if ($(this).hasClass('contentViewing')) {
				          $(this).children('ul').slideUp()
				          $(this).removeClass('contentViewing').addClass('contentContainer');
				      }
				      if ($(this).hasClass('contentContainerMain')) {
				          $(this).children('ul').slideDown()
				          $(this).removeClass('contentContainerMain').addClass('contentViewingMain');
				      }
				      else if ($(this).hasClass('contentViewingMain')) {
				          $(this).children('ul').slideUp()
				          $(this).removeClass('contentViewingMain').addClass('contentContainerMain');
				      }

				  } // END SECOND CLICK FUNCTIOn
					); // END TOGGLE FUNCTION 

        });      // END DOCUMENT READY

     

  