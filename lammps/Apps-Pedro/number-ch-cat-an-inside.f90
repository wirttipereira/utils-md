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
 real:: delr, histz1(5000), histz2(5000), histz3(5000), incr
 real:: rx(900,1500),ry(900,1500),rz(900,1500), histz4(5000)
 real:: histz5(5000)
 character (len=80):: stringA
 character (len=2):: atomtype 
 character*8 cn, nq
 character (len=20)::timetext,tstep,titleatom,titlebox,titlecrds
 integer :: nmcatpos, nmcatneg, nmanipos, nmanineg
open(5,file='input.dat',status='old') 
! write(*,*) 'Insert the number of bins - maxbin'
 read (5,*)maxbin
! write(*,*) 'Insert the delta for the calculation - delr'
 read (5,*)delr
! write(*,*) 'Configuration to start from'
 read (5,*) start
!

 !     write(6,'(a)')'Enter name of file to convert'
      read(5,*)fname
  !    write(6,'(a)')'Enter number of atoms in MD cell'
      read(5,*)natms
   !   write(6,'(a)')'Number of configurations'
      read(5,*) nconfig
      if(natms.gt.mxatms)then
        write(6,*)'Error - too many atoms in cell. Max=',mxatms
        stop
      endif
      open(7,file=fname)

      norma1=0
      norma2=0
      norma3=0
      norma = 0
        open (25,file='charge-on-electrodes.dat', status='unknown')
1000  format(i5,2f8.3,4i5)

      do j=1,nconfig
        chneg=0.
        chpos=0.
        nmcatpos=0
        nmcatneg=0
        nmanipos=0
        nmanineg=0

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
        kk=0
        do i=1,natms 
          read(7,*)atomtype,xxx(i),yyy(i),zzz(i),qq(i)
          kk = kk + 1
          zzz(i)=zzz(i)+ 80.000
          if (j.gt.start) then
            if (atomtype.eq.'T') then
              if (zzz(i).le.20) then
                chneg=chneg+qq(i)
              else
                chpos=chpos+qq(i)
              endif
            endif
       
          endif
        enddo

        write(25,1000) j,chneg,chpos
         
      enddo
 close(20)
 close(25)
end program
