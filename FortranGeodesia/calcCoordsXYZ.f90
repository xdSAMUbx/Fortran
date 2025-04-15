!Este es un programa de ejemplo que calcula las coordenadas XYZ para un punto en WGS 84 a partir de una latitud y longitud conocida

PROGRAM coordsGeocentricas

   IMPLICIT NONE

   !Declarando las variables de inicio
   REAL :: lat, lon, h, N, x, y, z, gra, min, seg
   CHARACTER (len = 1) :: dirLongitud
   REAL, PARAMETER :: a = 6378137.0 !Es el semieje mayor en WGS 84
   REAL, PARAMETER :: b = 6356752.314 !Es el semieje menor en WGS 84
   REAL, PARAMETER :: e2 = 6.69438E-3 !Es la excentricidad
   REAL, PARAMETER :: rad = 3.1415926535 / 180.0 !Constante para convertir de grados a radianes

   !Solicitando la latitud en grados sexagesimales
   WRITE (*,*) 'Bienvenido al segundo cálculo geodésico llevado a cabo en Fortran'
   WRITE (*,*) 'Por favor ingresa la latitud en el siguiente orden: '
   WRITE (*,*) 'Grados, Minutos y Segundos'
   READ (*,*) gra, min, seg

   !Verificación si la latitud es correcta
   IF (gra > 90.0 .OR. gra < -90.0) THEN !Verifica si la latitud es mayor a la máxima latitud
      WRITE (*,*) 'La latitud máxima es de 90° o la mínima es de -90°, vuelva a intentarlo'
      STOP
   ELSE IF (gra < 0.0) THEN !Veifica si la latitud es negativa
      lat = -(gra + (min/60.0) + (seg/3600.0))
   ELSE
      lat = gra + (min/60.0) + (seg/3600.0)
   END IF

   WRITE (*,*) 'La latitud es: ', gra, '° ', min, ''' ', seg, '"'

   !Solicitando la longitud
   WRITE (*,*) 'Bienvenido al segundo cálculo geodésico llevado a cabo en Fortran'
   WRITE (*,*) 'Por favor ingresa la longitud en el siguiente orden: '
   WRITE (*,*) 'Grados, Minutos y Segundos'
   READ (*,*) gra, min, seg
   WRITE(*,*) 'Ingrese la dirección de la longitud si es Este (E) u Oeste (W): '
   READ (*,*) dirLongitud

   IF (seg > 60.0 .OR. min > 60.0 .OR. gra > 60.0) THEN
      WRITE (*,*) 'Ingreso un número invalido, vuelva a intentarlo'
   END IF

   WRITE (*,*) 'La longitud es: ', gra, '° ', min, ''' ', seg,'" ', dirLongitud

   !Verificación la dirección de la longitud
   IF (dirLongitud == 'W' .OR. gra < 0.0) THEN !Verifica si la dirección es correcta
      lon= 360.0 -(gra + (min/60.0) + (seg/3600.0))
   ELSE IF (dirLongitud == 'E' .OR. gra > 0.0) THEN !Veifica si la longitud es Este
      lon= gra + (min/60.0) + (seg/3600.0)
   ELSE !Verifica si la longitud es Oeste
      WRITE(*,*) 'No ingresó una dirección correcta, vuelva a intentearlo'
      STOP
   END IF

   !Solicitando la altura del punto
   WRITE (*,*) 'Ingrese la altura del punto en metros sobre el nivel del mar:'
   READ (*,*) h
   WRITE(*,*) 'La altura es: ',h,' m'
   !Calculando la ubicación geocéntrica del punto
   N = (a / (SQRT(1.0 - (e2 * ((SIN(lat * rad))**2.0)))))
   x = (N + h ) * COS(lat * rad) * COS (lon * rad)
   y = (N + h ) * COS(lat * rad) * SIN (lon * rad)
   z = (((1 - e2) * N) + h) * SIN (lat * rad)

   !Imprimiendo los resultados
   WRITE (*,*) 'La gran normal es: ',N, ' m'
   WRITE (*,*) 'X = ',x,' m'
   WRITE (*,*) 'Y = ',y,' m'
   WRITE (*,*) 'Z = ',z,' m'

END PROGRAM coordsGeocentricas
