!Este codigo es una práctica inicial del uso de Fortran para calculos geodésicos
!El propósito de este código es calcular la gran normal para cualquier punto del elipsoide
!En este código se asumen los angulos en grados sexagesimales

PROGRAM granNormal
   IMPLICIT NONE

   !Declaración de variables
   REAL :: gra, min, seg, lat, lon, h, N
   CHARACTER(LEN = 1) :: dirLongitud
   REAL, PARAMETER :: a = 6378137.0 !Es el semieje mayor en WGS 84
   REAL, PARAMETER :: b = 6356752.314 !Es el semieje menor en WGS 84
   REAL, PARAMETER :: e2 = 6.69438E-3 !Es la excentricidad
   REAL, PARAMETER :: rad = 3.1415926535 / 180.0 !Constante para convertir de grados a radianes

   !Solicitando la latitud en grados sexagesimales
   WRITE(*,*) 'Bienvenido al primer cálculo geodésico realizado en Fortran, por favore ingrese la latitud en sexagesimales'
   READ(*,*) gra, min, seg
   IF (gra < 0.0) THEN

      lat = -(gra + (min/60.0) + (seg/3600.0))

   ELSE IF (gra ==  90.0 .OR. gra == -90.0) THEN

      WRITE (*,*) 'La latitud máxima es de 90°, vuelva a intentarlo'
      STOP

   ELSE

      lat = gra + (min/60.0) + (seg/3600.0)

   END IF

   !Solicitando la longitud
   WRITE (*,*) 'Ahora ingrese la Longitud del punto en sexagesimales, recuerde mencionar en si se encuentra al este (E) u oeste (W)'
   READ(*,*) gra, min, seg
   WRITE (*,*) 'Ingrese la dirección de la longitud (E/W):'
   READ (*,*) dirLongitud
   !El programa evalua si es este u oeste con el fin de realizar el mejor calculo posible
   IF (dirLongitud == 'E') THEN
      lon = gra + (min/60.0) + (seg/3600.0)
   ELSE IF (dirLongitud == 'W') THEN
      lon = 360.0 - (gra + (min/60.0) + (seg/3600.0))
   ELSE
      WRITE (*,*) 'No ingresó una dirección válida, vuelva a intentarlo'
      STOP
   END IF

   !Solicitando la altura
   WRITE(*,*) 'Ingrese la altura del punto en metros sobre el nivel del mar: '
   READ(*,*) h

   WRITE(*,*) 'La latitud es: ', lat , '°'
   WRITE(*,*) 'La longitud es: ', lon , '°'
   WRITE(*,*) 'La altura es: ', h, 'm'

   !Calculando la normal
   N = (a / (SQRT(1.0 - (e2 * ((SIN(lat * rad))**2.0)))))
   WRITE(*,*) 'La normal es: ', N, 'm'

END PROGRAM granNormal
