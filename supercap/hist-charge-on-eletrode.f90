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
 integer:: nconfig
 real:: boxx,boxy,boxz
 integer:: maxbin, bin1, bin2, bin3, i, j, bin 
 integer :: histz1(-5000:5000), histz2(-5000:5000)
 real:: delr, incr
 real:: rx(900,1500),ry(900,1500),rz(900,1500), histz4(5000)
 real:: histz5(5000)
 character (len=80):: stringA
 character (len=2):: atomtype 
 character*8 cn, nq
 character (len=20)::timetext,tstep,titleatom,titlebox,titlecrds
 open (5,file='input-hist.dat',status='old')
! 
! write(*,*) 'Insert the number of bins - maxbin'
 read (5,*)maxbin
! write(*,*) 'Insert the delta for the calculation - delr'
 read (5,*)delr
! write(*,*) 'Configuration to start from'
 read (5,*) start
!

!      write(6,'(a)')'Enter name of file to convert'
      read(5,*)fname
!      write(6,'(a)')'Enter number of atoms in MD cell'
      read(5,*)natms
!      write(6,'(a)')'Number of configurations'
      read(5,*) nconfig
 close (5)
      if(natms.gt.mxatms)then
        write(6,*)'Error - too many atoms in cell. Max=',mxatms
        stop
      endif
      open(7,file=fname)

      do i=-3000,3000
        histz1(i)=0.0
        histz2(i)=0.0
!        histz3(i)=0.0
!        histz4(i)=0.0
!        histz5(i)=0.0
      enddo

      norma1=0
      norma2=0
      norma3=0
      norma = 0
      do j=1,nconfig
        write(*,*) j
        read(7,'(a20)')timetext
        read(7,*)tstep
        read(7,'(a20)')titleatom
        read(7,*)natms
        read(7,'(a20)')titlebox
        read(7,*)boxxl,boxxh
        read(7,*)boxyl,boxyh
        read(7,*)boxzl,boxzh
        read(7,'(a20)')titlecrds
        
        do i=1,natms 
          read(7,*)kk,atmnam(i),xxx(i),yyy(i),zzz(i),qq(i)
!          zzz(i)=zzz(i)+ 50.
          if (j.ge.start) then
            if (kk.gt.13600.and.kk.le.16096) then
            if (zzz(i).le.0.) then
              bin=int(qq(i)/delr)
              if(bin.le.maxbin) then
                histz1(bin) = histz1(bin)+1
              endif
            endif
            if (zzz(i).gt.0) then
              bin=int(qq(i)/delr)
              if(bin.le.maxbin) then
                histz2(bin) = histz2(bin)+1
              endif
            endif
            endif
          endif
        enddo
       
        if (j.ge.start) norma= norma + 1

        open (25,file='histogrom-charge-ele.dat', status='unknown')
        incr=-maxbin*delr
        vnorm=norma
        write(*,*)boxxh,boxyh,delr,norma,vnorm
        do bin=-maxbin,maxbin
          write(25,99) incr,histz1(bin)/vnorm, histz2(bin)/vnorm
          incr = incr + delr
        enddo
        close(25)
      enddo
99 format (5f9.4)
 close(20)
end program
