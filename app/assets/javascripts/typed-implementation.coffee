ready = ->
#Sobreescribiendo el método new de Typed.js
  Typed.new '.element',
    strings: [
      "Somos un café enfocado en el impulso del talento extranjero y nacional, creando experiencia a través de la lectura, 
      el arte y una buena taza de café."
    ]
    typeSpeed: 20
  return

$(document).ready ready
#Llamar a la función ready, cuando se ejecute turbolinks
#turbolinks permite cargar páginas un poco más rápido, cargándolas en caché
$(document).on 'turbolinks:load', ready