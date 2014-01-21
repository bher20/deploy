$(document).ready(function(){
    if ($('#applications_table').length)
    {
        $('#applications_table').dataTable(
            {
                sPaginationType: "full_numbers",
                bJQueryUI: true,
                bProcessing: true,
                sScrollY: "208px",
                bPaginate: true,
                iDisplayLength: 20,
                aLengthMenu: [[20, 25, 50, 100, 200, -1], [20, 25, 50, 100, 200, "All"]]
            }).fnSort( [ [0,'acs'] ] );
    }
});

