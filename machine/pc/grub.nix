{...}: {
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Windows" {
				insmod part_gpt
				insmod fat
				search --no-floppy --fs-uuid --set=root E441-8964
				chainloader /EFI/Microsoft/Boot/bootmgfw.efi
			}
			menuentry "Ubuntu" {
				insmod part_gpt
				insmod fat
				search --no-floppy --fs-uuid --set=root FFC2-BA1E
				chainloader /EFI/ubuntu/grubx64.efi
			}
		'';
		gfxmodeEfi = "2560x1440";
	};
}