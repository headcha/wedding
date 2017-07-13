var Gallery = function () {
    this.id = 0;
    this.categories = new Array();
}

Gallery.createByForm = function ($gallery) {
    var gallery = new Gallery();
    gallery.id = $gallery.find('.gallery_id').val();
    gallery.categories = createCategories($gallery.find('.category_area'));

    function createCategories($categories) {
        var categories = new Array();

        $categories.each(function (index, item) {
            var category = new Category($(item));
            categories.push(category);
        });

        return categories;
    }

    return gallery;
}