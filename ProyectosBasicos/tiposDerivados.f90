program derivados
   implicit none

   !Un typo derivado se puede crear de la siguiente manera:
   type :: tPair
      integer :: i
      real :: x
   end type
   !De esta manera se declara
   type(tPair) :: pair
   !Finalmente se accede (%) a los tipos derivados de la siguiente forma:
   !pair%i = 1
   !pair%x = 2.1

   !Como normalmente se debe iniciar
   pair = tPair(i = 1, x = 0.5) !pair%i = 1, pair%x = 2.1
   print *, 'pair = ',pair

end program derivados

