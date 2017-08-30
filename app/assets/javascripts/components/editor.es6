$(document).ready(() => {
  var quill = new Quill('#editor', {
    theme: 'snow',
    modules: {
      toolbar: true
    }
  });

  $(".edit-save").addClass("canHover");
  $(".edit-btn").click(() => {
    $(".edit-btn").hide()
    $(".editor-container").removeClass("hidden")
    quill.focus()
  })


  $(".editor-cancel").click(() => {
    $(".edit-btn").show()
    $(".editor-container").addClass("hidden")
  })

  $(".editor-save").click(() => {
    $(".edit-btn").show()
    $(".editor-container").addClass("hidden")

    var editorContent = quill.getText();
    if(editorContent !== "\n") {
      console.log(editorContent)
      var newComment = `
        <div class="comment-column saving">
          <div class="author">
            ${current_user.name}
          </div>
          <span class="datetime small">儲存中...</span>
          <div class="content">
            ${editorContent}
          </div>
        </div>
      `
      $(".new-comment").prepend(newComment)

      setTimeout(() => {
        $(".saving .datetime").text("2017-08-30")
        $(".saving").removeClass("saving")
      }, 1000)
    }
    quill.setText('')
  })

})
