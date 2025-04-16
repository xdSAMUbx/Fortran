PROGRAM ejercicioSeries

   IMPLICIT NONE

   !Declarando las variables a usar
   REAL :: x, gra, min, seg, seno1, seno2, fac, den
   INTEGER :: n, j, i
   REAL, PARAMETER :: rad = 3.141593/180

   !Solicitando las variables
   WRITE(*,*) 'Bienvenido al calculo de series del seno'
   WRITE(*,*) 'Ingresa por favor la cantidad de veces que quieres realizar el procedimiento: '
   READ (*,*) n
   WRITE(*,*) 'Ingresa el ángulo para el cual quieres calcular el seno'
   WRITE(*,*) 'Ingresa cada valor separado por comas de la siguiente manera'
   WRITE(*,*) 'Grados, Minutos, Segundos'
   READ(*,*) gra,min,seg

   !Evalua como se debe ajustar los angulos
   IF (seg >= 60.0) THEN !Evalua si hay que sumarle minutos a minutos dependiendo del valor ingresado en segundos
      min = min + (seg/60.0)
      seg = MOD(seg,60.0)
   END IF
   IF (min >= 60.0) THEN !Evalua si hay que sumar grados a grados dependiendo de la cantidad total de minutos que exista
      gra = gra + (min/60.0)
      min = MOD(min,60.0)
   END IF
   IF (gra < 0 ) THEN
      x = -(ABS(gra) + (min/60.0) + (seg/3600.0))
   ELSE
      x = gra + (min/60.0) + (seg/3600.0)
   END IF
   IF (ABS(x) > 360.0) THEN
      ERROR STOP 'El angulo que intentas ingresar esta fuera de los límites'
   END IF

   WRITE(*,*) 'El angulo que ingresaste es: ', x, '°'

   !Calculando el seno mediante la función
   seno1 = SIN(x * rad)

   !Calculando el seno mediante series
   seno2 = 0.0
   den = 1.0
   fac = 1.0 !Si n es 0 entonces el factorial es 1
   DO i = 1, n, 1
      den = ((2*i)+ 1)
      DO j = 1, INT(den)
         fac = fac * REAL(j)
      END DO
      seno2 = seno2 + (REAL(((-1)**i))*((x*rad)**REAL((2*i + 1))))/(fac)
   END DO

   WRITE(*,*) 'Calculado por el seno de Fortran: ',seno1
   WRITE(*,*) 'Calculado por el seno de Series: ',seno2

END PROGRAM ejercicioSeries
