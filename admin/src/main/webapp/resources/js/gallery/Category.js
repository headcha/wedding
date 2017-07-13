var Category = function ($category) {
    this.id = $category.find('.category_id').val();
    this.name = $category.find('.gallery_category_name').val();
    this.galleryImages = createGalleryImages($category.find('.gallery_image'));

    function createGalleryImages($galleryImages) {
        var galleryImages = new Array();

        $galleryImages.each(function (index, item) {
            var gallery = new GalleryImage($(item));

            if(gallery.url != "") {
                galleryImages.push(gallery);
            }
        });

        return galleryImages;
    }
};