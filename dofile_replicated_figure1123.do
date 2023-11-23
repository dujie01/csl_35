//  -----------------------------------------------------------------------------------
//  This do file prepares data for baseline analysis
//  -----------------------------------------------------------------------------------
**figure1 (b)-(d)

*figure1-(d)
foreach y of var ap_index{
 reg `y' age c.age#c.age if age>=30 & age<=40, robust noconstant
marginscontplot age if age>=30 & age<=40, ci
graph save Graph "ap_curve.gph", replace
}

*figure1-(c) 
generate dummy_age=1 if age>35.99

replace dummy_age=0 if age<=35.99

reg opportunities1 dummy_age age if age<=40 & age>=30, robust

bys age: egen mean_opp=mean(opportunities1)

predict fit_opportunities1

predict fitsd_opportunities1, stdp
gen upfit=fit_opportunities1+1.96*fitsd_opportunities1

gen downfit=fit_opportunities1-1.96*fitsd_opportunities1

 keep age1  mean_opp fit_opportunities1 upfit downfit
 duplicates drop
       
 twoway (rarea upfit downfit age if age<=35 & age>=30, sort fcolor(blue%20) lcolor(blue%20)) ///
(rarea upfit downfit age if age<=40 & age>=36, sort fcolor(red%20) lcolor(red%20)) ///
 (line mean_opp age if age<=35 & age>=30, sort lcolor(blue) lwidth(thick)) ///
 (line mean_opp age if age<=40 &age>=36, sort lcolor(red) lwidth(thick)) ///
(scatter fit_opportunities1 age if age<=40 & age>=30, msize(medlarge) mcolor(black)  msymbol(circle_hollow)), ///
ytitle("`var'") xtitle("Age (cutoff: 35.5)") xline(35.5, lcolor(black)) legend(order(1 "95% CI, age<=35" 2 "95% CI, age>35" 3 "Mean, age<=35" 4 "Mean,age>35" 5 "Fitted_value")) xlabel(30(1)40) title("Fuzzy RDD")



*figure1-(d) 
generate dummy_age=1 if age1>35.99

replace dummy_age=0 if age1<=35.99

reg opportunities2 dummy_age age if age1<=40 & age1>=30, robust

bys age: egen mean_opp=mean(opportunities2)

predict fit_opportunities2

predict fitsd_opportunities2, stdp
gen upfit=fit_opportunities2+1.96*fitsd_opportunities2

gen downfit=fit_opportunities2-1.96*fitsd_opportunities2

keep age mean_opp fit_opportunities2 upfit downfit
duplicates drop

    
twoway (rarea upfit downfit age if age<=35 & age>=30, sort fcolor(blue%20) lcolor(blue%20)) ///
(rarea upfit downfit age if age<=40 & age>=36, sort fcolor(red%20) lcolor(red%20)) ///
(line fit_opportunities2 age if age<=35 & age>=30, sort lcolor(blue) lwidth(thick)) ///
(line fit_opportunities2 age if age<=40 &age>=36, sort lcolor(red) lwidth(thick)) ///
(scatter fit_opportunities2 age if age<=40 & age>=30, msize(medlarge) mcolor(black)  msymbol(circle_hollow)), ///
ytitle("`var'") xtitle("Age (cutoff: 35.5)") xline(35.5, lcolor(black)) legend(order(1 "95% CI, age<=35" 2 "95% CI, age>35" 3 "Mean, age<=35" 4 "Mean,age>35" 5 "Fitted_value")) xlabel(30(1)40) title("")


**figure2
egen bin10 = cut(age), at(30(1)41)

foreach y of var perday_passive_kl_num active_dc_rate perday_active_kl_num passive_dc_rate perday_dc_num gap_act_pass_salary {
    rdplot `y' bin10 if age>=30 & age<40, ci(95) c(35.1) p(2) kernel(uni) graph_options(title() legend(off) ytitle("`var'") xtitle("") scheme(plotplainblind))
   
    graph export "`y_f1'.png" , replace
}
