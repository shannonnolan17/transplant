$(document).ready(function() {

  showingAllReviews();

});

var showingAllReviews = function() {
$('#all_reviews_link').on("click", function(e) {
  e.preventDefault();

var review_link = $(this);

var url = review_link.attr('href');

$.ajax({
  url: url
}).done(function(response) {
  $('#review-container').append(response);
}).fail(function(error) {
  alert("Something went wrong");
});
});
};

var creatingNewReview = function() {
  $('#new_review_link').on("click", function(e) {
    e.preventDefault();


  })
}




