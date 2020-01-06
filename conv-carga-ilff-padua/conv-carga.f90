! RGP - 6.Jan.2020
! wirttipereira@hotmail.com
!
! Multiplica a coluna de carga somente, por um fator.
!Tipicamente eu utilizo o fator de 0.8 mas pode ser qualquer outro.
program conv_carga

integer:: N, i
!real:: charge(2400,80), mass(2400,80), sigma(2400,80), eps(2400,80)
real:: charge(100), mass(100), sigma(100), eps(100)
character (len=10):: atom(3), typ(2), label(2)

! N, numero de linhas do arquivo
N = 98


open (10, file='il-atoms.ff', status='old')
open (20, file='il-convertido.ff', status='unknown')

	do i=1, N
		read(10,*)atom(i), typ(i), mass(i), charge(i), label(i), sigma(i), eps(i) 
		charge(i) = charge(i) * 0.8
		write(20, 1000) atom(i), typ(i), mass(i), charge(i), label(i), sigma(i), eps(i)
	enddo
	
1000 format(a6,a2, 2f8.3, 2x, a6, f5.3, f9.5)

end program
