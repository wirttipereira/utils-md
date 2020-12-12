program teste
!$use omp lib

integer::n

n=1000000000


!$dir simd 
do i=1, n
 res = i * i
 print *,i
enddo
!$dir end simd

end program
