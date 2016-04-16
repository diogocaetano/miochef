$(function () {

  $('.summernote').summernote({
    height: 100,
    minHeight: null, // set minimum height of editor
    maxHeight: null, // set maximum height of editor
    lang: 'pt-BR',
    toolbar: [
      // [groupName, [list of button]]
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough', 'superscript', 'subscript']],
      ['fontsize', ['fontname', 'fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['height', ['height']],
      ['insert', ['hr']],
      ['misc', ['codeview', 'undo', 'redo', 'help']]
    ]
  });

});
