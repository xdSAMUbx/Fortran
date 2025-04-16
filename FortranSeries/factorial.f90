PROGRAM factorial
   IMPLICIT NONE

   INTEGER :: n, fac, i
   WRITE(*,*) 'Ingrese el factorial que desea calcular: '
   READ(*,*) n !El enteo máximo a calcular es 31!
   fac = 1
   DO i = 1, n
      fac = fac * i
   END DO
   WRITE(*,*) 'El valor para ',i,' es: ',fac

END PROGRAM factorial
