# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery -> $('#deployment_logs').dataTable(
  {
    sPaginationType: "full_numbers"
    bJQueryUI: true,
    bProcessing: true,
    sScrollY: "228px",
    bPaginate: true,
    iDisplayLength: 10,
    aLengthMenu: [[10, 25, 50, 100, 200, -1], [10, 25, 50, 100, 200, "All"]]
  }).fnSort( [ [0,'desc'] ] );