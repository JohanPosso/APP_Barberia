

  /* Programación Reservas */
const d= document
  const reservaServicios = d.querySelector('.reserva-servicios'),
  detalleReserva = d.querySelector('.detalle-reserva'),
  misReserva= d.querySelector('.mis-reserva')
  
  d.addEventListener('click',(e) =>{
    if (e.target.matches('.btn-servicios > *')) {
      reservaServicios.classList.add('activo')
      detalleReserva.classList.remove('activo')
      misReserva.classList.remove('activo')

      d.querySelector('.btn-servicios').classList.add('activo')
      d.querySelector('.btn-detalle-reserva').classList.remove('activo')
      d.querySelector('.btn-mis-reserva').classList.remove('activo')

    }
      if (e.target.matches('.btn-detalle-reserva > *')) {
        detalleReserva.classList.add('activo')
        reservaServicios.classList.remove('activo')
        misReserva.classList.remove('activo')

        d.querySelector('.btn-servicios').classList.remove('activo')
        d.querySelector('.btn-detalle-reserva').classList.add('activo')
        d.querySelector('.btn-mis-reserva').classList.remove('activo')

      }
      if (e.target.matches('.btn-mis-reserva > *')) {
        detalleReserva.classList.remove('activo')
        reservaServicios.classList.remove('activo')
        misReserva.classList.add('activo')
        d.querySelector('.btn-servicios').classList.remove('activo')
        d.querySelector('.btn-mis-reserva').classList.add('activo')
        d.querySelector('.btn-detalle-reserva').classList.remove('activo')

      }
  
    })
  