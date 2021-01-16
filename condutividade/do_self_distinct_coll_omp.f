c Programa original: Leonardo Siqueira
c Ultima modificacao 15.1.21 - Rafael Guimaraes
c 
c-------------------------------------
c #     ion-ion     arquivo
c-------------------------------------
c 1     1-1     self_cont.out
c 2     2-2     self_cont.out
c 3     3-3     self_cont.out
c 4     1-1     distinct_1.out
c 5     1-2     distinct_1.out
c 6     1-3     distinct_1.out
c 7     2-2     distinct_2.out
c 8     2-3     distinct_2.out
c 9     3-3     distinct_2.out
c-------------------------------------
c
c COMPILAR: gfortran -fopenmp -O3 do_self_distinct_coll.f -o do_self_distinct_coll_omp.mac
c 


       PROGRAM DO_SELF_DISTINCT_COLL !DO_DIFF_BMIM

!$use omp lib


*      ********************
******
       COMMON / config    / rx,ry,rz, vx,vy,vz,
     1                      rxo,ryo,rzo, rxn,ryn,rzn
       COMMON / syst      / N, nspec, isp, nsr, box
       COMMON / estrutura / nbond, bonda, bondb
       COMMON / cm        / rcmx, rcmy, rcmz
       COMMON / massa     / mass, massj
       COMMON / control   / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt 
       COMMON / acfgr     / acf, nacf, norm
*
       COMMON / for_acf   / nr,nt,nto,ior,it,nor,ntot,nst
       COMMON / acf_calc  / dax,day,daz
******
       REAL         rx(400,25), ry(400,25), rz(400,25),
     1              vx(400,25), vy(400,25), vz(400,25),
     2              rxo(600), ryo(600), rzo(600),
     3              rxn(600), ryn(600), rzn(600)
*
       INTEGER      N, nspec, isp(4), nsr(4), spi
       REAL         carga1, carga2
       REAL         box 
*
       INTEGER      nbond(4), bonda(4,20),bondb(4,20)
*
       REAL         rcmx(600),rcmy(600),rcmz(600)
*
       REAL         mass(4), massj(4,20)
*
       INTEGER      nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
       REAL         dt
*
       INTEGER      nacf
       REAL         acf(20,50000), norm(20,50000)
*
       INTEGER      nr, nt, nto, ior, it, nor, ntot, nst(50000)
*
       REAL         dax(600,50000),day(600,50000),daz(600,50000)
**
       INTEGER      step, natom(400,25), i, a,b, j, m 
       CHARACTER    typ(4),label(400)
       REAL         boxx,boxy,boxz
       CHARACTER    text
******
1000  format(i5,2a5,i5,3f8.3)
1001  format(3f10.5)
1002  format(a44)
1003  format(i5)
       CALL READING
       CALL SETUP 
*
       OPEN (55, FILE='COM.lammpstrj',
     1            STATUS='OLD')
*
       DO 10 step=1,nstep
        read(55,1002)text
        read(55,*)b
        read(55,1002)text
        read(55,1003)m !numero de moleculas
        read(55,1002)text
        read(55,*)xx,box
        read(55,*)boxy,yy
        read(55,*)boxz,zz
        read(55,1002)text
         N=m     !ele pega o N (numero de moleculas) do proprio arquivo 
         do 11 i=1,N
         READ (55,*)a,k,rcmx(i),rcmy(i),rcmz(i)
         rcmx(i)=rcmx(i)
         rcmy(i)=rcmy(i)
         rcmz(i)=rcmz(i)
 11      continue
*
c         CALL RECONSTROI
c         CALL CMASS
*
         IF (step.eq.1) then
           DO 20 i=1,N
             rxo(i) = rcmx(i)
             ryo(i) = rcmy(i)
             rzo(i) = rcmz(i)
             rxn(i) = rcmx(i)
             ryn(i) = rcmy(i)
             rzn(i) = rcmz(i)
c             spi=1
c             IF (i.gt.isp(1)) spi=2
c             DO 21 j=1,nsr(spi)
c             Write(14,*)' C ',rx(i,j),ry(i,j),rz(i,j)
c  21         CONTINUE
  20       CONTINUE
         ENDIF
*
         IF (step.gt.1) CALL CHECK
*
         IF ( MOD(step,iacf) .EQ. 0) THEN   
           write (*,*) step
           CALL CALCACF 
         ENDIF
*
         IF ( MOD(step,isave) .EQ. 0) THEN    
           CALL RESULTS (step)
         ENDIF
*
   10  CONTINUE
*
       CLOSE (55)
       CLOSE (56)
       CLOSE (57)
