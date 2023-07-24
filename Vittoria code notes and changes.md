# 1 General notes

**Cam development cam6_2_011** 
(using grep, ls and wc in /home/home01/earfw/RR/cam_development/src)

- 2633 F90 modules (ls -R | grep -i F90 | wc -l)
- 13416 subroutines (grep -iR "end subroutine"| wc -l)
- 3031 functions (grep -iR "end function"| wc -l)

**For atmosphere** 
- (from /home/home01/earfw/RR/cam_development/src)
- Using same commands as above

- 1342 F90 modules
- 5317 subroutines
- 1105 functions


---
Call flow

*Note - all bold are .F90 files with extensions removed*

- **gw_drag** is used by **runtime_opts** and **[[physpkg]]**
- **runtime_opts** and **physpkg** are used by **[[cam_comp]]**
- **cam_comp** is used by **atm_comp_mct** and **atm_comp_nuopc** 
	- src/cpl/mct/atm_comp_mct.F90:  use cam_comp,          only: cam_init, cam_run1, cam_run2, cam_run3, cam_run4, cam_final
	- src/cpl/nuopc/atm_comp_nuopc.F90:  use cam_comp            , only : cam_init, cam_run1, cam_run2, cam_run3, cam_run4, cam_final
- **atm_comp_mct** is used by **cime_comp_mod**
	- [phymku@login1.arc4 cam_development]$ grep -R "use atm_comp_mct" 
	- 
	- grep: cime/src/build_scripts/__pycache__/buildlib.cpython-37.pyc: Permission denied
	- cime/src/drivers/mct/main/cime_comp_mod.F90:  use atm_comp_mct  , only: atm_init=>atm_init_mct, atm_run=>atm_run_mct, atm_final=>atm_final_mct
	- cime/src/drivers/moab/main/cime_comp_mod.F90:  use atm_comp_mct  , only: atm_init=>atm_init_mct, atm_run=>atm_run_mct, atm_final=>atm_final_mct
- **atm_comp_nuopc** - it's unclear how this interacts with other modules, as there's no obvious place where it is "used" by other modules, and there are two other atm_comp_nuopc modules ([[see more]])
  
- **[[gw_drag]]**

	
---

**KDYN ONLY**
- gw_chem
- gw_common
- gw_diffusion
- gw_drag

**CTRL ONLY**
None...

**BOTH**
- charge_neutrality
- mo_photo
- mo_usrrxt

Call sequence
















# 2 charge_neutrality
cam/src/chemistry/mozart/

### 2.1.1 do why has wrk wrk(:ncol,:) been replaced by vmr(:ncol,:,elec_ndx)

#q why has mbarv(:ncol,:,lchnk) been replaced by mbar(:ncol,:)

### 2.1.2 do 4+ 

use cam_logfile,  only : iulog
Why, what is this for and why was it not needed before?

### 2.1.3 do 7+ 
use chem_mods,    only : gas_pcnst
Why? Why was this not needed before?

### 2.1.4 17-, 19-21+ 
Changed number of elements in array of positive ions

### 2.1.5 do 23-,27-30+
Added additional metals

### 2.1.6 do 49-,56+
Added extra k variable, why?
It doesn't look like it's used for anything.

### 2.1.7 74-79-, 81+
Refactored code that does same thing

### 2.1.8 do 97+
Why is this added? It only gets used once, what is this usage, and is it necessary?

### 2.1.9 do 115+ mbar pointer?
Why is this here?

### 2.1.10 do !! 114-,117+
Why has this changed, i.e. gas_pcnst now passed to vmr array?

### 2.1.11 do 127-, 130-131+
Why are these variables used instead of wrk? Looks like it has changed the whole working of this loop.

### 2.1.12 do 140,144+
Why is mbar pointer preferable to just using the mbarv array? 

Why does vmr array have final dimension indexed? Has something changed with the grid?

### 2.1.13 do !! 140- 142- 144- 146-, 148+
What has happened here?

### 2.1.14 do 149-159-,153+
What has happened here? Has all of that deleted code been absorbed into the function charge_balance()?

