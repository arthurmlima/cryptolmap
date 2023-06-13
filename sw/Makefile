init:
	xsct -eval "setws $(ws); \
		platform create -name $(plat_name) -hw $(xsa); \
		domain create -name $(domain_name_apu) -os standalone -proc psu_cortexa53_0; \
		domain create -name $(domain_name_rpu) -os standalone -proc psu_cortexr5_0; \
		app create -name $(app_name_apu) -platform $(plat_name) -domain $(domain_name_apu) -sysproj $(sys_name) -template {Hello World}; \
		app create -name $(app_name_rpu) -platform $(plat_name) -domain $(domain_name_rpu) -sysproj $(sys_name) -template {Hello World}; \
		platform active $(plat_name); \
		platform generate; \
		app build $(app_name_apu); \
		app build $(app_name_rpu)"