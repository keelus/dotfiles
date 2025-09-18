{pkgs, ...}: {
	home.packages = with pkgs; [
		gtk3
		gtk4
	];

	gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
	};
}
