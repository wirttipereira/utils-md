program converting
integer:: N, nspec, isp(4), nsr(4), k, spi, id(20000,1500), a, b, c, d
real:: box, rx(4000,1500), ry(4000,1500), rz(4000,1500), qq(4000,1500), sg, ep
character (len=10):: label(20000,1500), typ(4)


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
open (10, file='dump.lammpstrj', status='old')
open (20, file='conf.gro', status='unknown')
open (30, file="elef.xyz", status='unknown')
write(30,*)' 1724'
write(30,*)
open (40, file="erig.xyz", status='unknown')
write(40,*)' 1724'
write(40,*)
open (50, file="electrode.ff", status = 'unknown')
    sg=3.55000
    ep=0.29288
    k=0
    a=0
    b=0
    do i=1,N
      spi=1
      if(i.gt.isp(1)) spi=2
      if(i.gt.isp(1)+isp(2)) spi=3
      if(i.gt.isp(1)+isp(2)+isp(3)) spi=4
      do j=1,nsr(spi)
        k=k+1
        read(10,*) id(i,j), label(i,j), rx(i,j), ry(i,j), rz(i,j), qq(i,j)
        rx(i,j)=rx(i,j)*0.1
        ry(i,j)=ry(i,j)*0.1
        rz(i,j)=rz(i,j)*0.1
        rz(i,j)=rz(i,j)+11.0106
         if(i.le.isp(1)) then
             if (j.eq.1) label(i,j) = 'Sc'
             if (j.eq.2) label(i,j) = 'Ca'
             if (j.eq.3) label(i,j) = 'Cb'
             if (j.eq.4) label(i,j) = 'Cc'
             if (j.eq.5) label(i,j) = 'Cd'
             if (j.eq.6) label(i,j) = 'Ce'
             if (j.eq.7) label(i,j) = 'O1'
             if (j.eq.8) label(i,j) = 'Cf'
             if (j.eq.9) label(i,j) = 'Ha'
             if (j.eq.10) label(i,j) = 'Ha'
             if (j.eq.11) label(i,j) = 'Ha'
             if (j.eq.12) label(i,j) = 'Hb'
             if (j.eq.13) label(i,j) = 'Hb'
             if (j.eq.14) label(i,j) = 'Hc'
             if (j.eq.15) label(i,j) = 'Hc'
             if (j.eq.16) label(i,j) = 'Hc'
             if (j.eq.17) label(i,j) = 'Hd'
             if (j.eq.18) label(i,j) = 'Hd'
             if (j.eq.19) label(i,j) = 'He'
             if (j.eq.20) label(i,j) = 'He'
             if (j.eq.21) label(i,j) = 'Hf'
             if (j.eq.22) label(i,j) = 'Hf'
             if (j.eq.23) label(i,j) = 'Hf'
             write(20,1000)i,typ(spi),label(i,j),k,rx(i,j),ry(i,j),rz(i,j)
          endif
         if (i.gt.400.and.i.le.800) then
          write(20,1000)i,typ(spi),label(i,j),k,rx(i,j),ry(i,j),rz(i,j)
         endif
         if (i.eq.801) then
          a=a+1
          if(a.le.9) then
          write(20,1001)i,typ(spi),label(i,j),a,k,rx(i,j),ry(i,j),rz(i,j)
          write(30,1030)label(i,j), a, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1050)label(i,j), a, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(a.gt.9.and.a.le.99) then
          write(20,1002)i,typ(spi),label(i,j),a,k,rx(i,j),ry(i,j),rz(i,j)
          write(30,1031)label(i,j), a, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1051)label(i,j), a, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(a.gt.99.and.a.le.999) then
          write(20,1003)i,typ(spi),label(i,j),a,k,rx(i,j),ry(i,j),rz(i,j)
          write(30,1032)label(i,j), a, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1052)label(i,j), a, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(a.gt.999.and.a.le.1009) then
          label(i,j) = 'G'
          write(20,1001)i,typ(spi),label(i,j),a-1000,k,rx(i,j),ry(i,j),rz(i,j)
          write(30,1030)label(i,j), a-1000, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1050)label(i,j), a-1000, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(a.gt.1009.and.a.le.1099) then
          label(i,j) = 'G'
          write(20,1002)i,typ(spi),label(i,j),a-1000,k,rx(i,j),ry(i,j),rz(i,j)
          write(30,1031)label(i,j), a-1000, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1051)label(i,j), a-1000, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(a.gt.1099) then
          label(i,j) = 'G'
          write(20,1003)i,typ(spi),label(i,j),a-1000,k,rx(i,j),ry(i,j),rz(i,j)
          write(30,1032)label(i,j), a-1000, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1052)label(i,j), a-1000, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
         endif
         if (i.eq.802) then
          b=b+1
          label(i,j)='W'
          if(b.le.9) then
          write(20,1001)i,typ(spi),label(i,j),b,k,rx(i,j),ry(i,j),rz(i,j)
          write(40,1040)label(i,j), b,rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1050)label(i,j), b, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(b.gt.9.and.b.le.99) then
          write(20,1002)i,typ(spi),label(i,j),b,k,rx(i,j),ry(i,j),rz(i,j)
          write(40,1041)label(i,j), b,rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1051)label(i,j), b, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(b.gt.99.and.b.le.999) then
          write(20,1003)i,typ(spi),label(i,j),b,k,rx(i,j),ry(i,j),rz(i,j)
          write(40,1042)label(i,j), b,rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1052)label(i,j), b, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(b.gt.999.and.b.le.1009) then
          label(i,j) = 'Q'
          write(20,1001)i,typ(spi),label(i,j),b-1000,k,rx(i,j),ry(i,j),rz(i,j)
          write(40,1030)label(i,j), b-1000, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1050)label(i,j), b-1000, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(b.gt.1009.and.b.le.1099) then
          label(i,j) = 'Q'
          write(20,1002)i,typ(spi),label(i,j),b-1000,k,rx(i,j),ry(i,j),rz(i,j)
          write(40,1031)label(i,j), b-1000, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1051)label(i,j), b-1000, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
          if(b.gt.1099) then
          label(i,j) = 'Q'
          write(20,1003)i,typ(spi),label(i,j),b-1000,k,rx(i,j),ry(i,j),rz(i,j)
          write(40,1032)label(i,j), b-1000, rx(i,j)*10, ry(i,j)*10, rz(i,j)*10
          write(50,1052)label(i,j), b-1000, 'C', 12.011, qq(i,j), 'lj', sg, ep 
          endif
         endif
      enddo
    enddo

1000   format(i5,2a5,i5,3f8.3)
1001   format(i5,a5,a1,i1,X,X,i6,3f8.3)
1002   format(i5,a5,a1,i2,X,i6,3f8.3)
1003   format(i5,a5,a1,i3,i6,3f8.3)
1004   format(i5,a5,a1,i4,i5,3f8.3)

1030   format(X,a1,i1,X,X,X,3f11.5)
1031   format(X,a1,i2,X,X,3f11.5)
1032   format(X,a1,i3,X,3f11.5)
1033   format(X,a1,i4,3f11.5)

1040   format(X,a1,i1,X,X,X,3f11.5)
1041   format(X,a1,i2,X,X,3f11.5)
1042   format(X,a1,i3,X,3f11.5)
1043   format(X,a1,i4,3f11.5)

1050   format(a1,i1,a5,f7.3,f11.7,a3,f8.4,f8.5)
1051   format(a1,i2,a4,f7.3,f11.7,a3,f8.4,f8.5)
1052   format(a1,i3,a3,f7.3,f11.7,a3,f8.4,f8.5)
1053   format(a1,i4,a2,f7.3,f11.7,a3,f8.4,f8.5)

end program

