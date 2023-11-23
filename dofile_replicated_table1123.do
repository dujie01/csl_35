//  -----------------------------------------------------------------------------------
//  This do file prepares data for baseline analysis
//  -----------------------------------------------------------------------------------
**Table 1

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var perday_passive_kl_num active_dc_rate perday_active_kl_num passive_dc_rate perday_dc_num gap_act_pass_salary{	
	foreach kvar of local kernelfn { 
	rdrobust `y' age2, c(35.99) kernel(`kvar') all fuzzy(jobopp) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table1_sa.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var perday_passive_kl_num active_dc_rate perday_active_kl_num passive_dc_rate perday_dc_num gap_act_pass_salary{	
	foreach kvar of local kernelfn { 
	rdrobust `y' age2, c(35.99) kernel(`kvar') all fuzzy(dummy_age) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table1_sa.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var perday_passive_kl_num active_dc_rate perday_active_kl_num passive_dc_rate perday_dc_num gap_act_pass_salary{	
	foreach kvar of local kernelfn { 
	rdrobust `y' age2, c(35.99) kernel(`kvar') all fuzzy(jobopp) 
		outreg2 using "/Users/admin/Downloads/middle_age/table1_sa.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var perday_passive_kl_num active_dc_rate perday_active_kl_num passive_dc_rate perday_dc_num gap_act_pass_salary{	
	foreach kvar of local kernelfn { 
	rdrobust `y' age2, c(35.99) kernel(`kvar') all fuzzy(dummy_age) 
		outreg2 using "/Users/admin/Downloads/middle_age/table1_sa.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

**Table 2

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var kl_wdcity_pairs tt_kl_dis kl_up_rate kl_down_rate {	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2, c(35.5) kernel(`kvar') all fuzzy(jobopp1) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table2_rp1.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var kl_wdcity_pairs tt_kl_dis kl_up_rate kl_down_rate{	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2, c(35.5) kernel(`kvar') all fuzzy(dummy_age1) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table2_rp1.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}


local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var kl_wdcity_pairs tt_kl_dis kl_up_rate kl_down_rate {	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2, c(35.5) kernel(`kvar') all fuzzy(jobopp1)
		outreg2 using "/Users/admin/Downloads/middle_age/table2_rp1.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var kl_wdcity_pairs tt_kl_dis kl_up_rate kl_down_rate{	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2, c(35.5) kernel(`kvar') all fuzzy(dummy_age1)
		outreg2 using "/Users/admin/Downloads/middle_age/table2_rp1.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

**Table 4

local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var perday_passive_kl_num tran_gg_3 tran_gg_5 {	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2 if whe_s==0, c(35.99) kernel(`kvar') all fuzzy(dummy_age) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table4_add.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}



local kernelfn "tri epa uni"   // 
global z "degree_id gender work_years"
foreach y of var perday_passive_kl_num tran_gg_3 tran_gg_5 {	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2 if whe_s==1 & whe_h==1 , c(35.99) kernel(`kvar') all fuzzy(dummy_age) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table4_add.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}


local kernelfn "tri epa uni"   // 
global z "degree_id1 gender work_years"
foreach y of var perday_passive_kl_num tran_gg_3 tran_gg_5 {	
	foreach kvar of local kernelfn { 
		
		rdrobust `y' age2 if whe_s==1 & whe_h==0, c(35.99) kernel(`kvar') all fuzzy(dummy_age) covs($z)
		outreg2 using "/Users/admin/Downloads/middle_age/table4_add.xls", excel addtext(Kernel Type, `e(kernel)') addstat(bandwidth, e(h_l)) ctitle(`y'_p) dec(4) append 
	}
}

