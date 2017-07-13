var Couple = function() {
    this.id = "";
    this.name = "";
    this.introduction = "";
    this.imageUrl = "";
    this.sexType = "";
}

Couple.createMale = function($couple) {
    var couple = new Couple();
    couple.id = $couple.find('.maleId').val();
    couple.name = $couple.find('.maleName').val();
    couple.introduction = $couple.find('.maleIntroduction').val();
    couple.imageUrl = $couple.find('.male_image_url').val();
    couple.sexType = "MALE";
    return couple;
}

Couple.createFemale = function($couple) {
    var couple = new Couple();
    couple.id = $couple.find('.femaleId').val();
    couple.name = $couple.find('.femaleName').val();
    couple.introduction = $couple.find('.femaleIntroduction').val();
    couple.imageUrl = $couple.find('.female_image_url').val();
    couple.sexType = "FEMALE";
    return couple;
}