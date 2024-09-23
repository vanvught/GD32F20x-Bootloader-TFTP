$(info "Board.mk")

ifndef BOARD
	$(error BOARD is not set)
endif

ifndef DEFINES
	DEFINES=
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F103RC)
	MCU=GD32F103RC
	DEFINES+=-DCONFIG_STORE_USE_ROM
	DEFINES+=-DNO_EMAC
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F107RC)
	MCU=GD32F107RC
	DEFINES+=-DCONFIG_STORE_USE_ROM
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F207RG)
	MCU=GD32F207RG
	DEFINES+=-DCONFIG_STORE_USE_SPI
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F207VC_2)
	MCU=GD32F207VC
	DEFINES+=-DCONFIG_STORE_USE_ROM
	BITBANGING595=1
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F207VC_4)
	MCU=GD32F207VC
	DEFINES+=-DCONFIG_STORE_USE_ROM
	BITBANGING595=1
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F303RC)
	MCU=GD32F303RC
	DEFINES+=-DCONFIG_STORE_USE_ROM
	DEFINES+=-DNO_EMAC
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F407RE)
	MCU=GD32F407RE
	DEFINES+=-DCONFIG_STORE_USE_SPI
endif
	
ifeq ($(strip $(BOARD)),BOARD_GD32F450VE)
	MCU=GD32F450VE
	DEFINES+=-DCONFIG_STORE_USE_RAM
	BITBANGING595=1
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F450VI)
	MCU=GD32F450VI
endif

ifeq ($(strip $(BOARD)),BOARD_16X4U_PIXEL)
	MCU=GD32F450VI
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F470VG)
	MCU=GD32F470VG
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F207C_EVAL)
	MCU=GD32F207VC
	DEFINES+=-DCONFIG_STORE_USE_ROM
endif

ifeq ($(strip $(BOARD)),BOARD_GD32F470Z_EVAL)
	MCU=GD32F470ZK
	DEFINES+=-DCONFIG_STORE_USE_RAM
endif

ifeq ($(strip $(BOARD)),BOARD_GD32H759I_EVAL)
	MCU=GD32H759IM
	DEFINES+=-DCONFIG_STORE_USE_ROM
endif

ifeq ($(strip $(BOARD)),BOARD_BW_OPIDMX4)
	BOARD_DMX=4
	DEFINES+=-DCONFIG_STORE_USE_SPI
endif

ifeq ($(strip $(BOARD)),BOARD_DMX3)
	BOARD_DMX=3
	DEFINES+=-DCONFIG_STORE_USE_SPI
endif

ifeq ($(strip $(BOARD)),BOARD_DMX4)
	DEFINES+=-DCONFIG_STORE_USE_SPI
	BOARD_DMX=4
endif

ifdef BOARD_DMX
	ifeq ($(MCU),GD32F207RG)
	else ifeq ($(MCU),GD32F407RE)
	else
		$(error MCU is not support for BOARD_DMX)
	endif
endif

ifndef MCU
	$(error BOARD is not configured)
endif