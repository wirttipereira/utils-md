       PROGRAM ACF_STRESS

!Rafael
! gfortran -fopenmp -O3 do-acf-streess-omp.f -o acf-omp
!$ use omp lib




*      ********************
******
       COMMON / config / vx,vy,vz,strxy,strxz,stryz
       COMMON / syst / N, nspec, isp, mass, temper, box, rcut, nsr
       COMMON / control / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt
       COMMON / acfgr / hist,maxbin,delr,dens, acf,nacf,nc, norm
*
       COMMON / for_acf / nr,nt,nto,ior,it,nor,ntot,nst
       COMMON / acf_calc / dax,day,daz, dbx,dby,dbz
******
       REAL      vx(600),vy(600),vz(600),
     1           strxy,strxz,stryz
     1          rsrx(230,90),rsry(230,90),rsrz(230,90)
*
       INTEGER N, nspec, isp(3), nsr(3), natom(230,90)
       REAL    mass(3), temper, box, rcut
*
       INTEGER nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
       REAL    dt
*
       INTEGER maxbin, nacf, nc
       REAL    hist, delr, dens, acf(1,300000), norm(1,300000)
*
       INTEGER nr, nt, nto, ior, it, nor, ntot, nst(300000)
*
       REAL dax(1,300000),day(1,300000),daz(1,300000),
     1       dbx(1,300000),dby(1,300000),dbz(1,300000)
**
       INTEGER step,i,j,spi
       real    k
******
*
*
       CALL READING
       CALL SETUP 
*
       OPEN (90, FILE='pressure.dat', 
     1            STATUS='OLD')
*
       DO 10 step=1,nstep
         READ(90,*)k,strxy,strxz,stryz
*
         if(mod(step,100).eq.0) then
           !Rafael
           !write (*,*) step
         endif
*
         IF ( MOD(step,iacf) .EQ. 0) THEN   
           CALL CALCACF 
         ENDIF
*
         IF ( MOD(step,isave) .EQ. 0) THEN    
           CALL RESULTS (step)
         ENDIF
*
   10  CONTINUE
*
       CLOSE (90)
*
       END
*********************************************************************
       SUBROUTINE READING 
******
       COMMON / config / vx,vy,vz,strxy,strxz,stryz
       COMMON / syst / N, nspec, isp, mass, temper, box, rcut, nsr
       COMMON / control / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt
       COMMON / acfgr / hist,maxbin,delr,dens, acf,nacf,nc, norm
******
       REAL    vx(600),vy(600),vz(600),
     1         strxy,strxz,stryz
*
       INTEGER N, nspec, isp(3),nsr(3),nchrg(3)
       REAL    mass(3), temper, box, rcut
*
       INTEGER nstep, isave, iaver, iacf, ieqlbrt, eqlbrt,dofq
       REAL    dt
*
       INTEGER maxbin, nacf, nc
       REAL    hist, delr, dens, acf(1,300000), norm(1,300000)
**
       INTEGER i, j, a, b
******
       OPEN (10, FILE='system.inpt', STATUS='OLD')
          READ (10,*) N
          READ (10,*) nspec
          DO 10 i=1,nspec
            READ (10,*) isp(i)
            READ (10,*) nsr(i)
   10     CONTINUE
          READ (10,*) box
       CLOSE (10)
*
       OPEN (40, FILE='control.inpt', STATUS='OLD')
          READ (40,*) nstep
          READ (40,*) dt
          READ (40,*) isave
          READ (40,*) iaver
          READ (40,*) iacf
*
          READ (40,*) nacf
          READ (40,*) nc
       CLOSE (40)
*
       RETURN
       END
*********************************************************************
       SUBROUTINE SETUP 
******
       COMMON / syst / N, nspec, isp, mass, temper, box, rcut, nsr
       COMMON / control / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt
       COMMON / acfgr / hist,maxbin,delr,dens, acf,nacf,nc, norm
       COMMON / for_acf / nr,nt,nto,ior,it,nor,ntot,nst
******
       INTEGER N, nspec, isp(3),nsr(3)
       REAL    mass(3), temper, box, rcut
*
       INTEGER nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
       REAL    dt
*
       INTEGER maxbin, nacf, nc
       REAL    hist, delr, dens, acf(1,300000), norm(1,300000)
*
       INTEGER nr, nt, nto, ior, it, nor, ntot, nst(300000)
**
       INTEGER i, j, a, b, bin
