jQuery ->
  $('#people').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#people').data('source')
    order: [[0,'desc']],    
    aoColumnDefs: [
      { 'bSortable': false, 'aTargets': [1,2,3] }
    ]