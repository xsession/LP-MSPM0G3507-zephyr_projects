choco install ninja wget 7z
pip install west
pip install -r zephyr/scripts/requirements.txt

cd app
local_path=$(pwd)
west init -l 
west update
west zephyr-export

cd %HOMEPATH%
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.5-1/zephyr-sdk-0.16.5-1_windows-x86_64.7z
7z x zephyr-sdk-0.16.5-1_windows-x86_64.7z
./zephyr-sdk-0.16.5-1_windows-x86_64/zephyr-sdk-0.16.5-1/setup.cmd
@REM reboot

cd %local_path%
west build -p -b rpi_pico -d ../build