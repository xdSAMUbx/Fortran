program arrays
   implicit none

   ! Una dimensión vector de enteros, declaración de arrays
   !integer, dimension (10) :: array1

   integer :: i
   integer :: array1(10) !Vector de 10 elementos
   integer, dimension(2,3) :: array2 !Matriz de 2x3 elementos
   !integer :: array2(2,3) !Matriz de 10x10 elementos

   array1 = [1,2,3,4,5,6,7,8,9,10]
   array2 = reshape([1,2,3,4,5,6], shape(array2))

   print *, "Como imprimir un vector completamente: "
   print *, array1

   print *, " Como imprimir un vector en pasos separados:"
   print *, array1(1:10:2)

   print*, "Como imprimir un vector en reversa: "
   print*, array1(10:1:-1)

   array1(:) = 0
   print *, "Todos los elementos del vector son cero:"
   print *, array1

   ! Así se hace un loop constructor en fortran
   array1 = [(i, i=1, 10)]
   print *, "Vector con loop constructor:"
   print *, array1

   print *, "Imprimiendo la matriz:"
   print *, array2

end program arrays
