program z_density
 implicit real*8(a-h,o-z)

 parameter (mxatms=20000)
 character*40 fname
 character*80 title
 character*1 atmnam(mxatms)
 character*8 tistep
 dimension xxx(mxatms),yyy(mxatms),zzz(mxatms),qq(mxatms)
 dimension vx(mxatms),vy(mxatms),vz(mxatms)
 dimension fx(mxatms),fy(mxatms),fz(mxatms)
 dimension weight(mxatms),chrg(mxatms) 
 integer:: N, nspec, isp(4),nsr(4),numat, step, spi
 integer:: nconfig,iat, mol,iatyp 
 real:: boxx,boxy,boxz
 integer:: maxbin, bin1, bin2, bin3, i, j, bin 
 real:: delr, histz1(5000), histz2(5000), histz3(5000), incr
 real:: rx(900,1500),ry(900,1500),rz(900,1500), histz4(5000)
 real:: histz5(5000)
 character (len=80):: stringA
 character (len=2):: atomtype 
 character*8 cn, nq
 character (len=20)::timetext,tstep,titleatom,titlebox,titlecrds
!
1016    format(i4,i4,i3,4f3.20)
       maxbin=1
       delr=1
       start=1
       fname = 'positions.dat'
       natms = 13156 
       nconfig = 1 
!write(*,*) 'Insert the number of bins - maxbin'
!read (*,*)maxbin
! write(*,*) 'Insert the delta for the calculation - delr'
! read (*,*)delr
! write(*,*) 'Configuration to start from'
! read (*,*) start
!

!      write(6,'(a)')'Enter name of file to convert'
!      read(5,*)fname
!      write(6,'(a)')'Enter number of atoms in MD cell'
!      read(5,*)natms
!      write(6,'(a)')'Number of configurations'
!      read(5,*) nconfig
      if(natms.gt.mxatms)then
        write(6,*)'Error - too many atoms in cell. Max=',mxatms
        stop
      endif
      open(7,file=fname)

      norma1=0
      norma2=0
      norma3=0
      norma = 0
      do j=1,nconfig
        do i=1,natms 
          read(7,*)iat,mol,iatyp,qq(i),xxx(i),yyy(i),zzz(i)
          if (mol.eq.621) then
            zzz(i)=zzz(i)+1.
          endif
          if (mol.eq.622) then
            zzz(i)=zzz(i)-1.
          endif
          if(mol.eq.623)then
           if (zzz(i).gt.0)then
            zzz(i)=zzz(i)-1
           else
            zzz(i)=zzz(i)+1
           endif
          endif
          !if (mol.eq.953.and.zzz(i).lt.0) zzz(i)=zzz(i)+2.
          !if (mol.eq.953.and.zzz(i).gt.0) zzz(i)=zzz(i)-2.
          write(21,*)iat,mol,iatyp,qq(i),xxx(i),yyy(i),zzz(i)
        enddo
      enddo
 close(20)
end program
