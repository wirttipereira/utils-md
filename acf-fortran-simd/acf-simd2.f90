program acf_simd

!Rafael
! gfortran -fopenmp -O3 acf-simd2.f90 -o acf-simd2
!$use omp lib

!  !DIR$ SIMD


integer :: i,j,k,n,x
real :: aux,linha(12000000),p(12000000),v1(12000000),v2(12000000),s(12000000),r(12000000),soma,media,variancia0 !p(1000000000)

!n=12500000
n=1000000
lag=10000 !50000

!'pressure.dat'
!'statology.dat'
!'p1M.dat'
open(10,file='p1M.dat', status='old')
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
    aux=0

! !$omp parallel do
!dir$ simd
    do i=1, lag
      aux=0
      aux=produto_vetor(i)
      s(i)=aux/n           !autocovariancia
      r(i)=s(i)/variancia0 !ACF
      write(50,*) linha(i), r(i)
    end do
!  !omp end parallel do

contains

  function produto_vetor(i) result(y)
    integer :: i,k
    real :: y
      aux=0
      do k=1,n-i
        v1(k)=p(k)-media !v1=p(1:n-1)-media
      end do
      do k=i+1, n
        v2(k-i)=p(k)-media !v2=p(k+1:n)-media
      end do
      do j=1,n-i
        aux=aux+(v1(j)*v2(j))
      end do
  end function produto_vetor

end program