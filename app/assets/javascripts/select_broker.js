(function () {
  $(function () {
    $(".brokers-list").on("click", "li", function () {
      var $this = $(this),
        checkbox = $this.find("input:checkbox"),
        isChecked = checkbox.prop("checked");
      $this.removeClass("selected");
      if (!isChecked && !canSelectBroker()) {
        return;
      }
      checkbox.prop("checked", !isChecked);
      if (checkbox.prop("checked")) {
        $this.addClass("selected");
      }
    });

    $("form#brokers").on("ajax:success", function (event, data, status) {
      if (!data.success) {
        var error = $("<p></p>").addClass("error").html(data.error);
        error.insertAfter($(this).find(".btn-next"));
        error.fadeOut(3000);
      } else {
        window.location = $(this).data("successUrl");
      }
    });
  });

  function canSelectBroker() {
    return $("input:checkbox:checked").length < 3;
  }
})();
