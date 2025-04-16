PROGRAM factorial
   IMPLICIT NONE

   INTEGER :: n, fac, i, count_start,count_end,count_rate
   REAL :: tiempo
   WRITE(*,*) 'Ingrese el factorial que desea calcular: '
   READ(*,*) n !El enteo máximo a calcular es 31!
   fac = 1
   CALL system_clock(count_start)  ! Inicia cronómetro
   DO i = 1, n
      fac = fac * i
   END DO
   CALL system_clock(count_end)    ! Finaliza cronómetro
   CALL system_clock(count_rate)
   WRITE(*,*) 'El valor para ',i,' es: ',fac
   PRINT *, 'Tiempo de ejecución (segundos): ', tiempo

END PROGRAM factorial
