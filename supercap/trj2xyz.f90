! 19.Jan.2021 - Rafael Guimaraes
! Converte trajetoria lammps em xyz
! versao: vide na variavel editavel abaixo
!

program trj2xyz

    character*80    lixo,versao
    character*1     label
    real::          x, y, z
    integer::       nconfig, natoms

! editar, inicio
    nconfig=2
    versao='trj2xyz - Versao 1.20200119.2240'
    open(99,file='dump.lammpstrj')
    open(2,file='dump.xyz', status='unknown')
! editar, fim

! rotina soh para o cabecalho do xyz
    read(99,*) lixo
    read(99,*) lixo
    read(99,*) lixo
    read(99,*) natoms
    write(2,*) natoms
    write(2,*) versao
    close(99)
    open(1,file='dump.lammpstrj')


    do j=1, nconfig
        read(1,*) lixo
        read(1,*) lixo
        read(1,*) lixo
        read(1,*) natoms
        read(1,*) lixo
        read(1,*) lixo
        read(1,*) lixo
        read(1,*) lixo
        read(1,*) lixo
        do i=1, natoms
            read(1,*) lixo, lixo, lixo, label, lixo, x, y, z
            write(2,*) label, x, y, z
        enddo
    enddo
 close(1)
 close(2)
end program
