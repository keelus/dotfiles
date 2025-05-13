{ config, pkgs, ...} :
let
	rPackages = with pkgs.rPackages; [
		lattice
		ggplot2
		caret
		gridExtra
		kableExtra
	];

	r = pkgs.rWrapper.override{
		packages = rPackages;
	};

	rstudio = pkgs.rstudioWrapper.override{
		packages = rPackages;
	};
in {
	home.packages = [
		r
		rstudio
	];
}
