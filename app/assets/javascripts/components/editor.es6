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

      $.post("/posts/1/comments", {
        content: editorContent
      }).done((data) => {
        if (data.status == 1) {
          $(".saving .datetime").text(data.datetime)
          $(".saving").removeClass("saving")
          quill.setText('')
        }
        if (data.status == 0) {
          alert("抱歉，發生錯誤，請再試一次")
          $(".saving").remove()
          $(".edit-btn").hide()
          $(".editor-container").removeClass("hidden")
          quill.focus()
        }
      })
    }
  })

})
