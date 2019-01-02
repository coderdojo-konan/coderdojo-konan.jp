function sns_window( item, height, width ){
  var size = 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height='+height+', width='+width;
  window.open( item.href, '_blank', size );
  return false;
}
