$(function ()
{
	jQuery(document).ready(function($) {
            $('.counter').counterUp({
                delay: 10,
                time: 3000
            });
        });
})

$(function(){

	new WOW().init();

})