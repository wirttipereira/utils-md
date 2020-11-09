program acf_simd

!Rafael
! gfortran -fopenmp -O3 acf-simd.f90 -o acf-simd
!$use omp lib

integer :: i,j,k,n,x
real :: aux,linha(12000000),p(12000000),v1(12000000),v2(12000000),s(12000000),r(12000000),soma,media,variancia0 !p(1000000000)

!n=12500000
n=12000000
lag=50000

!'pressure.dat'
!'statology.dat'
open(10,file='pressure.dat', status='old')
open(50,file='out.dat', status='unknown')
    !Le o arquivo de entrada
    aux=0
	do k=1,n
      read(10,*) linha(k), p(k)
      !print *, p(k)
      aux=aux+p(k)
    end do
    soma=aux
    print *,soma
    media=soma/n
    print *,media
    !Calcula variancia
    aux=0
    do k=1,n
      aux=aux+(p(k)-media)**2
    end do
    variancia0 = aux/n !variancia da populacao. Se fosse da amostra, dividiria por n-1
    print *, variancia0
    !Calcula acf
    
    aux=0
    do i=1,lag
      aux=0
      do k=1,n-i
        !v1=p(1:n-1)-media !coloca no vetor v1 valor de p menos media
        v1(k)=p(k)-media
      end do
      do k=i+1, n
        !v2=p(k+1:n)-media
        v2(k-i)=p(k)-media
      end do
!DIR$ SIMD

!   !$omp parallel do
      do j=1,n-i
        aux=aux+(v1(j)*v2(j))
      end do
!   !omp end parallel do

      s(i)=aux/n           !autocovariancia
      r(i)=s(i)/variancia0 !ACF
      !print *, s(i)
      !print *, r(i)
      write(50,*) linha(i), r(i)
    end do


end program