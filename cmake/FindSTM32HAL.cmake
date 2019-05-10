IF(STM32_FAMILY STREQUAL "F0")
    SET(HAL_COMPONENTS adc can cec comp cortex crc crs dac dma exti flash gpio
                       i2c i2s irda iwdg pcd pwr rcc rtc smartcard smbus spi
                       tim tsc uart usart utils wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc crc dac flash i2c pcd pwr rcc rtc smartcard spi
                          tim uart)

    SET(HAL_PREFIX stm32f0xx_)

ELSEIF(STM32_FAMILY STREQUAL "F1")
    SET(HAL_COMPONENTS adc can cec cortex crc dac dma eth flash fsmc gpio hcd
                       i2c i2s irda iwdg nand nor pccard pcd pwr rcc rtc sd
                       sdmmc smartcard spi sram tim uart usart usb wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc dac flash gpio pcd rcc rtc spi tim)

    SET(HAL_PREFIX stm32f1xx_)

ELSEIF(STM32_FAMILY STREQUAL "F2")
    SET(HAL_COMPONENTS adc can cortex crc cryp dac dcmi dma eth flash fsmc gpio
                       hash hcd i2c i2s irda iwdg nand nor pccard pcd pwr rcc
                       rng rtc sd sdmmc smartcard spi sram tim uart usart usb
                       wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc dac dma flash pcd pwr rcc rtc tim)

    SET(HAL_PREFIX stm32f2xx_)

ELSEIF(STM32_FAMILY STREQUAL "F3")
    SET(HAL_COMPONENTS adc can cec comp cortex crc dac dma exti flash fmc gpio
                       hrtim i2c i2s irda iwdg nand nor opamp pccard pcd pwr
                       rcc rtc sdadc smartcard smbus spi sram tim tsc uart
                       usart utils wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc crc dac flash i2c i2s opamp pcd pwr rcc rtc
                          smartcard spi tim uart)

    # Components that have ll_ in names instead of hal_
    SET(HAL_LL_COMPONENTS exti fmc utils)

    SET(HAL_PREFIX stm32f3xx_)

ELSEIF(STM32_FAMILY STREQUAL "F4")
    SET(HAL_COMPONENTS adc can cec cortex crc cryp dac dcmi dfsdm dma dma2d dsi
                       eth flash flash_ramfunc fmc fmpi2c fsmc gpio hash hcd
                       i2c i2s irda iwdg lptim ltdc nand nor pccard pcd pwr
                       qspi rcc rng rtc sai sd sdmmc sdram smartcard spdifrx
                       spi sram tim uart usart usb wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc cryp dac dcmi dma flash fmpi2c hash i2c i2s ltdc
                          pcd pwr rcc rtc sai tim)

    SET(HAL_PREFIX stm32f4xx_)

ELSEIF(STM32_FAMILY STREQUAL "F7")
    SET(HAL_COMPONENTS adc can cec cortex crc cryp dac dcmi dfsdm dma dma2d dsi
                       eth exti flash fmc gpio hash hcd i2c i2s irda iwdg jpeg
                       lptim ltdc mdios mmc nand nor pcd pwr qspi rcc rng rtc
                       sai sd sdmmc sdram smartcard smbus spdifrx spi sram tim
                       uart usart usb utils wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc crc cryp dac dcmi dma flash hash i2c ltdc pcd pwr
                          rcc rtc sai smartcard tim)

    SET(HAL_PREFIX stm32f7xx_)

ELSEIF(STM32_FAMILY STREQUAL "L0")
    SET(HAL_COMPONENTS adc comp cortex crc crs cryp dac dma exti firewall flash
                       flash_ramfunc gpio i2c i2s irda iwdg lcd lptim lpuart
                       pcd pwr rcc rng rtc smartcard smbus spi tim tsc uart
                       usart utils wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc comp crc cryp dac flash i2c pcd pwr rcc rtc
                          smartcard tim uart)

    SET(HAL_PREFIX stm32l0xx_)
ELSEIF(STM32_FAMILY STREQUAL "L1")
    SET(HAL_COMPONENTS adc comp cortex crc cryp dac dma flash flash_ramfunc
					   gpio i2c i2s irda iwdg lcd nor opamp pcd pwr rcc rtc
					   sd smartcard spi sram tim uart usart wwdg)
    SET(HAL_REQUIRED_COMPONENTS cortex pwr)
    
    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc cryp dac flash opamp pcd pwr rcc rtc spi tim)
    # Components that have ll_ in names instead of hal_

    SET(HAL_PREFIX stm32l1xx_)
