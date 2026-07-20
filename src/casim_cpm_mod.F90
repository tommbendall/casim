! *****************************COPYRIGHT*******************************
! (C) Crown copyright Met Office. All rights reserved.
! For further details please refer to the file COPYRIGHT.txt
! which you should have received as part of this distribution.
! *****************************COPYRIGHT*******************************

module casim_cpm_mod

use variable_precision,      only: wp

implicit none

public :: cpv_cpm, cl_cpm, ci_cpm
public :: set_casim_cp_coeffs

real(kind=wp) :: cpv_cpm = 0.0_wp
real(kind=wp) :: cl_cpm  = 0.0_wp
real(kind=wp) :: ci_cpm  = 0.0_wp

contains

subroutine set_casim_cp_coeffs(cpv_in, cl_in, ci_in)

real :: cpv_in, cl_in, ci_in

cpv_cpm = real(cpv_in, kind=wp)
cl_cpm  = real(cl_in, kind=wp)
ci_cpm  = real(ci_in, kind=wp)

end subroutine set_casim_cp_coeffs

end module casim_cpm_mod