### 2.1.15 do !! 164-, 158+
Again looks to be doing same thing with slightly differently defined variables. Why are they definted differently?

### 2.1.16 do 169, 162+
Looks to be doing the same but using slightly different variables




# 3 gw_chem

# 4 gw_common
cam/src/physics/cam/

### 4.1.1 do 10-13+

importing modules  - not sure how they are used, missing fortran background knowledge
![[Pasted image 20230327102357.png]]

### 4.1.2 276+
Passes use_gw_chem boolean to gw_drag_profile subroutine

### 4.1.3 341-343+ 

made ttgw and qtgq optoinal
![[Pasted image 20230327111612.png]]
#questions_for_Vittoria  why have these been made optional outputs? Is it because this subroutine is used for a different purpose elsewhere, and it saves on calling other code that computes ttgw and qtgw, and then returning their values, when this is not the purpose of its use?

### 4.1.4 352+ 
made dttdf optional

### 4.1.5 372+
 specify use_gw_chem

### 4.1.6 439-442 -
- removes ttgw, dttdf and qtgw from default initialisations
![[Pasted image 20230327113715.png]]

### 4.1.7 do 677-689+
if do vertical diffusion. - calculates effective diffusivity but NOT LU decomposition...

### 4.1.8 do 710-723+

Evaluates second temperature tendency term dttke - note #questions_for_Vittoria where is the first term evaluated?




# 5 gw_diffusion
cam/src/physics/cam/

# 6 gw_drag
cam/src/physics/cam/

- subroutine **gw_drag_readnl**
- subroutine **gw_init**
- subroutine **gw_init_beres**
- function **get_pio_dimlen**
- subroutine **handle_pio_erro**
- subroutine **[[gw_tend]]**
- subroutine **gw_rdg_calc**
- subroutine **gw_spec_addflds**
- function **find_bin**
- function **c_to_l**
- subroutine **gw_spec_outflds**
- function **tau_fld_name**
- function **var_fld_name**
- subroutine **gw_chem_addflds**
- subroutine **gw_chem_outflds**

## 6.1 Code differences

### 6.1.1 81-83+
Adds namelist switch controled in user_nl_cam

### 6.1.2 238+
Imports use_gwfronto_chem from gw_drag_nl

### 6.1.3 339-341+
Broadcasts value of use_gw_chem to all processors

### 6.1.4 do !!! 707-736+
Adds fields that will later be used to output diagnostic variables

Q4Vittoria - Why is there a loop over 6 values.

### 6.1.5 do !! 884-890+
What does this do?

### 6.1.6 do !!!! 913 
What does this if statement close?


### 6.1.7 do !! 956-961+
What does this do? What kind of field is this?

### 6.1.8 do !! 1010-1016+
What does this do, what kind of field is this?

### 6.1.9 do !!!! 1079-1100
What does this do Total fields across all GW spectru?

### 6.1.10 do !!!! 1088...
is k_tot_tot 1+xi*kzz... or (1+xi)*kzz. Because that's important no?

### 6.1.11 do !!!! 1280+
This is the big module! What is effective_gw_diffusivity?

### 6.1.12 do !!!! 1427-1450+
Variables for gw_chem.

What are these variables?

### 6.1.13 do !!! 1514-1519+
How are these variables used, how are they calculated. What do they physically mean?

### 6.1.14 do !!!! 1547-1584+
This is important. I do not understand this.

### 6.1.15 do !! 1441-,1587+
What is this that's been changed?

### 6.1.16 do ! 1590-1592+
What is this if statement closing?

### 6.1.17 do !!!! 1670-1715+
What is all this, and how is this different to 1441-1592


### 6.1.18 do 1793-1838+
Again, same as above.

### 6.1.19 1698-,1923+
These are the same just in different order.

### 6.1.20 1793-,2018+
These are the same just in different order.





---
# 7 mo_photo
cam/src/chemistry/mozart/



---
# 8 mo_usrrxt
cam/src/chemistry/mozart/

