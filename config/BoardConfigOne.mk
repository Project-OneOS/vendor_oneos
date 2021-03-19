# Kernel
include vendor/one/config/BoardConfigKernel.mk

include vendor/one/build/core/BoardConfigQcom.mk

# Soong
include vendor/one/config/BoardConfigSoong.mk

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/one/sepolicy/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    vendor/one/sepolicy/public
