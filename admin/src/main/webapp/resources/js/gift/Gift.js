var Gift = function($giftForm) {
    this.id = $giftForm.find('.gift_id').val();
    this.name = $giftForm.find('.gift_name').val();
    this.imageUrl = $giftForm.find('.gift_image_url').val();
    this.price = $giftForm.find('.gift_price').val();

}