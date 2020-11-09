c PROGRAM ACF_SIMD

!https://software.intel.com/content/www/us/en/develop/documentation/fortran-compiler-developer-guide-and-reference/top/language-reference/a-to-z-reference/s-1/simd-loop-directive.html

subroutine add(A, N, X)
   integer N, X
   real    A(N)
cDIR$ SIMD
   DO I=X+1, N
      A(I) = A(I) + A(I-X)
   ENDDO
end