*
       END
*********************************************************************
       SUBROUTINE READING 
******
       COMMON / config    / rx,ry,rz, vx,vy,vz,
     1                      rxo,ryo,rzo, rxn,ryn,rzn
       COMMON / syst      / N, nspec, isp, nsr, box
       COMMON / estrutura / nbond, bonda, bondb
       COMMON / massa     / mass, massj
       COMMON / control   / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt 
       COMMON / acfgr     / acf, nacf, norm
******
       REAL        rx(400,25), ry(400,25), rz(400,25),
     1             vx(400,25), vy(400,25), vz(400,25),
     2             rxo(600), ryo(600), rzo(600),
     3             rxn(600), ryn(600), rzn(600)
*
       INTEGER     N, nspec, isp(4), nsr(4)
       REAL        box 
*
       INTEGER     nbond(4), bonda(4,20),bondb(4,20),nspecbond
*
       REAL        mass(4), massj(4,20)
*
       INTEGER     nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
       REAL        dt
*
       INTEGER     nacf
       REAL        acf(20,50000), norm(20,50000)
**
       INTEGER     i, j, a, b
******
       OPEN (40, FILE='control.inpt', STATUS='OLD')
          READ (40,*) nstep
          READ (40,*) dt
          READ (40,*) isave
          READ (40,*) iacf
          READ (40,*) nacf
          READ (40,*) carga1
          READ (40,*) carga2
       CLOSE (40)
*
       RETURN
       END
*********************************************************************
       SUBROUTINE SETUP 
******
       COMMON / syst      / N, nspec, isp, nsr, box
       COMMON / control   / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt 
       COMMON / acfgr     / acf, nacf, norm
       COMMON / for_acf   / nr,nt,nto,ior,it,nor,ntot,nst
******
       INTEGER     N, nspec, isp(4), nsr(4)
       REAL        box 
*
       INTEGER     nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
       REAL        dt
*
       INTEGER nacf
       REAL    acf(20,50000), norm(20,50000)
*
       INTEGER nr, nt, nto, ior, it, nor, ntot, nst(50000)
**
       INTEGER i, j, a, b, bin
*****
       IF (isave .EQ. 0)   isave   = nstep + 1
       IF (iaver .EQ. 0)   iaver  = nstep + 1
       IF (iacf .EQ. 0)    iacf    = nstep + 1  
*
       nr = nstep
       nt = 0
       nto = 0
       ior = 0
       it = 1
       nor = 0
       ntot = nt + nr
*
       DO 80 i=1,15
         DO 90 j=1,nacf
           acf(i,j) = 0.000
           norm(i,j) = 0.000
   90    CONTINUE
   80  CONTINUE
*
       RETURN
       END
*********************************************************************
       SUBROUTINE RECONSTROI
******
        IMPLICIT NONE

       COMMON / config    / rx,ry,rz, vx,vy,vz,
     1                      rxo,ryo,rzo, rxn,ryn,rzn
       COMMON / syst      / N, nspec, isp, nsr, box
       COMMON / estrutura / nbond, bonda, bondb
*
c    Variaveis CONFIG
       REAL        rx(400,25), ry(400,25), rz(400,25),
     1             vx(400,25), vy(400,25), vz(400,25),
     2             rxn(600), ryn(600), rzn(600),
     3             rxo(600), ryo(600), rzo(600)
c    Variaveis SYST
       INTEGER     N, nspec, isp(4), nsr(4)
       REAL        box
c    Variaveis ESTRUTURA
       INTEGER     nbond(4), bonda(4,20), bondb(4,20)
****
       INTEGER     i, j, k, spi
       REAL        dx, dy, dz
**
*
       DO 10 k = 1, N
         spi = 1
         IF (k.gt.isp(1)) spi = 2
         IF(k.gt.isp(1)+isp(2)) spi=3
         IF (nsr(spi).ne.1) then
c           DO 20 k = 1, isp(spi)
           DO 30 j = 1, nbond(spi)
             dx = rx(k,bonda(spi,j)) - rx(k,bondb(spi,j))
             dy = ry(k,bonda(spi,j)) - ry(k,bondb(spi,j))
             dz = rz(k,bonda(spi,j)) - rz(k,bondb(spi,j))
             IF (ABS(dx).gt.3.) then
               IF (rx(k,bonda(spi,j)) .lt. 0.) THEN
                 rx(k,bondb(spi,j)) = rx(k,bondb(spi,j)) - box
               ELSE
                 rx(k,bondb(spi,j)) = rx(k,bondb(spi,j)) + box
               ENDIF
             ENDIF
             IF (ABS(dy).gt.3.) then
               IF (ry(k,bonda(spi,j)) .lt. 0.) THEN
                 ry(k,bondb(spi,j)) = ry(k,bondb(spi,j)) - box
               ELSE
                 ry(k,bondb(spi,j)) = ry(k,bondb(spi,j)) + box
               ENDIF
             ENDIF
             IF (ABS(dz).gt.3.) then
               IF (rz(k,bonda(spi,j)) .lt. 0.) THEN
                 rz(k,bondb(spi,j)) = rz(k,bondb(spi,j)) - box
               ELSE
                 rz(k,bondb(spi,j)) = rz(k,bondb(spi,j)) + box
               ENDIF
             ENDIF
   30      CONTINUE
