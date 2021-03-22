$(function()
{
    //get info from client side
    window.addEventListener('message', function(event)
    {
        var cdata = event.data;
        if (cdata.casemenue == 'closeit')
        {
            document.getElementById("hscoreboard").innerHTML = "";
            $('#container').hide();
        }
        else
        {
            document.getElementById("hscoreboard").innerHTML = cdata.info;
            $('#container').show();
        }

    }, false);

    //for close scoreboard
    document.onreadystatechange = () => {
        if (document.readyState === 'complete') {
            // Create the event handler when everything has loaded.
            $(document).keyup(function(event) {
                if (event.key === 'ArrowDown') {
                    $.post('https://light/close', JSON.stringify({ message: null }));
                }
            });
        }
    }

});
