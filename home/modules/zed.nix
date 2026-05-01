{pkgs, ...}: {
	programs.zed-editor = {
		enable = true;
		userSettings = {
			theme = {
				mode = "dark";
				dark = "Ayu Dark";
				light = "One Light";
			};
			vim_mode = true;
			lsp = {
				clangd = {
					fetch = {
						pre_release = true;
					};
				};
			};
			languages = {
				C = {
					format_on_save = "on";
				};
				"C++" = {
					format_on_save = "on";
				};
			};
			file_types = {
				c = ["c" "h"];
				"C++" = ["cpp" "hpp"];
			};
			diagnostics = {
				inline = {
					enabled = true;
					max_severity = null;
				};
			};
			relative_line_numbers = "enabled";
		};
	};
}