c   20    CONTINUE
         ENDIF
   10  CONTINUE
*
       RETURN
       END

********************************************************************
       SUBROUTINE CMASS
******
          IMPLICIT NONE

        COMMON / config    / rx,ry,rz, vx,vy,vz,
     1                       rxo,ryo,rzo, rxn,ryn,rzn
        COMMON / syst      / N, nspec, isp, nsr, box 
        COMMON / cm        / rcmx, rcmy, rcmz
        COMMON / massa     / mass, massj
*
c    Variaveis CONFIG
        REAL        rx(400,25), ry(400,25), rz(400,25),
     1              vx(400,25), vy(400,25), vz(400,25),
     2              rxo(600), ryo(600), rzo(600),
     3              rxn(600), ryn(600), rzn(600)
c    Variaveis SYST
        INTEGER     N, nspec, isp(4), nsr(4)
        REAL        box
*    Variaveis CM
        REAL        rcmx(600), rcmy(600), rcmz(600)
*    Variaveis massa
        REAL        mass(4), massj(4,20)
c    Variaveis LOCAIS
        INTEGER i, j, spi
*
       DO 10 i = 1,isp(1)+isp(2)+isp(3)
         spi = 1
         IF (i.gt.isp(1)) spi = 2
         IF (i.gt.isp(1)+isp(2)) spi=3
         rcmx(i) = 0.000
         rcmy(i) = 0.000
         rcmz(i) = 0.000
*
         DO 20 j = 1, nsr(spi)
*
           rcmx(i) = rcmx(i) + massj(spi,j)*rx(i,j)
           rcmy(i) = rcmy(i) + massj(spi,j)*ry(i,j)
           rcmz(i) = rcmz(i) + massj(spi,j)*rz(i,j)
   20     CONTINUE
*
          rcmx(i) = rcmx(i)/mass(spi)
          rcmy(i) = rcmy(i)/mass(spi)
          rcmz(i) = rcmz(i)/mass(spi)
c            write(14,*)' Li  ',rcmx(i),rcmy(i),rcmz(i)
  10    CONTINUE
c        stop
        RETURN
        END


*********************************************************************
       SUBROUTINE CHECK
******
       COMMON / config    / rx,ry,rz, vx,vy,vz,
     1                      rxo,ryo,rzo, rxn,ryn,rzn
       COMMON / syst      / N, nspec, isp, nsr, box
       COMMON / cm        / rcmx, rcmy, rcmz
        
******
       REAL        rx(400,25), ry(400,25), rz(400,25),
     1             vx(400,25), vy(400,25), vz(400,25),
     2             rxo(600), ryo(600), rzo(600),
     3             rxn(600), ryn(600), rzn(600)
*
       INTEGER     N, nspec, isp(4), nsr(4)
       REAL        box
*
       REAL        rcmx(600),rcmy(600),rcmz(600)
*
       INTEGER     i, a, spi
       REAL        dx,dy,dz
******
       DO 5 i=1,N
c+isp(2)+isp(3)
c         spi=1
c         if(i.gt.isp(1)) spi=2
c         if(i.gt.isp(1)+isp(2)) spi=3
           rxn(i) = rcmx(i)
           ryn(i) = rcmy(i)
           rzn(i) = rcmz(i)
  5    CONTINUE
*
       DO 10 i=1,N
c+isp(2)+isp(3)
c         spi=1
c         if(i.gt.isp(1)) spi=2
c         if(i.gt.isp(1)+isp(2)) spi=3
c         DO 12 a=1,nsr(1)
*
           dx = rcmx(i) - rxo(i)
           IF (ABS(dx).gt.(box/2)) THEN
             IF (dx.lt.0) THEN
               rxn(i) = rcmx(i) + box
             ELSE
               rxn(i) = rcmx(i) - box
             ENDIF
           ENDIF
