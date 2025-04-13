!-------------------------------------------------------------------
!Explicación del programa:
!Fortran permite el organizar su programas con subruotines o funciones
!Las subrutinas son bloques de código que se pueden llamar desde cualquier parte del programa (no devuelven resultados)
!Las funciones pueden ser llamadas desde cualquier parte del programa con una asignación por lo tanto deben devolver un resultado
!-------------------------------------------------------------------

!Las subrutinas siempre estan por fuera del programa principal
!En caso contrario usar contains para poder tenerlas dentro del programa Main
!La mejor practica es usar modulos para organizar el código, este igualmente debe estar por fuera del programa principal
!En este caso se declaran las subrutinas y funciones antes del programa principal

subroutine printMatrix(n,m,A)
   implicit none
   integer, intent(in) :: n
   integer, intent(in) :: m
   real, intent(in) :: A(n,m)

   integer :: i

   do i = 1, n
      print *, A(i, 1:m)
   end do
end subroutine printMatrix

!Funciones
function vectorNorm(n, vec) result(norm)

   implicit none
   integer, intent(in) :: n
   real, intent(in) :: vec(n)
   real :: norm

   norm = sqrt(sum(vec**2))

end function vectorNorm

program main
   implicit none
   ! Variable para la subrutina
   real :: mat(10,20)
   !Variable para la funcion
   real:: v(9)
   real:: vectorNorm

   mat(:,:) = 0.0
   v(:) = 9

   call printMatrix(10,20,mat)
   print*, 'Norma del Vector = ', vectorNorm(9,v)

end program main
