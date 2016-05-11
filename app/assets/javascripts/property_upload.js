$(function(){
  var ids = [];
  $('#property_upload').fileupload({
    done: function (e, data) {
      ids.push(data.result.property_picture_id);
      $('#property_pictures_ids').val(ids);
    }
  });
});