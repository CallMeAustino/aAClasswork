const FollowToggle = require('./follow_toggle.js')

$(function() {
    $('.follow-toggle').each(function(i, el) {
        new FollowToggle($(el));
        console.log(i + el)
    })
    
});