ELSEIF(STM32_FAMILY STREQUAL "L4")
    SET(HAL_COMPONENTS adc can comp cortex crc cryp dac dcmi dfsdm dma dma2d dsi 
                       firewall flash flash_ramfunc gfxmmu gpio hash hcd i2c irda iwdg
                       lcd lptim ltdc nand nor opamp ospi pcd pwr qspi rcc rng rtc sai
                       sd smartcard smbus spi sram swpmi tim tsc uart usart wwdg)

    SET(HAL_REQUIRED_COMPONENTS cortex pwr rcc)

    # Components that have _ex sources
    SET(HAL_EX_COMPONENTS adc crc cryp dac dfsdm dma flash hash i2c ltdc 
                          opamp pcd pwr rcc rtc sai sd smartcard spi tim uart usart)
                          
    SET(HAL_PREFIX stm32l4xx_)

ENDIF()

SET(HAL_HEADERS
	${HAL_PREFIX}hal.h
	${HAL_PREFIX}hal_def.h
)

SET(HAL_SRCS
	${HAL_PREFIX}hal.c
)
IF(NOT STM32HAL_FIND_COMPONENTS)
    SET(STM32HAL_FIND_COMPONENTS ${HAL_COMPONENTS})
    MESSAGE(STATUS "No STM32HAL components selected, using all: ${STM32HAL_FIND_COMPONENTS}")
ENDIF()

FOREACH(cmp ${HAL_REQUIRED_COMPONENTS})
    LIST(FIND STM32HAL_FIND_COMPONENTS ${cmp} STM32HAL_FOUND_INDEX)
    IF(${STM32HAL_FOUND_INDEX} LESS 0)
        LIST(APPEND STM32HAL_FIND_COMPONENTS ${cmp})
    ENDIF()
ENDFOREACH()

FOREACH(cmp ${STM32HAL_FIND_COMPONENTS})
    LIST(FIND HAL_COMPONENTS ${cmp} STM32HAL_FOUND_INDEX)
    IF(${STM32HAL_FOUND_INDEX} LESS 0)
        MESSAGE(FATAL_ERROR "Unknown STM32HAL component: ${cmp}. Available components: ${HAL_COMPONENTS}")
	ELSE()
        LIST(APPEND HAL_HEADERS ${HAL_PREFIX}hal_${cmp}.h)
        LIST(APPEND HAL_SRCS ${HAL_PREFIX}hal_${cmp}.c)
    ENDIF()
    LIST(FIND HAL_EX_COMPONENTS ${cmp} STM32HAL_FOUND_INDEX)
    IF(NOT (${STM32HAL_FOUND_INDEX} LESS 0))
        LIST(APPEND HAL_HEADERS ${HAL_PREFIX}hal_${cmp}_ex.h)
        LIST(APPEND HAL_SRCS ${HAL_PREFIX}hal_${cmp}_ex.c)
    ENDIF()
ENDFOREACH()

LIST(REMOVE_DUPLICATES HAL_HEADERS)
LIST(REMOVE_DUPLICATES HAL_SRCS)

STRING(TOLOWER ${STM32_FAMILY} STM32_FAMILY_LOWER)

FIND_PATH(STM32HAL_INCLUDE_DIR ${HAL_HEADERS}
    PATH_SUFFIXES include stm32${STM32_FAMILY_LOWER}
    HINTS ${STM32Cube_DIR}/Drivers/STM32${STM32_FAMILY}xx_HAL_Driver/Inc
    CMAKE_FIND_ROOT_PATH_BOTH
)

FOREACH(HAL_SRC ${HAL_SRCS})
    STRING(MAKE_C_IDENTIFIER "${HAL_SRC}" HAL_SRC_CLEAN)
    SET(HAL_${HAL_SRC_CLEAN}_FILE HAL_SRC_FILE-NOTFOUND)
    FIND_FILE(HAL_${HAL_SRC_CLEAN}_FILE ${HAL_SRC}
        PATH_SUFFIXES src stm32${STM32_FAMILY_LOWER}
        HINTS ${STM32Cube_DIR}/Drivers/STM32${STM32_FAMILY}xx_HAL_Driver/Src
        CMAKE_FIND_ROOT_PATH_BOTH
    )
    LIST(APPEND STM32HAL_SOURCES ${HAL_${HAL_SRC_CLEAN}_FILE})
ENDFOREACH()

FOREACH(HDR ${HAL_HEADERS})
    SET(HDR_FILE HDR_FILE-NOTFOUND)
    FIND_FILE(HDR_FILE ${HDR}
        HINTS ${STM32HAL_INCLUDE_DIR}
        CMAKE_FIND_ROOT_PATH_BOTH
    )
    LIST(APPEND STM32HAL_SOURCES ${HDR_FILE})
ENDFOREACH()

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(STM32HAL DEFAULT_MSG STM32HAL_INCLUDE_DIR STM32HAL_SOURCES)
