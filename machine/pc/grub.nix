{...}: {
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Windows [main]" {
				insmod part_gpt
				insmod fat
				search --no-floppy --fs-uuid --set=root 83CD-374C
				chainloader /EFI/Microsoft/Boot/bootmgfw.efi
			}
		'';
		gfxmodeEfi = "2560x1440";
	};
}
