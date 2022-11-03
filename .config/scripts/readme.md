## Various helpful scripts

## Create Bootable ISOs

- `diskutil list; df -Hl;`
- `dd bs=1M if=iso of=/dev/your_usb status=progress`

## Bootstraps

- `bash -c "$(curl https://raw.githubusercontent.com/DrDrei/dotfiles/main/.config/scripts/bootstrap-proxmox)"`
