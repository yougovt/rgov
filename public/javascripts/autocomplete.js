$(function() {

 	// Below is the name of the textfield that will be autocomplete   
    $('#query').autocomplete({
 		// This shows the min length of charcters that must be typed before the autocomplete looks for a match.
    	minLength: 2,
 		// This is the source of the auocomplete suggestions. In this case a list of agency names from the pages controller, in JSON format.
    	source: '<%= pages_path(:json) %>',
  		// This updates the textfield when you move the updown the suggestions list, with your keyboard. 
  		// In our case it will reflect the same value that you see in the suggestions which is the page.orgname.
    	focus: function(event, ui) {
    		$('#query').val(ui.item.page.orgname);
        	return false;
    	},
 		// Once a value in the drop down list is selected, do the following:
        select: function(event, ui) {
 			// place the page.orgname value into the textfield called 'query'
            $('#query').val(ui.item.page.orgname);
 			// and place the page.id into the hidden textfield called 'link_query'. 
        	$('#link_query').val(ui.item.page.id);
            return false;
        }
    })
 	// The below code is straight from the jQuery example. It formats what data is displayed in the dropdown box, and can be customized.
    .data( "autocomplete" )._renderItem = function( ul, item ) {
            return $( "<li></li>" )
            .data( "item.autocomplete", item )
 			// For now which just want to show the person.given_name in the list.
            .append( "<a>" + item.page.orgname + "</a>" )
            .appendTo( ul );
        };
    });