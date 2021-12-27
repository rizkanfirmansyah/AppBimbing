// Call the dataTables jQuery plugin
$(document).ready(function () {
    $("#dataTableCustom").DataTable({
        dom: "lBfrtip", // datatable layout without  horizobtal scroll
        order: [[1, "asc"]],
        lengthMenu: [
            [5, 15, 20, -1],
            [5, 15, 20, "All"], // change per page values here
        ],
        buttons: [
            {
                extend: "pdf",
                text: '<i class="fas fa-file-pdf fa-1x" aria-hidden="true"> Export as PDF</i>',
            },
            {
                extend: "csv",
                text: '<i class="fas fa-file-csv fa-1x"> Export as CSV</i>',
            },
            {
                extend: "excel",
                text: '<i class="fas fa-file-excel" aria-hidden="true"> Export as EXCEL</i>',
            },
            {
                extend: "print",
                text: '<i class="fas fa-print" aria-hidden="true"> Print</i>',
            },
        ],
        // set the initial value
        pageLength: 5,
    });
    $("#dataTable").DataTable();
    $("#dataTable2").DataTable();
});
