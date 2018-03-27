function News(object) {
  this.title = object.title;
  this.time = object.time;
  this.url = object.url;
  this.source = object.source;
}

function hideSpinner() {
  $('.spinner').hide()
}

News.prototype.toHtml = function () {
  title = '<li><a href=' + this.url + ' target="_blank">' + this.title + '</a>'
  text = ' (' + this.source + ' : ' + this.time + ')</li>';
  return title + text;
};

News.render = function (rawData) {
  rawData.forEach(function (ele) {
    art = new News(ele);
    $('#news-list').append(art.toHtml())
  });
};

News.ajaxCall = function () {
  $.ajax({
    url: 'http://newsy-bits.herokuapp.com/news',
  }).done(function (data) {
    hideSpinner();
    News.render(data);
  });
}

function newsRefresh() {
  $('.spinner').show()
  $.ajax({
    url: 'http://newsy-bits.herokuapp.com/crawl',
  }).done(function (data) {
    News.ajaxCall();
  });
}