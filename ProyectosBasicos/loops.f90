program loop
   implicit none

   !Las variables siempre se deben declarar al inicio del codigo
   integer :: i, j
   real :: temp(1000), newTemp(1000)

   print *, 'Imprimiendo con do'
   do i = 1,10
      print *,i
   end do
   print*, i

   print *, 'Imprimiendo con do con paso de 2'
   do i = 1 , 10 , 2
      print *, i ! imprime numeros impares
   end do

   i = 1
   print *, 'Imprimiendo con do while'
   do while (i<11)
      print *, i
      i = i + 1
   end do

   print *, 'Imprimiendo con condicional (exit)'
   ! Va a iterar de 1 a 100
   do i = 1, 100
      ! Si i es mayor que 10, entonces termina el loop
      if (i > 10) then
         exit !Termina de imprimir numeros
      end if
      print *, i
   end do

   print *, 'Imprimiendo con condicional (cycle)'
   do i = 1, 10
      if (mod(i, 2) == 0 )then !mod es la division entera
         cycle !Sale del ciclo y continua con la siguiente iteracion
      end if
      print *, i !Imprime los numeros impares
   end do

   print *,'Imprimiendo con listas unidas'
   outerLoop: do i = 1,10 !Cambia de iterados solo hasta que j reocorrio los datos
      innerLoop: do j = 1,10
         if ((j+i) > 10) then !Cuando la suma de i, j es mayor a 10 entonces sale del ciclo interno y continua con el externo

            cycle outerLoop
         end if
         print *, 'I =  ',i,'J = ',j,'Suma = ',j+i
      end do innerLoop
   end do outerLoop

   ! Ejemplo de un do loop util
   do concurrent (i = 1:1000)
      newTemp(i) = temp(i) + 273.5
   end do
   print *, 'Temperatura en Kelvin:', newTemp
end program loop
