program z_density
 implicit real*8(a-h,o-z)

 parameter (mxatms=20000)
 character*40 fname
 character*80 title
 character*3 atmnam(mxatms)
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
! 
 write(*,*) 'Insert the number of bins - maxbin'
 read (*,*)maxbin
 write(*,*) 'Insert the delta for the calculation - delr'
 read (*,*)delr
 write(*,*) 'Configuration to start from'
 read (*,*) start
!

      write(6,'(a)')'Enter name of file to convert'
      read(5,*)fname
      write(6,'(a)')'Enter number of atoms in MD cell'
      read(5,*)natms
      write(6,'(a)')'Number of configurations'
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
          zzz(i)=zzz(i)+ 74.106
          if (j.ge.start) then
            if (zzz(i).le.31) then
              if (kk.le.7600) then
               if (atmnam(i).eq.'Sc') then
                bin=int(yyy(i)/delr)
                if(bin.le.maxbin) then
                  histz1(bin) = histz1(bin)+1
                endif
               endif
               if (atmnam(i).eq.'C3C') then
                bin=int(yyy(i)/delr)
                if(bin.le.maxbin) then
                  histz2(bin) = histz2(bin)+1
                endif
               endif
              endif
               if (kk.gt.7600.and.kk.le.13600) then 
                if (atmnam(i).eq.'N') then
                 bin=int(yyy(i)/delr)
                 if(bin.le.maxbin) then
                  histz3(bin) = histz3(bin)+1
                 endif
                endif
                if (atmnam(i).eq.'F') then
                 bin=int(yyy(i)/delr)
                 if(bin.le.maxbin) then
                  histz4(bin) = histz4(bin)+1
                 endif
                endif
               endif
            endif
          endif
        enddo
       
        if (j.ge.start) norma= norma + 1

        open (25,file='Sc-C3C-N-F-density-y-neg.dat', status='unknown')
        incr=0
        vnorm=boxxh*boxyh*delr*norma
        write(*,*)boxxh,boxyh,delr,norma,vnorm
        do bin=1,maxbin
          write(25,*) incr,histz1(bin)/vnorm,histz2(bin)/vnorm,histz3(bin)/vnorm,histz4(bin)/vnorm
          incr = incr + delr
        enddo
        close(25)
      enddo
 close(20)
end program
