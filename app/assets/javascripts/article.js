function Article(object) {
  this.title = object.title.rendered;
  this.link = object.guid.rendered;
  this.excerpt = object.excerpt.rendered;
  if (object.content.rendered.match("img .+ src=[\"'](.+?)[\"'].*?") != null) {
    this.image = object.content.rendered.match("img .+ src=[\"'](.+?)[\"'].*?")[1];
  }
}

function hideSpinner(){
  $('.spinner').hide()
}

Article.prototype.toHtml = function() {
  title = '<li><h3><a href=' + this.link + ' target="_blank">' + this.title + '</a></h3>'
  text = this.excerpt + '<em><a href=' + this.link + ' target="_blank">READ MORE</a></em></li><p><br><p>';
  if (this.image) {
    return title + '<img src=' + this.image + '>' + text;
  } else {
    return title + text;
  }
};

Article.render = function(rawData){
  rawData.forEach(function(ele) {
    art = new Article(ele);
    $('#blog-titles').append(art.toHtml())
  });
};

Article.ajaxCall = function(){
  $.ajax({
    url: 'http://www.marydickson.com/wp-json/wp/v2/posts?per_page=20&filter[cat]=25',
  }).done(function( data ) {
    hideSpinner();
    Article.render(data);
  });
}
