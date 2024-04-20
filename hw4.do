cd "C:\Users\leehy\OneDrive - Johns Hopkins\JHU BSPH Classes\Term 4 2024\Stata Intermediate\HW4"

set obs 30
*an age variable with a mean of 57 years and a standard deviation of 15. Use the command (to simulate a normal distribution)
gen age = (rnormal() * 15) + 57
	* t-distribution 
		gen age_t=(rt(_N)*15)+57
		* _N (degrees of freedom) might affect a t-distribution.*
hist age, normal

hist age, ///
   fcolor(orange%40) /// simulated normal 
   addplot(hist age_t, fcolor(midblue%50)) /// simulated t-distribution 
   normal /// theoretical normal
   legend(on ///
      lab(1 "Sampled from Normal") ///
	  lab(2 "Theoretical Normal") ///
	  lab(3 "Sampled from t-distribution") ///
	  )
graph export "agedistribution.png", replace
	  
//Distribution of \text{Age, years} \sim \mathcal{N}(\mu=57,\,\sigma^{2}=225), to provide a mathematical representation of the age distribution.

	  
*
dyndoc hw4.do, saving(hw4.html) replace
		

dyndoc index.do, saving(index.html) replace
