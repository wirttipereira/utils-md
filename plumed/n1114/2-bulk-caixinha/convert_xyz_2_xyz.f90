program converting
integer:: N, nspec, isp(4), nsr(4), k, spi
real:: box, rx(2400,80), ry(2400,80), rz(2400,80)
character (len=10):: label(2400,80), typ(4)


open (5, file='system.inpt', status='old')
  read(5,*) N
  read(5,*) nspec
  do i=1,nspec
    read(5,*) isp(i)
    read(5,*) nsr(i)
    read(5,*) typ(i)
  enddo
  read(5,*) box
close (5)
!
open (10, file='conf.xyz', status='old')
open (20, file='conf2.xyz', status='unknown')
    k=0
    do i=1,N
      spi=1
      if(i.gt.isp(1)) spi=2
      if(i.gt.isp(1)+isp(2)) spi=3
      do j=1,nsr(spi)
        k=k+1
        read(10,*) label(i,j), rx(i,j), ry(i,j), rz(i,j)
        rx(i,j)=rx(i,j)*10.
        ry(i,j)=ry(i,j)*10.
        rz(i,j)=rz(i,j)*10.
         write(20,*) label(i,j),rx(i,j),ry(i,j),rz(i,j)
!        write(20,1000)i,typ(spi),label(i,j),k,rx(i,j),ry(i,j),rz(i,j)
      enddo
    enddo

1000   format(i5,2a5,i5,3f8.3)

end program

