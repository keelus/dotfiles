({...}: let
		minecraftOverlay = final: prev: {
			minecraft =
				prev.minecraft.overrideAttrs (old: {
						meta = old.meta // {broken = false;};
					});
		};
	in {
		nixpkgs.overlays = [minecraftOverlay];
	})
