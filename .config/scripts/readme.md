## Various helpful scripts

## Create Bootable ISOs

- `diskutil list; df -Hl;`
- `dd bs=1M if=iso of=/dev/your_usb status=progress`
- `apt update && apt install curl`

## Bootstraps

- `bash -c "$(curl https://raw.githubusercontent.com/DrDrei/dotfiles/main/.config/scripts/bootstrap-proxmox)"`
- `bash -c "$(curl https://raw.githubusercontent.com/DrDrei/dotfiles/main/.config/scripts/bootstrap-debian)"`