*
           dy = rcmy(i) - ryo(i)
           IF (ABS(dy).gt.(box/2)) THEN
             IF (dy.lt.0) THEN
               ryn(i) = rcmy(i) + box
             ELSE
               ryn(i) = rcmy(i) - box
             ENDIF
           ENDIF
*
           dz = rcmz(i) - rzo(i)
           IF (ABS(dz).gt.(box/2)) THEN
             IF (dz.lt.0) THEN
               rzn(i) = rcmz(i) + box
             ELSE
               rzn(i) = rcmz(i) - box
             ENDIF
           ENDIF
*
  12    CONTINUE
  10   CONTINUE
*
       DO 20 i=1,N
c+isp(2)+isp(3)
c         spi=1
c         if(i.gt.isp(1)) spi=2
c         if(i.gt.isp(1)+isp(2)) spi=3
           rxo(i) = rxn(i)
           ryo(i) = ryn(i)
           rzo(i) = rzn(i)
  25     CONTINUE
  20   CONTINUE
*
       RETURN
       END
*********************************************************************
       SUBROUTINE CALCACF 
******
        COMMON / config    / rx,ry,rz, vx,vy,vz,
     1                       rxo,ryo,rzo, rxn,ryn,rzn
        COMMON / syst      / N, nspec, isp, nsr, box
        COMMON / acfgr     / acf, nacf, norm
        COMMON / for_acf   / nr,nt,nto,ior,it,nor,ntot,nst
        COMMON / acf_calc  / dax,day,daz
******
       REAL  rx(400,25), ry(400,25), rz(400,25),
     1       vx(400,25), vy(400,25), vz(400,25),
     2       rxo(600), ryo(600), rzo(600),
     3       rxn(600), ryn(600), rzn(600)
*
       INTEGER     N, nspec, isp(4), nsr(4)
       REAL        box
*
       INTEGER nacf
       REAL    acf(20,50000), norm(20,50000)
*
       INTEGER nr, nt, nto, ior, it, nor, ntot, nst(50000)
*
       REAL dax(600,50000),day(600,50000),daz(600,50000)
