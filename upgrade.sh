rm -rf $(pwd)/boot
rm -rf $(pwd)/kernel
mkdir -p $(pwd)/boot $(pwd)/kernel
curl -L https://www.stdin.xyz/downloads/people/longsleep/pine64-images/simpleimage-pine64-latest.img.xz -o boot/boot.img.xz
curl -L https://www.stdin.xyz/downloads/people/longsleep/pine64-images/linux/linux-pine64-latest.tar.xz -o kernel/kernel.tar.xz

