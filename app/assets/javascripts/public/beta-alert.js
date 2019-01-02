$(function() {
  if(Cookies.get('access') == undefined) {
      Cookies.set('access', 'on', { expires: 7 });
      $('#beta-alert-modal').modal()
  }
});