*****
       IF (isave .EQ. 0)   isave   = nstep + 1
       IF (iaver .EQ. 0)   iaver  = nstep + 1
       IF (iacf .EQ. 0)    iacf    = nstep + 1  
       IF (ieqlbrt .EQ. 0) ieqlbrt = nstep + 1    
*
       nr = nstep
       nt = 0
       nto = 0
       ior = 0
       it = 1
       nor = 0
       ntot = nt + nr
*
       DO 70 a=1,1
         DO 80 i=1,nacf
           norm(a,i) = 0.000
             acf(a,i) = 0.000
   80    CONTINUE
   70  CONTINUE
*
       RETURN
       END
*********************************************************************
       SUBROUTINE CALCACF 
******
       COMMON / config / vx,vy,vz,strxy,strxz,stryz
       COMMON / syst / N, nspec, isp, mass, temper, box, rcut, nsr
       COMMON / acfgr / hist,maxbin,delr,dens, acf,nacf,nc, norm
       COMMON / for_acf / nr,nt,nto,ior,it,nor,ntot,nst
       COMMON / acf_calc / dax,day,daz, dbx,dby,dbz
******
       REAL    vx(600),vy(600),vz(600),
     1         strxy,strxz,stryz
*
       INTEGER N, nspec, isp(3),nsr(3)
       REAL    mass(3), temper, box, rcut
*
       INTEGER maxbin, nacf, nc
       REAL    hist, delr, dens, acf(1,300000), norm(1,300000)
*
       INTEGER nr, nt, nto, ior, it, nor, ntot, nst(300000)
*
       REAL dax(1,300000),day(1,300000),daz(1,300000),
     1       dbx(1,300000),dby(1,300000),dbz(1,300000)
**
       INTEGER is, jor, i, j, bin,spi
       REAL rsx2,rsy2,rsz2, rsx3,rsy3,rsz3, rsx4,rsy4,rsz4,
     1      rsimx,rsimy,rsimz, rssqrt, ang
******
       nor = nor+1
       IF (nor.GT.nacf) THEN
         nor = nacf
       ENDIF
       ior = ior+1
       IF (ior.GT.nacf) THEN
         ior = 1
       ENDIF
*
       i=1
       dax(i,ior) = strxy 
       day(i,ior) = strxz
       daz(i,ior) = stryz
*
       nst(ior) = it
       IF (it.GT.nr-nacf+1) THEN
         nst(ior) = -10000
       ENDIF
       IF (it.LE.nr-nacf+1) THEN
         nto = nto + 1
       ENDIF
*
!Rafael
!$omp parallel do 
       DO 30 is=1,nor
         jor = it+1-nst(is)
         IF (jor.LE.nacf) THEN
*          
               acf(1,jor) = acf(1,jor) + dax(1,is)*strxy +
     1                                  day(1,is)*strxz +
     1                                  daz(1,is)*stryz

!omp end parallel do
*       
c               ENDIF
   40      CONTINUE
*
         ENDIF
   30  CONTINUE
       it = it + 1
       nt = nt + 1
*
       RETURN
       END
*********************************************************************
       SUBROUTINE RESULTS (step) 
******
       COMMON / syst / N, nspec, isp, mass, temper, box, rcut, nsr
       COMMON / control / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt
       COMMON / acfgr / hist,maxbin,delr,dens, acf,nacf,nc, norm
       COMMON / for_acf / nr,nt,nto,ior,it,nor,ntot,nst
       COMMON / acf_calc / dax,day,daz, dbx,dby,dbz
******
       INTEGER N, nspec, isp(3),nsr(3)
       REAL    mass(3), temper, box, rcut
*
       INTEGER nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
       REAL    dt
*
       INTEGER maxbin, nacf, nc
       REAL    hist, delr, dens, acf(1,300000), norm(1,300000)
*
       INTEGER nr, nt, nto, ior, it, nor, ntot, nst(300000)
*
       REAL dax(1,300000),day(1,300000),daz(1,300000),
     1       dbx(1,300000),dby(1,300000),dbz(1,300000)
**
       INTEGER step, i, j
       REAL  rlower, rupper, nideal, incr,norma
******
       OPEN (10, FILE='acf_stress_all.out', STATUS='UNKNOWN')
          i = 0
          incr = iacf * dt * 1.0e12
          norma=real(nto)
          DO 60 j = 1, nacf
            WRITE (10,*) i*incr,acf(1,j)/(3*norma)
            i=i+1
  60      CONTINUE
*
       CLOSE (10)
*
       OPEN (50, FILE='count.out', STATUS='UNKNOWN')
        ! Rafael  
        ! WRITE (50,*) step
       CLOSE (50)
*
       RETURN
       END
