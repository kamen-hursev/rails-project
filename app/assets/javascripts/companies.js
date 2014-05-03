(function () {
  $(function () {
    $("#company_type").on("change", function () {
      var $this = $(this);
      if (!$this.val()) {
        $("#company_info").html('');
        return;
      }
      $.get($this.data("url"), {"type": $this.val()}).done(function (data) {
        $("#company_info").html(data);
      });
    });

    $("#company_info").on("click", ".add-person", function () {
      var $this = $(this),
        template = $(".company-people li.template"),
        newIndex = $(".company-people li.section").length,
        replacePattern = new RegExp($this.data("replacePattern"), "g"),
        content = template.html().replace(replacePattern, newIndex),
        addSection = $("<li></li>").html(content).addClass("section");

        addSection.insertBefore(template);
        if ($this.data("maxItems") && $this.data("maxItems") <= $(".company-people li.section").length) {
          $this.hide();
        }
    });

    $("#company_info").on("submit", "form", function () {
      // we need this to prevent the template li being submitted
      $(this).find("li.template").remove();
    });
  });
})();
