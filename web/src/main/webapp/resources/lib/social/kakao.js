Kakao.init('d8b0266d6f8d95e8d27063ce8173b9d5');

function kakao() {

    this.login = function() {
        Kakao.Auth.login({
            success: function(authObj) {
                console.log(JSON.stringify(authObj));
            },
            fail: function(err) {
                alert(JSON.stringify(err));
                console.log(JSON.stringify(err));
            }
        });
    };

    this.logout = function() {
        Kakao.Auth.logout({
            success: function(authObj) {
                console.log(JSON.stringify(authObj));
            },
            fail: function(err) {
                alert(JSON.stringify(err));
                console.log(JSON.stringify(err));
            }
        });
    };

    this.getUserProfile = function() {
        Kakao.API.request({
            url: '/v1/user/me',
            success: function(res) {
                alert(JSON.stringify(res));
            },
            fail: function(error) {
                alert(JSON.stringify(error));
            }
        });
    };

    this.shareStory = function(text) {
        Kakao.Story.share({
            url: location.href,
            text: text
        });
    };

    this.sendLink = function(label, imgUrl, webText) {
        Kakao.Link.sendTalkLink({
            label: label,
            image: {
                src: imgUrl,
                width: '300',
                height: '200'
            },
            webLink: {
                text:webText,
                url: location.href
            },
            fail: function() {
                kakao.shareStory(label);
            }
        });
    }
}