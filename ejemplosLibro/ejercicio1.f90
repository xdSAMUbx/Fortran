!El siguiente codigo muestra el calculo de la hipotenusa para un triangulo rectangulo
!Conociendo la hipotenusa (c) y el angulo theta
PROGRAM trianguloRectangulo
   IMPLICIT NONE
   ! Definiendo las variables y constantes
   REAL :: a, b, c, gra, min, seg, theta
   REAL, PARAMETER :: rad = 3.1415926535 / 180.0 !Constante para convertir de grados a radianes

   !Solicitando los valores de insumo al usuario
   WRITE(*,*) 'Ingrese el valor de la hipotenusa (c): '
   READ (*,*) c
   WRITE(*,*) 'Ingrese el valor del angulo (theta) en grados sexagesimales: '
   READ (*,*) gra, min, seg

   IF (gra < 0 ) THEN !Verifica si el angulo es negativo
      WRITE(*,*) 'El angulo no puede ser negativo'
      STOP
   ELSE IF (gra > 360) THEN !Verifica si el angulo es mayor a 360
      WRITE (*,*) 'El angulo no puede ser mayora 360'
   ELSE
      theta = gra + (min/60.0) + (seg / 3600.0)
   END IF

   !Calculando los lados lados faltantes del triangulo
   a = c * COS(theta * rad)
   b = c * SIN(theta * rad)

   !Mostrando los resultados
   WRITE(*,*) 'El valor de los catetos faltantes es: '
   WRITE(*,*) 'Cateto a: ', a, 'm'
   WRITE(*,*) 'Cateto b: ', b, 'm'

END PROGRAM trianguloRectangulo
