! *****************************COPYRIGHT*******************************
! (C) Crown copyright Met Office. All rights reserved.
! For further details please refer to the file COPYRIGHT.txt
! which you should have received as part of this distribution.
! *****************************COPYRIGHT*******************************

module casim_cpm_mod

use variable_precision,      only: wp
use mphys_constants_mod,     only: cpd => cp, Cwater, Cice

implicit none

public :: cpv_cpm, cl_cpm, ci_cpm
public :: set_casim_cp_coeffs

real(kind=wp) :: cpv_cpm = 0.0_wp
real(kind=wp) :: cl_cpm  = 0.0_wp
real(kind=wp) :: ci_cpm  = 0.0_wp

contains

subroutine set_casim_cp_coeffs(casim_mode, casim_cp_none, casim_cp_dry, casim_cp_moist, hcapv)

integer, intent(in) :: casim_mode
integer, intent(in) :: casim_cp_none
integer, intent(in) :: casim_cp_dry
integer, intent(in) :: casim_cp_moist
real :: hcapv

select case (casim_mode)
  case (casim_cp_none)
    cpv_cpm = 0.0_wp
    cl_cpm  = 0.0_wp
    ci_cpm  = 0.0_wp
  case (casim_cp_dry)
    cpv_cpm = real(cpd, kind=wp)
    cl_cpm  = real(cpd, kind=wp)
    ci_cpm  = real(cpd, kind=wp)
  case (casim_cp_moist)
    cpv_cpm = real(hcapv, kind=wp)
    cl_cpm  = real(Cwater, kind=wp)
    ci_cpm  = real(Cice, kind=wp)
  case default
    cpv_cpm = 0.0_wp
    cl_cpm  = 0.0_wp
    ci_cpm  = 0.0_wp
end select

end subroutine set_casim_cp_coeffs

end module casim_cpm_mod
