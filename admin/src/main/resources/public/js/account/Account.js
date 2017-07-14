var Account = function($account) {
    this.id = $account.find('#id').val();
    this.name = $account.find('#name').val();
    this.phoneNumber = $account.find('#phoneNumber').val();
    this.password = $account.find('#password').val();
    this.termsOfServiceConfirm = $account.find('#termsOfServiceConfirm').is(':checked');
    this.privacyPolicyConfirm = $account.find('#privacyPolicyConfirm').is(':checked');
}