**
       INTEGER is, jor, i, j, k,spi,spj
       REAL xtxo,ytyo,ztzo,rtro,xtxa,ytya,ztza,ch(400)
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
c
c CHECAR AS CARGAS ABAIXO (padrão 0.8 scaled MAS cuidar o sinal para 
c colocar o anion/cation na mesma ordem do dump.
c
       DO 10 i=1,N
         dax(i,ior) = rxn(i)
         day(i,ior) = ryn(i)
         daz(i,ior) = rzn(i)
         IF(i.le.(N/2))then
           ch(i)=carga1 !-0.8
         else
           ch(i)=carga2 !0.8
         endif
         
   10  CONTINUE
*
c       DO 11 j=isp(1)+1,isp(1)+isp(2)
c         dbx(j,ior) = rxn(j)
c         dby(j,ior) = ryn(j)
c         dbz(j,ior) = rzn(j)
c   11  CONTINUE
*
c       DO 12 k=isp(1)+isp(2)+1, N
c         dcx(k,ior) = rxn(k)
c         dcy(k,ior) = ryn(k)
c         dcz(k,ior) = rzn(k)
c   12  CONTINUE       
*
       nst(ior) = it
       IF (it.GT.nr-nacf+1) THEN
         nst(ior) = -3000
       ENDIF
       IF (it.LE.nr-nacf+1) THEN
         nto = nto + 1
       ENDIF
*
c      RAFAEL
!$omp parallel do
       DO 20 is=1,nor
         jor = it+1-nst(is)
         IF (jor.LE.nacf) THEN
*
          DO 30 i=1,N !isp(1)+isp(2)+isp(3)i
            spi=1
            if(i.gt.200.and.i.le.400) spi=2
c            if(i.gt.350) spi=3
            DO 31 j=1,N !isp(1)+isp(2)+isp(3)
              spj=1
              if(j.gt.200.and.j.le.400) spj=2

* ion1 - ion1
              if (spi.eq.1.and.spj.eq.1) then
              if (i.eq.j) then
*             self-contribution
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(1,jor) = acf(1,jor) + coll
              else
*             distinct contribution
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(4,jor) = acf(4,jor) + coll
              endif
              endif
* ion1 - ion2
              if ((spi.eq.1.and.spj.eq.2).or.
     1               (spi.eq.2.and.spj.eq.1)) then
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(5,jor) = acf(5,jor) + coll
              endif
* ion1 - ion3
              if ((spi.eq.1.and.spj.eq.3).or.
     1                (spi.eq.3.and.spj.eq.1)) then
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(6,jor) = acf(6,jor) + coll
              endif
* ion2 - ion2
              if (spi.eq.2.and.spj.eq.2) then
              if (i.eq.j) then
* self contribution
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(2,jor) = acf(2,jor) + coll
              else
* distinct contribution
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(7,jor) = acf(7,jor) + coll
              endif
              endif
* ion2 - ion3 
              if ((spi.eq.2.and.spj.eq.3).or.
     1             (spi.eq.3.and.spj.eq.2)) then
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(8,jor) = acf(8,jor) + coll
              endif
* ion3 - ion3
              if (spi.eq.3.and.spj.eq.3) then
              if (i.eq.j) then
* self contribution
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(3,jor) = acf(3,jor) + coll
              else
* distinct contribution
              xtxo = rxn(i) - dax(i,is)
              ytyo = ryn(i) - day(i,is)
              ztzo = rzn(i) - daz(i,is)
*
              xtxa = rxn(j) - dax(j,is)
              ytya = ryn(j) - day(j,is)
              ztza = rzn(j) - daz(j,is)
*
              coll = xtxo*xtxa+ytyo*ytya+ztzo*ztza
              coll = coll *ch(i)*ch(j)
              acf(9,jor) = acf(9,jor) + coll
              endif
              endif

c              write(13,*)i,j,ch(i),ch(j)
   31       CONTINUE              
c            rtro = xtxo*xtxo + ytyo*ytyo + ztzo*ztzo
c            acf(1,jor) = acf(1,jor) + rtro
c            norm(1,jor) = norm(1,jor) + 1
   30     CONTINUE
             norm(1,jor) = norm(1,jor) + 1
*
c          DO 31 j=isp(1)+1,isp(1)+isp(2)
c            xtxo = rxn(j) - dbx(j,is)
c            ytyo = ryn(j) - dby(j,is)
c            ztzo = rzn(j) - dbz(j,is)
c            rtro = xtxo*xtxo + ytyo*ytyo + ztzo*ztzo
c            acf(2,jor) = acf(2,jor) + rtro
c            norm(2,jor) = norm(2,jor) + 1
c   31    CONTINUE
*
c          DO 32 k=isp(1)+isp(2)+1,N
c            xtxo = rxn(k) - dcx(k,is)
c            ytyo = ryn(k) - dcy(k,is)
c            ztzo = rzn(k) - dcz(k,is)
c            rtro = xtxo*xtxo + ytyo*ytyo + ztzo*ztzo
c            acf(3,jor) = acf(3,jor) + rtro
c            norm(3,jor) = norm(3,jor) + 1
c   32     CONTINUE


         ENDIF
   !$omp end parallel do

   20  CONTINUE
c  Rafael

       it = it + 1
       nt = nt + 1
*
       RETURN
       END
*********************************************************************
       SUBROUTINE RESULTS (step) 
******
        COMMON / syst      / N, nspec, isp, nsr, box
        COMMON / control   / nstep,dt,isave,iaver,iacf,ieqlbrt,eqlbrt 
        COMMON / acfgr     / acf, nacf, norm
******
        INTEGER     N, nspec, isp(4), nsr(4)
        REAL        box 
*
        INTEGER     nstep, isave, iaver, iacf, ieqlbrt, eqlbrt
        REAL        dt
*
       INTEGER nacf
       REAL    acf(20,50000), norm(20,50000)
*
       INTEGER step, i, j
       REAL  incr
******
       OPEN (10, FILE='self_cont.out', STATUS='UNKNOWN')
       OPEN (20, File='distinct_1.out', STATUS='UNKNOWN')
       OPEN (30, File='distinct_2.out', STATUS='UNKNOWN')
c       OPEN (40, FILE='diff4.out', STATUS='UNKNOWN')
         i=0
         incr = iacf * dt * 1.0e12
         DO 60 j=1,nacf
           WRITE (10,*) i*incr, acf(1,j)/norm(1,j),
     1                          acf(2,j)/norm(1,j),
     2                          acf(3,j)/norm(1,j)
           WRITE (20,*) i*incr, acf(4,j)/norm(1,j),
     1                          acf(5,j)/norm(1,j),
     2                          acf(6,j)/norm(1,j)
           WRITE (30,*) i*incr, acf(7,j)/norm(1,j),
     1                          acf(8,j)/norm(1,j),
     2                          acf(9,j)/norm(1,j)
c           WRITE (40,*) i*incr, acf(11,j)/norm(11,j),
c     1                          acf(14,j)/norm(14,j)
           i=i+1
   60    CONTINUE
       CLOSE (10)
       CLOSE (20)
       CLOSE (30)
c       CLOSE (40)
*
       RETURN
       END
