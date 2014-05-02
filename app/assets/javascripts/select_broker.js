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
  });

  function canSelectBroker() {
    return $("input:checkbox:checked").length < 3;
  }
})();
