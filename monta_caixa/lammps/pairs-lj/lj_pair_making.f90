 program lj
 integer n, typ(99999), i, j
 real    eps(99999), sig(99999), epsi, sigm

 open (10, file='pair_coeff.dat', status='old')
 open (25, file='pair_lj.txt', status='unknown')
 read (10,*) n
 do i=1,n
   read(10,*) typ(i), eps(i), sig(i)
 enddo
 close (10)
 do i=1,n
   do j=i,n
     epsi=sqrt(eps(i)*eps(j))
     sigm=0.5*(sig(i)+sig(j))
     write(25,*) 'pair_coeff', i,j,epsi,sigm
   enddo
 enddo


 end program 
   
