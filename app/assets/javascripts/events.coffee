#Se definen las variables 
ready = undefined
set_positions = undefined

set_positions = ->
  #Se llama a la clase card y se iteran todas las cards
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return


#Se le da la funcionalidad 'sortable' a la variable 'ready'
ready = ->
  set_positions()
  #Seleccionar la clase 'sortable' y se llama al método 'sortable'
  $('.sortable').sortable()
  #El método 'sortupdate' realiza el reordenamiento del id de todas las cards
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.card').each (i) ->
      updated_order.push
        #Se toma el id que está en la card y se inserta en el array
        id: $(this).data('id')
        position: i + 1
      return
    #Se realiza la comunicación directa con rails
    $.ajax
      beforeSend: (xhr) ->
        return xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
      #Se realiza una actualización de la base de datos utilizando el método 'PUT'
      type: 'PUT'
      #Se realiza la comunicación
      url: '/events/sort'
      #Se actualiza el orden de las cards
      data: order: updated_order
    return
  return

#Se coloca en el DOM la funcionalidad que tiene ahora la variable 'ready'
$(document).ready ready 
