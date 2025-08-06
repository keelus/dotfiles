{...}: {
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Windows [main]" {
				insmod part_gpt
				insmod fat
				set root=(hd2,gpt1)
				chainloader /EFI/WindowsA/Boot/bootmgfw.efi
			}

			menuentry "Windows [extra]" {
				insmod part_gpt
				insmod fat
				set root=(hd2,gpt1)
				chainloader /EFI/WindowsB/Boot/bootmgfw.efi
			}
		'';
		gfxmodeEfi = "2560x1440";
	};
}
