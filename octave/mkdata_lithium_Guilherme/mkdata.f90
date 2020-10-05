       PROGRAM mkdata
       INTEGER cat, atomscat, bondscat, anglescat, dihedralscat
       INTEGER atomstypcat, bondstypcat, anglestypcat, dihedralstypcat
       INTEGER an, atomsan, bondsan, anglesan, dihedralsan
       INTEGER atomstypan, bondstypan, anglestypan, dihedralstypan
       INTEGER li, atomsli, bondsli, anglesli, dihedralsli
       INTEGER atomstypli, bondstypli, anglestypli, dihedralstypli
       INTEGER bonds, angles, dihedrals, atomstyp, bondstyp, anglestyp
       INTEGER dihedralstyp, chargetyp, typb(99999), b1(99999)
       INTEGER b2(99999), typa(99999), a1(99999), a2(99999), a3(99999)
       INTEGER typd(99999), d1(99999), d2(99999), d3(99999), d4(99999)
       INTEGER n, a, id(99999), nele, crap, mol(99999), ide(99999)
       INTEGER l, nn, bb1, bb2, aa1, aa2, aa3, dd1, dd2, dd3, dd4
       REAL xlo, xhi, ylo, yhi, zlo, zhi, charge(99999), rx(99999)
       REAL ry(99999), rz(99999), vx(99999), vy(99999), vz(99999)
       REAL q(999999), qe(99999), xe(99999), ye(99999), ze(99999)
       CHARACTER (len=10) typ(99999), label(99999)

        open (10, file='info.txt', status='old')
            read (10,*)cat
            read (10,*)atomscat
            read (10,*)bondscat
            read (10,*)anglescat
            read (10,*)dihedralscat
            read (10,*)atomstypcat
            read (10,*)bondstypcat
            read (10,*)anglestypcat
            read (10,*)dihedralstypcat
            read (10,*)
            read (10,*)an
            read (10,*)atomsan
            read (10,*)bondsan
            read (10,*)anglesan
            read (10,*)dihedralsan
            read (10,*)atomstypan
            read (10,*)bondstypan
            read (10,*)anglestypan
            read (10,*)dihedralstypan
            read (10,*)
            read (10,*)li
            read (10,*)atomsli
            read (10,*)bondsli
            read (10,*)anglesli
            read (10,*)dihedralsli
            read (10,*)atomstypli
            read (10,*)bondstypli
            read (10,*)anglestypli
            read (10,*)dihedralstypli
            bonds=bondscat+bondsan+bondsli
            angles=anglescat+anglesan+anglesli
            dihedrals=dihedralscat+dihedralsan+dihedralsli
            atomstyp=atomstypcat+atomstypan+atomstypli
            bondstyp=bondstypcat+bondstypan+bondstypli
            anglestyp=anglestypcat+anglestypan+anglestypli
            dihedralstyp=dihedralstypcat+dihedralstypan+dihedralstypli
            read (10,*)
            read (10,1000)xlo
            read (10,1000)xhi
            read (10,1000)ylo
            read (10,1000)yhi
            read (10,1000)zlo
            read (10,1000)zhi
            read (10,*)
            read (10,*)chargetyp
            read (10,*)
            read (10,*)
            do i=1,chargetyp
              read (10,1001)charge(i)
            enddo
            read (10,*)
            read (10,*)
            read (10,*)
            do i=1,bonds
              read (10,*)typb(i),b1(i),b2(i)
            enddo
            read (10,*)
            read (10,*)
            read (10,*)
            do i=1,angles
              read (10,*)typa(i),a1(i),a2(i),a3(i)
            enddo
            read (10,*)
            read (10,*)
            read (10,*)
            do i=1,dihedrals
              read (10,*)typd(i),d1(i),d2(i),d3(i),d4(i)
            enddo
        close (10)

        open (20, file='conf.gro', status='old')
            read (20,*)
            read (20,*)n
            do i=1,n
              read (20,1002)a,typ(i),label(i),k,rx(i),ry(i),rz(i),vx(i),vy(i),vz(i)
            enddo
        close (20)

        do i=1,n
          if(label(i).eq.'   P1') id(i)=1
          if(label(i).eq.'   C2') id(i)=2
          if(label(i).eq.'   C3') id(i)=3
          if(label(i).eq.'   C4') id(i)=2
          if(label(i).eq.'   C5') id(i)=3
          if(label(i).eq.'   C6') id(i)=2
          if(label(i).eq.'   C7') id(i)=3
          if(label(i).eq.'   C8') id(i)=2
          if(label(i).eq.'   C9') id(i)=2
          if(label(i).eq.'  O10') id(i)=4
          if(label(i).eq.'  C11') id(i)=3
          if(label(i).eq.'    C') id(i)=5
          if(label(i).eq.'    S') id(i)=6
          if(label(i).eq.'    N') id(i)=7
          if(label(i).eq.'    O') id(i)=8
          if(label(i).eq.'    F') id(i)=9
          if(label(i).eq.'   Li') id(i)=10
          if(label(i).eq.'   P1') q(i)=charge(1)
          if(label(i).eq.'   C2') q(i)=charge(2)
          if(label(i).eq.'   C3') q(i)=charge(3)
          if(label(i).eq.'   C4') q(i)=charge(2)
          if(label(i).eq.'   C5') q(i)=charge(3)
          if(label(i).eq.'   C6') q(i)=charge(2)
          if(label(i).eq.'   C7') q(i)=charge(3)
          if(label(i).eq.'   C8') q(i)=charge(4)
          if(label(i).eq.'   C9') q(i)=charge(5)
          if(label(i).eq.'  O10') q(i)=charge(6)
          if(label(i).eq.'  C11') q(i)=charge(7)
          if(label(i).eq.'    C') q(i)=charge(8)
          if(label(i).eq.'    S') q(i)=charge(9)
          if(label(i).eq.'    N') q(i)=charge(10)
          if(label(i).eq.'    O') q(i)=charge(11)
          if(label(i).eq.'    F') q(i)=charge(12)
          if(label(i).eq.'   Li') q(i)=charge(13)
        enddo  

        open (30, file='ele.dat', status='old')
          read (30,*)nele
          do i=1,nele
            read(30,*) crap,mol(i),ide(i),qe(i),xe(i),ye(i),ze(i)
            qe(i)=0.000
          enddo
        close(30)

        open (40, file='data.txt', status='unknown')
            write (40,1003)'LAMMPS data file via mkdata.f90'
            write (40,*)
            write (40,1004)cat*atomscat+an*atomsan+li*atomsli,' atoms'
            write (40,1004)cat*bondscat+an*bondsan+li*bondsli,' bonds'
            write (40,1005)cat*anglescat+an*anglesan+li*anglesli,' angles'
            write (40,1006)cat*dihedralscat+an*dihedralsan+li*dihedralsli,' dihedrals'
            write (40,*)
            write (40,1007)atomstyp,' atom types'
            write (40,1007)bondstyp,' bond types'
            write (40,1008)anglestyp,' angle types'
            write (40,1009)dihedralstyp,' dihedral types'
            write (40,*)
            write (40,1010)xlo,xhi,' xlo xhi'
            write (40,1010)ylo,yhi,' ylo yhi'
            write (40,1010)zlo,zhi,' zlo zhi'
            write (40,*)
            write (40,1011)'Masses'
            write (40,*)
            write (40,*)
            write (40,*)
            write (40,1012)'Bond Coeffs'
            write (40,*)
            write (40,*)
            write (40,*)
            write (40,1013)'Angle Coeffs'
            write (40,*)
            write (40,*)
            write (40,*)
            write (40,1014)'Dihedrals Coeffs'
            write (40,*)
            write (40,*)
            write (40,*)
            write (40,1015)'Atoms'
            write (40,*)
            l=0
            nn=1
            do i=1,n
              l=l+1
              write (40,1016)l,nn,id(i),q(i),rx(i)*10,ry(i)*10,rz(i)*10
              if (i.le.(cat*atomscat)) then
                nn=int(i/atomscat)+1
              else if (i.gt.(cat*atomscat) .and. i.le.((cat*atomscat)+(an*atomsan))) then
                nn=int((i-(cat*atomscat))/atomsan)+1+cat
              else
                nn=nn+1
              endif
            enddo
            do i=1,nele
             l=l+1
             write (40,1016)l,mol(i),ide(i),qe(i),xe(i),ye(i),ze(i)
            enddo
            write (40,*)
            write (40,1017)'Bonds'
            write (40,*)
            l=0
            do j=1,cat             
              do i=1,bondscat
                l=l+1
                bb1=((j-1)*atomscat)+b1(i)
                bb2=((j-1)*atomscat)+b2(i)
                write (40,1018)l,typb(i),bb1,bb2
              enddo
            enddo
            do j=1,an
              do i=bondscat+1,bondscat+bondsan
                l=l+1
                bb1=((j-1)*atomsan)+((b1(i)-atomscat)+(cat*atomscat))
                bb2=((j-1)*atomsan)+((b2(i)-atomscat)+(cat*atomscat))
                write (40,1018)l,typb(i),bb1,bb2
              enddo
            enddo
            write (40,*)
            write (40,1019)'Angles'
            write (40,*)
            l=0
            do j=1,cat
              do i=1,anglescat
                l=l+1
                aa1=((j-1)*atomscat)+a1(i)
                aa2=((j-1)*atomscat)+a2(i)
                aa3=((j-1)*atomscat)+a3(i)
                write (40,1020)l,typa(i),aa1,aa2,aa3
              enddo
            enddo
            do j=1,an
              do i=anglescat+1,anglescat+anglesan
                l=l+1
                aa1=((j-1)*atomsan)+((a1(i)-atomscat)+(cat*atomscat))
                aa2=((j-1)*atomsan)+((a2(i)-atomscat)+(cat*atomscat))
                aa3=((j-1)*atomsan)+((a3(i)-atomscat)+(cat*atomscat))
                write (40,1020)l,typa(i),aa1,aa2,aa3
              enddo
            enddo
            write (40,*)
            write (40,1021)'Dihedrals'
            write (40,*)
            l=0
            do j=1,cat
              do i=1,dihedralscat
                l=l+1
                dd1=((j-1)*atomscat)+d1(i)
                dd2=((j-1)*atomscat)+d2(i)
                dd3=((j-1)*atomscat)+d3(i)
                dd4=((j-1)*atomscat)+d4(i)
                write (40,1022)l,typd(i),dd1,dd2,dd3,dd4
              enddo
            enddo
            do j=1,an
              do i=dihedralscat+1,dihedralscat+dihedralsan
                l=l+1
                dd1=((j-1)*atomsan)+((d1(i)-atomscat)+(cat*atomscat))
                dd2=((j-1)*atomsan)+((d2(i)-atomscat)+(cat*atomscat))
                dd3=((j-1)*atomsan)+((d3(i)-atomscat)+(cat*atomscat))
                dd4=((j-1)*atomsan)+((d4(i)-atomscat)+(cat*atomscat))
                write (40,1022)l,typd(i),dd1,dd2,dd3,dd4
              enddo
            enddo
        close (40)  

1000    format(f8.3)
1001    format(f8.5)
1002    format(i5,2a5,i5,3f8.3,3f8.4)
1003    format(a27)
1004    format(i5,a6)
1005    format(i5,a7)
1006    format(i5,a10)
1007    format(i2,a11)
1008    format(i2,a12)
1009    format(i2,a15)
1010    format(f8.3,f8.3,a8)
1011    format(a6)
1012    format(a11)
1013    format(a12)
1014    format(a15)
1015    format(a5)
1016    format(i6,i4,i3,f9.5,3f8.3)
1017    format(a5)
1018    format(i5,i2,2i6)
1019    format(a6)
1020    format(i5,i3,3i6)
1021    format(a9)
1022    format(i5,i3,4i6)

END PROGRAM
