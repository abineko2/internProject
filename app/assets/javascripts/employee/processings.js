// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load',function(){
    $('.js-searchable').select2({
        allowClear: true
      });
  });