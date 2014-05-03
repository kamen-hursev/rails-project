(function () {
  $(function () {
    $("#company_type").on("change", function () {
      var $this = $(this);
      if (!$this.val()) {
        return;
      }
      $.get($this.data("url"), {"type": $this.val()}).done(function (data) {
        $("#company_info").html(data);
      });
    });
  });
})();