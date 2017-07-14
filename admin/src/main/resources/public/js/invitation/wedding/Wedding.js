var Wedding = function() {
    this.id = 0;
    this.dateTime = '';
    this.country = '';
    this.city = '';
    this.location = '';
    this.title = '';
    this.introduction = '';
    this.enable = false;
    this.couples = new Array();
    this.schedules = new Array();
    this.gallery = new Gallery();
    this.stories = new Array();
    this.imageUrl = '';
    this.latitude = '';
    this.longitude = '';
    this.hallImageUrl = '';
    this.families = new Array();
    this.gifts = new Array();
    this.url='';
    this.greetings='';
    this.giftSmsGreetings = '';
}

Wedding.createByForm = function ($form) {
    var wedding = new Wedding();
    wedding.id = $form.find('.wedding_id').val();
    wedding.dateTime = new Date($form.find('.dateTime').val());
    wedding.country = $form.find('.country').val();
    wedding.city = $form.find('.city').val();
    wedding.enable = $form.find('.enable').val();
    wedding.location = $form.find('.location').val();
    wedding.title = $form.find('.title').val();
    wedding.introduction = $form.find('.introduction').val();
    wedding.greetings = $form.find('#greetings').val();
    wedding.giftSmsGreetings = $form.find('#giftSmsGreetings').val();
    wedding.couples = createCouples($form);
    wedding.schedules = createSchedules($form);
    wedding.stories = createStories($form);
    wedding.gifts = createGifts($form);
    wedding.families = createFamilies($form);
    wedding.gallery = Gallery.createByForm($form.find('#gallery_item_area'));
    wedding.imageUrl = $form.find('.wedding_image_url').val();
    wedding.latitude = $form.find('.latitude').val();
    wedding.longitude = $form.find('.longitude').val();
    wedding.hallImageUrl = $form.find('.wedding_hall_image_url').val();
    wedding.url = $form.find('.wedding_url').val();

    function createCouples($form) {
        var couples = new Array();
        couples.push(Couple.createFemale($form));
        couples.push(Couple.createMale($form));
        return couples;
    }

    function createSchedules($form) {
        var schedules = new Array();

        $form.find('.schedule_item').each(function(index , item) {
            schedules.push(new Schedule($(item)));
        });

        return schedules;
    }


    function createGifts($form) {
        var gifts = new Array();

        $form.find('.gift_item').each(function(index , item) {
            gifts.push(new Gift($(item)));
        });

        return gifts;
    }

    function createFamilies($form) {
        var families = new Array();

        $form.find('.family_item').each(function(index , item) {
            families.push(new Family($(item)));
        });

        return families;
    }

    function createStories($form) {
        var stories = new Array();

        $form.find('.story_item').each(function(index , item) {
            stories.push(new Story($(item)));
        });

        return stories;
    }

    return wedding;
}

Wedding.createByUrl = function(url) {
    var wedding = new Wedding();
    wedding.url = url;
    return wedding;
}

Wedding.createByEnable = function(id , enable) {
    var wedding = new Wedding();
    wedding.id = id;
    wedding.enable = enable;
    return wedding;
}