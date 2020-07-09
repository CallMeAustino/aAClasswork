

class FollowToggle {
    constructor(el) {
        this.el = el;
        this.userId = el.data('user-id');
        this.followState = el.data('initial-follow-state');

        this.render();
        this.handleClick();
    }
    render() {
        if (this.followState === "unfollowed") {
            this.el.text("Follow!");
        } else {
            this.el.text("Unfollow!");
        }
    }
    handleClick() {
        // debugger;
        let that = this
        this.el.on('click', function(e){
            console.log("pushed!")
            e.preventDefault();
            // debugger;
            if (that.followState === "unfollowed") {
                $.ajax({
                    method: 'POST',
                    url: `/users/${that.userId}/follow`,
                    dataType: 'JSON',
                    success: function(){
                        that.followState = "followed"
                        that.render();
                    }
            })} else {
                $.ajax({
                    method: 'DELETE',
                    url: `/users/${that.userId}/follow`,
                    dataType: 'JSON',
                    success: function(){
                        that.followState = "unfollowed"
                        that.render();
                    }
        })  
                }
        })
        
    }
}

// Prevent the default action.
// Make a $.ajax request to POST / users /: id / follow if we are not following the user(check followState), else, it should make a DELETE request.
// On success of the POST / DELETE, we should toggle the followState and re - render.
module.exports = FollowToggle;