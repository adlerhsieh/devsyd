class Editor {
  constructor() {
    this.quill = new Quill('#editor', {
      theme: 'snow',
      modules: {
        toolbar: true
      }
    });

    this.container = $(".editor-container")
      if(this.container.length < 1) {
        throw new this.MissingElementError("Element with class name 'editor-container'")
      }

    this.showButton = $(".edit-btn")
      if(this.showButton.length < 1) {
        throw new this.MissingElementError("Element with class name 'edit-btn'")
      }
    this.showButton.addClass("clickable");
    this.showButton.click(() => {
      if (gon.current_user !== undefined) {
        this.show();
      } else {
        location.href = `/users/sign_in?s=1&r=${location.pathname}`;
      };
    });

    this.cancelButton = $(".editor-cancel")
      if(this.cancelButton.length < 1) {
        throw new this.MissingElementError("Element with class name 'editor-cancel'")
      }
    this.cancelButton.click(() => {
      this.cancel()
    })

    this.saveButton = $(".editor-save")
      if(this.saveButton.length < 1) {
        throw new this.MissingElementError("Element with class name 'editor-save'")
      }
    this.saveButton.click(() => {
      this.save()
    })

  }

  show() {
    this.showButton.hide()
      this.container.removeClass("hidden")
      this.quill.focus()
  }

  cancel() {
    this.showButton.show()
      this.container.addClass("hidden")
  }

  save() {
    this.showButton.show()
      this.container.addClass("hidden")

      var editorContent = this.quill.root.innerHTML;
    if(editorContent !== "<p><br></p>") {
      var newComment = `
        <div class="comment-column saving">
        <div class="author">
        ${gon.current_user.fullname}
      </div>
        <span class="datetime small">儲存中...</span>
        <div class="content">
        ${editorContent}
      </div>
        </div>
        `
        $(".new-comment").prepend(newComment)

        $.post(`/posts/${gon.post.id}/comments`, {
          content: editorContent
        }).done((data) => {
          if (data.status == 1) {
            $(".saving .datetime").text(data.datetime);
            $(".saving").removeClass("saving");
            this.quill.setText('');
          };
          if (data.status == 0) {
            alert("抱歉，發生錯誤，請再試一次");
            $(".saving").remove();
            this.showButton.hide();
            this.container.removeClass("hidden");
            this.quill.focus();
          };
        });
    };
  };

  MissingElementError(message) {
    this.message = message
      this.name = "MissingElementError"
  }
}

$(document).ready(() => {
  // var editor = new Editor;
  quill = new Quill('#editor', {
    theme: 'snow',
    modules: {
      toolbar: true
    }
  });

  $(".editor-cancel").click(() => {
    location.href = document.referrer;
  });

  $(".editor-save").click(() => {
    var editorTitle = $(".new-post-title").val();
    var editorContent = this.quill.root.innerHTML;
    if(editorContent !== "<p><br></p>") {
      $.post(`/forum/posts`, {
        title: editorTitle,
        content: editorContent
      }).done((data) => {
        if (data.status == 1) {
          location.href = `/forum/posts/${data.post.id}`
        };
        if (data.status == 0) {
          alert("抱歉，發生錯誤，請再試一次");
        };
      });
    };
  });

});
