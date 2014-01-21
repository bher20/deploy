$(document).ready(function(){
    if ($('#deployment_logs_table').length)
    {
        $('#deployment_logs_table').dataTable(
            {
                sPaginationType: "full_numbers",
                bJQueryUI: true,
                bProcessing: true,
                sScrollY: "208px",
                bPaginate: true,
                iDisplayLength: 5,
                aLengthMenu: [[5, 10, 15, 25, 50, 100, 200, -1], [5, 10, 15, 25, 50, 100, 200, "All"]]
            }).fnSort( [ [0,'desc'] ] );
    }
});