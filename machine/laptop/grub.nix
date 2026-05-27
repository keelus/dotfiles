{pkgs, ...}: {
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Ubuntu" {
				insmod part_gpt
				insmod fat
				insmod chain

				search --no-floppy --fs-uuid --set=root 9FDD-0EC7
				chainloader /EFI/ubuntu/shimx64.efi
			}

			menuentry "Windows" {
				insmod part_gpt
				insmod fat

				search --no-floppy --fs-uuid --set=root 9FDD-0EC7
				chainloader /EFI/Microsoft/Boot/bootmgfw.efi
			}
		'';
		gfxmodeEfi = "2880x1800";
		enableCryptodisk = true;
	};
}
