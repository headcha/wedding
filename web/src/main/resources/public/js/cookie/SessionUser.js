var SessionUser = function(){

}

SessionUser.createSessionCookie = function() {
    var sessionId = $.cookie('seolgi-wedding-unique-id');
    if (!sessionId) {
        sessionId = Guid.create();
        $.cookie('seolgi-wedding-unique-id', sessionId, { expires:365 });
    }
}