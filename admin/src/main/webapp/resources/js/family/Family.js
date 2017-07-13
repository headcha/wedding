var Family = function($familyForm) {
    this.id = $familyForm.find('.family_id').val();
    this.name = $familyForm.find('.family_name').val();
    this.type = $familyForm.find('.family_type').val();
    this.imageUrl = $familyForm.find('.family_image_url').val();
    this.letter = $familyForm.find('.family_letter').val();

}