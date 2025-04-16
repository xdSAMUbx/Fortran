PROGRAM factorial
   IMPLICIT NONE

   INTEGER(8) :: n, fac, i
   WRITE(*,*) 'Ingrese el factorial que desea calcular: '
   READ(*,*) n !El enteo máximo a calcular es 31!
   fac = 1
   DO i = 1, n, 1
      fac = fac * i
      WRITE(*,*) 'El valor para ',i,' es: ',fac
   END DO

END PROGRAM factorial
