!Este codigo es un ejemplo que se llevo a cabo en el libro de Fortran for Scientists and Engineers
!EL proposito de este ejemplo es calcular la solución de una ecuación cuadrática

PROGRAM cuadratica
   IMPLICIT NONE

   !Declarando las variables
   REAL :: a,b,c
   REAL :: discriminante
   REAL :: parteImaginaria
   REAL :: parteReal
   REAL :: x1,x2

   !Código para los coeficientes de la ecuación
   WRITE (*,*) ' Este programa soluciona las raices de una ecuación cauadrática'
   WRITE (*,*) 'La ecuación tiene la forma de A * X ** 2 + B * X + C = 0'
   WRITE (*,*) 'Ingrese los coeficientes a,b y c:'
   READ (*,*) a, b, c

   !Confirmando los coeficientes
   WRITE (*,*) 'Los coeficientes son: ', a, b, c

   !Calculando el discriminante
   discriminante = b**2 - 4.0 * a * c

   !Calculando las raices dependiendo del valor del discriminante

   IF (discriminante > 0.0) THEN !Pueden existir dos soluciones reales, entonces:

      x1 = (-b + sqrt(discriminante)) / (2.0 * a)
      x2 = (-b - sqrt(discriminante)) / (2.0 * a)
      WRITE (*,*) 'Las raices son reales y diferentes: '
      WRITE (*,*) 'x1 = ', x1
      WRITE (*,*) 'x2 = ', x2

   ELSE IF (discriminante == 0.0) THEN !Las raices son reales y coinciden, entonces:
      x1 = -b / (2.0 * a)
      WRITE(*,*) 'Las raices son reales y coinciden: '
      WRITE(*,*) 'x1 = x2 = ', x1

   ELSE !Las raices son complejas, entonces:

      parteReal = (-b ) / (2.0 * a)
      parteImaginaria = sqrt(abs(discriminante)) / (2.0 * a)
      WRITE (*,*) 'Las raices son complejas: '
      WRITE (*,*) 'x1 = ', parteReal, ' + ', parteImaginaria, 'i'
      WRITE (*,*) 'x2 = ', parteReal, ' - ', parteImaginaria, 'i'
   END IF
END PROGRAM cuadratica
