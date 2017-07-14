var Schedule = function($schedule) {
    this.id = $schedule.find('.schedule_id').val();
    this.title = $schedule.find('.schedule_title').val();
    this.introduction = $schedule.find('.schedule_introduction').val();
    this.imageUrl = $schedule.find('.schedule_image_url').val();
    this.dateTime = new Date($schedule.find('.schedule_dateTime').val());
}