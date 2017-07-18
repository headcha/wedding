var Story = function($story) {
    this.id = $story.find('.story_id').val();
    this.title = $story.find('.story_title').val();
    this.description = $story.find('.story_description').val();
    this.imageUrl = $story.find('.story_image_url').val();
    this.storyDate = new Date($story.find('.story_storyDate').val());
    this.orderIndex = $story.find('.story_order_index').val();
}