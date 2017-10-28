$(document).ready(function() {

  showingAllReviews();
  showNewReviewForm();
  submitNewReview();
  favoriteButton();

});

var showingAllReviews = function() {
$('#all_reviews_link').on("click", function(e) {
  e.preventDefault();

var review_link = $(this);

var url = review_link.attr('href');

$.ajax({
  url: url,
}).done(function(response) {
  $('#review-container').append(response);
}).fail(function(error) {
  alert("Something went wrong");
});
});
};

var showNewReviewForm = function() {
  $('#new_review_link').on("click", function(e){
    e.preventDefault();

  var reviewLink = $(this);

  var url = reviewLink.attr("href")

  $.ajax({
    url: url,
  }).done(function(response){
    $('#review-form-container').append(response)
  }).fail(function(error){
    alert("Something went wrong")
  });
  reviewLink.hide();
  })
}

var submitNewReview = function() {
  $('#review-form-container').on("submit", '#new_review_form', function(e){
    e.preventDefault();

  var form = $(this)

  var url = $(this).attr('action');
  console.log(url)
  var method = $(this).attr('method');
  var data = $(this).serialize();

  $.ajax({
    url: url,
    method: method,
    data: data
  }).done(function(response){
    console.log(response)
    $('.list').append(response);
    form.trigger("reset");
    $('.errors').remove();
  }).fail(function(response) {
    $('.errors').remove();
    form.before(response.responseText)
  });
});
};

var favoriteButton = function() {
  $('#favorite-button').on("submit", function(e){
    e.preventDefault();

  var favoriteButton = $(this);

  var url = favoriteButton.attr("action");
  var method = favoriteButton.attr("method");
  var data = favoriteButton.serialize();

  $.ajax({
    url: url,
    method: method,
    data: data
  }).done(function(response){
  favoriteButton.css('color', '#008000')

  }).fail(function(error) {
    console.log("something went wrong");
  });
  });
}

// var showLoginForm = function() {
//   $("#nav").on("click", "#login-link")
// }

