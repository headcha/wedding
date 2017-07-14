var Guest = function($guestForm) {
    this.name = $guestForm.find('.guest_name').val();
    this.weddingId = $guestForm.find('.weddingId').val();
    this.weddingUrl = $guestForm.find('.weddingUrl').val();
    this.phoneNumber = $guestForm.find('.phoneNumber').val();
    this.price = $guestForm.find('.price').val();
    this.message = $guestForm.find('.message').val();
    this.giftId = $guestForm.find('.gift_id').val();
}