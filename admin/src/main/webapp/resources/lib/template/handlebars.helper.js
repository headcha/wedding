Handlebars.registerHelper("select", function(value, options) {
    return options.fn(this)
        .split('\n')
        .map(function(v) {
            var t = 'data-value="' + value + '"';
            var k = 'value="' + value + '"';

            if (RegExp(t , 'gi').test(v)) {
                return v.replace('>' , ' selected="selected">');
            } else if (RegExp(k , 'gi').test(v)) {
                return v.replace('>' , ' selected="selected">');
            } else {
                return v;
            }
        })
        .join('\n')
});

Handlebars.registerHelper('checked', function(currentValue) {
    return currentValue == true ? 'checked' : '';
});

Handlebars.registerHelper('attr-disabled', function(currentValue){
    if(!currentValue)
        return "disabled";
});