#Se define la variable 'ready'
ready = undefined

#Se le da la funcionalidad 'sortable' a la variable 'ready'
ready = ->
  $('.sortable').sortable()
  return

#Se coloca en el DOM la funcionalidad que tiene ahora la variable 'ready'
$(document).ready ready 
