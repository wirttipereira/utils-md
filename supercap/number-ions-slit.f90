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
 real :: nmcatpos1, nmcatpos2, nmcatpos3, nmcatpos4, nmcatneg1, nmcatneg2, nmcatneg3, nmcatneg4, nmanipos1, nmanipos2, nmanipos3
 real :: nmanipos4, nmanineg1, nmanineg2, nmanineg3, nmanineg4
 real :: nmcatnegg, nmcatnegp, nmcatposg, nmcatposp, nmaninegg, nmaninegp, nmaniposg, nmaniposp
! 
! write(*,*) 'Insert the number of bins - maxbin'
! read (*,*)maxbin
! write(*,*) 'Insert the delta for the calculation - delr'
! read (*,*)delr
! write(*,*) 'Configuration to start from'
! read (*,*) start
!
open(37,file='input.dat',status='old')
read(37,*)maxbin
read(37,*)delr
read(37,*)start
read(37,*)fname
read(37,*)natms
read(37,*)nconfig

      !write(6,'(a)')'Enter name of file to convert'
      !read(5,*)fname
      !write(6,'(a)')'Enter number of atoms in MD cell'
      !read(5,*)natms
      !write(6,'(a)')'Number of configurations'
      !read(5,*) nconfig

      if(natms.gt.mxatms)then
        write(6,*)'Error - too many atoms in cell. Max=',mxatms
        stop
      endif
      open(7,file=fname)

      norma1=0
      norma2=0
      norma3=0
      norma = 0
        open (25,file='pore_15A.dat', status='unknown')
        open (35,file='pore_7.5A.dat', status='unknown')
1000  format(i5,X,4f10.4)

      do j=1,nconfig
        chneg=0.
        chpos=0.
        nmcatpos1=0
        nmcatpos2=0
        nmcatpos3=0
        nmcatpos4=0
        nmanipos1=0
        nmanipos2=0
        nmanipos3=0
        nmanipos4=0
        nmcatneg1=0
        nmcatneg2=0
        nmcatneg3=0
        nmcatneg4=0
        nmanineg1=0
        nmanineg2=0
        nmanineg3=0
        nmanineg4=0

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
          zzz(i)=zzz(i)+74.106
          if (j.gt.start) then
           if (kk.le.7600) then
             if (zzz(i).le.31) then
               if (yyy(i).gt.0.and.yyy(i).le.15) then
                nmcatneg1=nmcatneg1+1
               endif
               if (yyy(i).gt.15.and.yyy(i).le.22.5) then
                nmcatneg2=nmcatneg2+1
               endif
               if (yyy(i).gt.22.5.and.yyy(i).le.37.5) then
                nmcatneg3=nmcatneg3+1
               endif
               if (yyy(i).gt.37.5.and.yyy(i).le.45) then
                nmcatneg4=nmcatneg4+1
               endif
             endif
             if (zzz(i).gt.116) then
               if (yyy(i).gt.0.and.yyy(i).le.15) then
                nmcatpos1=nmcatpos1+1
               endif
               if (yyy(i).gt.15.and.yyy(i).le.22.5) then
                nmcatpos2=nmcatpos2+1
               endif
               if (yyy(i).gt.22.5.and.yyy(i).le.37.5) then
                nmcatpos3=nmcatpos3+1
               endif
               if (yyy(i).gt.37.5.and.yyy(i).le.45) then
                nmcatpos4=nmcatpos4+1
               endif
             endif
           endif
           if (kk.gt.7600.and.kk.le.13600) then
             if (zzz(i).le.31) then
               if (yyy(i).gt.0.and.yyy(i).le.15) then
                nmanineg1=nmanineg1+1
               endif
               if (yyy(i).gt.15.and.yyy(i).le.22.5) then
                nmanineg2=nmanineg2+1
               endif
               if (yyy(i).gt.22.5.and.yyy(i).le.37.5) then
                nmanineg3=nmanineg3+1
               endif
               if (yyy(i).gt.37.5.and.yyy(i).le.45) then
                nmanineg4=nmanineg4+1
               endif
             endif
             if (zzz(i).gt.116) then
               if (yyy(i).gt.0.and.yyy(i).le.15) then
                nmanipos1=nmanipos1+1
               endif
               if (yyy(i).gt.15.and.yyy(i).le.22.5) then
                nmanipos2=nmanipos2+1
               endif
               if (yyy(i).gt.22.5.and.yyy(i).le.37.5) then
                nmanipos3=nmanipos3+1
               endif
               if (yyy(i).gt.37.5.and.yyy(i).le.45) then
                nmanipos4=nmanipos4+1
               endif
             endif
           endif
             nmcatnegg = (nmcatneg1+nmcatneg3)/(2*19)
             nmcatnegp = (nmcatneg2+nmcatneg4)/(2*19)
             nmcatposg = (nmcatpos1+nmcatpos3)/(2*19)
             nmcatposp = (nmcatpos2+nmcatpos4)/(2*19)
             nmaninegg = (nmanineg1+nmanineg3)/(2*15)
             nmaninegp = (nmanineg2+nmanineg4)/(2*15)
             nmaniposg = (nmanipos1+nmanipos3)/(2*15)
             nmaniposp = (nmanipos2+nmanipos4)/(2*15)
          endif
        enddo

        

        write(25,1000) j,nmcatnegg,nmaninegg,nmcatposg,nmaniposg
        write(35,1000) j,nmcatnegp,nmaninegp,nmcatposp,nmaniposp
         
      enddo
 close(20)
 close(25)
 close(35)
end program
