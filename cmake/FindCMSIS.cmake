IF(STM32_CHIP_TYPE OR STM32_CHIP)
    IF(NOT STM32_CHIP_DEFINE)
        IF(NOT STM32_CHIP_TYPE)
            STM32_GET_CHIP_TYPE(${STM32_CHIP} STM32_CHIP_TYPE)
            IF(NOT STM32_CHIP_TYPE)
                MESSAGE(FATAL_ERROR "Unknown chip: ${STM32_CHIP}. Try to use STM32_CHIP_TYPE and STM32_CHIP_DEFINE directly.")
            ENDIF()
        ENDIF()
        STRING(TOLOWER ${STM32_CHIP_TYPE} STM32_CHIP_TYPE_LOWER)
    ELSE()
        STRING(TOLOWER ${STM32_CHIP_DEFINE} STM32_CHIP_TYPE_LOWER)
    ENDIF()
ENDIF()

SET(CMSIS_COMMON_HEADERS
    arm_common_tables.h
    arm_const_structs.h
    arm_math.h
    core_cmFunc.h
    core_cmInstr.h
    core_cmSimd.h
)

IF(STM32_FAMILY STREQUAL "F0")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_F0_V1.7.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm0.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32f0xx.h system_stm32f0xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32f0xx.c)
ELSEIF(STM32_FAMILY STREQUAL "F1")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_F1_V1.4.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm3.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32f1xx.h system_stm32f1xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32f1xx.c)
ELSEIF(STM32_FAMILY STREQUAL "F2")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_F2_V1.4.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm3.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32f2xx.h system_stm32f2xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32f2xx.c)
ELSEIF(STM32_FAMILY STREQUAL "F3")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_F3_V1.7.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm4.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32f3xx.h system_stm32f3xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32f3xx.c)
ELSEIF(STM32_FAMILY STREQUAL "F4")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_F4_V1.14.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm4.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32f4xx.h system_stm32f4xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32f4xx.c)
ELSEIF(STM32_FAMILY STREQUAL "F7")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_F7_V1.6.1")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm7.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32f7xx.h system_stm32f7xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32f7xx.c)
ELSEIF(STM32_FAMILY STREQUAL "L0")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_L0_V1.8.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm0plus.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32l0xx.h system_stm32l0xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32l0xx.c)
ELSEIF(STM32_FAMILY STREQUAL "L1")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_L1_V1.6.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm3.h)
    LIST(APPEND CMSIS_DEVICE_HEADERS stm32l1xx.h system_stm32l1xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32l1xx.c)
ELSEIF(STM32_FAMILY STREQUAL "L4")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_L4_V1.6.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    IF(DEV_${STM32_CHIP_TYPE})
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_STARTUP} CMSIS_STARTUP_SOURCE)
        LIST(GET DEV_${STM32_CHIP_TYPE} ${DEV_TABLE_HEADER} CMSIS_DEVICE_HEADERS)
    ENDIF()
ELSEIF(STM32_FAMILY STREQUAL "L1")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_L1_V1.8.0")
        MESSAGE(WARNING "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()
    LIST(APPEND CMSIS_COMMON_HEADERS core_cm3.h)
    SET(CMSIS_DEVICE_HEADERS stm32l1xx.h system_stm32l1xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32l1xx.c)
    IF(NOT CMSIS_STARTUP_SOURCE)
        SET(CMSIS_STARTUP_SOURCE startup_stm32l${STM32_CHIP_TYPE_LOWER}.s)
    ENDIF()
ELSEIF(STM32_FAMILY STREQUAL "L4")
    IF(NOT STM32Cube_DIR)
        SET(STM32Cube_DIR "/opt/STM32Cube_FW_L4_V1.9.0")
        MESSAGE(STATUS "No STM32Cube_DIR specified, using default: " ${STM32Cube_DIR})
    ENDIF()

    LIST(APPEND CMSIS_COMMON_HEADERS core_cm4.h)
    SET(CMSIS_DEVICE_HEADERS stm32l4xx.h system_stm32l4xx.h)
    SET(CMSIS_DEVICE_SOURCES system_stm32l4xx.c) 
    IF(NOT CMSIS_STARTUP_SOURCE)
        SET(CMSIS_STARTUP_SOURCE startup_stm32l${STM32_CHIP_TYPE_LOWER}.s)
    ENDIF()   
ENDIF()

IF(NOT CMSIS_STARTUP_SOURCE)
    SET(CMSIS_STARTUP_SOURCE startup_stm32f${STM32_CHIP_TYPE_LOWER}.s)
ENDIF()

IF(NOT CMSIS_FIND_COMPONENTS)
    SET(CMSIS_FIND_COMPONENTS common_headers device_headers startup_source device_source)
    IF(NOT CMSIS_FIND_QUIETLY AND NOT ("${CMSIS_COMPONENT_NAG}" STREQUAL "${CMSIS_FIND_COMPONENTS}"))
        MESSAGE(STATUS "No CMSIS components selected, using all: ${CMSIS_FIND_COMPONENTS}")
    ENDIF()
ENDIF()
SET(CMSIS_COMPONENT_NAG "${CMSIS_FIND_COMPONENTS}" CACHE INTERNAL "Components we've nagged about." FORCE)


LIST(FIND CMSIS_FIND_COMPONENTS "common_headers" CMSIS_COMMON_HEADERS_IDX)
LIST(FIND CMSIS_FIND_COMPONENTS "device_headers" CMSIS_DEVICE_HEADERS_IDX)
LIST(FIND CMSIS_FIND_COMPONENTS "headers" CMSIS_HEADERS_IDX)
IF(NOT ${CMSIS_HEADERS_IDX} LESS 0)
    # headers implies common_headers and device_headers
    SET(CMSIS_COMMON_HEADERS_IDX 1)
    SET(CMSIS_DEVICE_HEADERS_IDX 1)
    LIST(APPEND CMSIS_FIND_COMPONENTS "common_headers" "device_headers")
ENDIF()
LIST(FIND CMSIS_FIND_COMPONENTS "startup_source" CMSIS_STARTUP_SOURCE_IDX)
LIST(FIND CMSIS_FIND_COMPONENTS "device_source" CMSIS_DEVICE_SOURCE_IDX)

set(CMSIS_REQUIRED_VARS)

SET(CMSIS_INCLUDE_DIRS)
IF(NOT ${CMSIS_COMMON_HEADERS_IDX} LESS 0)
    FIND_PATH(CMSIS_COMMON_INCLUDE_DIR ${CMSIS_COMMON_HEADERS}
        PATH_SUFFIXES include stm32${STM32_FAMILY_LOWER} cmsis
        HINTS ${STM32Cube_DIR}/Drivers/CMSIS/Include/
        CMAKE_FIND_ROOT_PATH_BOTH
    )
    LIST(APPEND CMSIS_INCLUDE_DIRS "${CMSIS_COMMON_INCLUDE_DIR}")
    IF(CMSIS_COMMON_INCLUDE_DIR)
        SET(CMSIS_common_headers_FOUND YES)
    ENDIF()
    LIST(APPEND CMSIS_REQUIRED_VARS CMSIS_COMMON_INCLUDE_DIR)
ENDIF()

IF(NOT ${CMSIS_DEVICE_HEADERS_IDX} LESS 0)
    LIST(APPEND CMSIS_REQUIRED_VARS CMSIS_DEVICE_INCLUDE_DIR)
    FIND_PATH(CMSIS_DEVICE_INCLUDE_DIR ${CMSIS_DEVICE_HEADERS}
        PATH_SUFFIXES include stm32${STM32_FAMILY_LOWER} cmsis
        HINTS ${STM32Cube_DIR}/Drivers/CMSIS/Device/ST/STM32${STM32_FAMILY}xx/Include
        CMAKE_FIND_ROOT_PATH_BOTH
    )
    LIST(APPEND CMSIS_INCLUDE_DIRS "${CMSIS_DEVICE_INCLUDE_DIR}")
    IF(CMSIS_DEVICE_INCLUDE_DIR)
        SET(CMSIS_device_headers_FOUND YES)
    ENDIF()
ENDIF()

IF(CMSIS_device_headers_FOUND AND CMSIS_common_headers_FOUND)
    SET(CMSIS_headers_FOUND YES)
ENDIF()

SET(CMSIS_SOURCES)
IF(NOT ${CMSIS_DEVICE_SOURCE_IDX} LESS 0)
    SET(CMSIS_device_source_FOUND YES)
    FOREACH(SRC ${CMSIS_DEVICE_SOURCES})
        STRING(MAKE_C_IDENTIFIER "${SRC}" SRC_CLEAN)
        SET(CMSIS_${SRC_CLEAN}_FILE SRC_FILE-NOTFOUND)
        LIST(APPEND CMSIS_REQUIRED_VARS CMSIS_${SRC_CLEAN}_FILE)
        FIND_FILE(CMSIS_${SRC_CLEAN}_FILE ${SRC}
            PATH_SUFFIXES src stm32${STM32_FAMILY_LOWER} cmsis
            HINTS ${STM32Cube_DIR}/Drivers/CMSIS/Device/ST/STM32${STM32_FAMILY}xx/Source/Templates/
            CMAKE_FIND_ROOT_PATH_BOTH
        )
        IF(NOT CMSIS_${SRC_CLEAN}_FILE)
            SET(CMSIS_device_source_FOUND NO)
        ENDIF()
        LIST(APPEND CMSIS_SOURCES ${CMSIS_${SRC_CLEAN}_FILE})
    ENDFOREACH()
ENDIF()

IF(STM32_CHIP_TYPE AND NOT ${CMSIS_STARTUP_SOURCE_IDX} LESS 0)
    LIST(APPEND CMSIS_REQUIRED_VARS CMSIS_STARTUP_SOURCE_FILE)
    SET(CMSIS_STARTUP_SOURCE_FILE SRC_FILE-NOTFOUND)
    FIND_FILE(CMSIS_STARTUP_SOURCE_FILE ${CMSIS_STARTUP_SOURCE}
        PATH_SUFFIXES src stm32${STM32_FAMILY_LOWER} cmsis
        HINTS ${CMAKE_SOURCE_DIR} ${STM32Cube_DIR}/Drivers/CMSIS/Device/ST/STM32${STM32_FAMILY}xx/Source/Templates/gcc/
        CMAKE_FIND_ROOT_PATH_BOTH
    )
    IF(CMSIS_STARTUP_SOURCE_FILE)
        SET(CMSIS_startup_source_FOUND YES)
    ENDIF()
    LIST(APPEND CMSIS_SOURCES ${CMSIS_STARTUP_SOURCE_FILE})
ENDIF()

FOREACH(HDR ${CMSIS_COMMON_HEADERS} ${CMSIS_DEVICE_HEADERS})
    SET(HDR_FILE HDR_FILE-NOTFOUND)
    FIND_FILE(HDR_FILE ${HDR}
        HINTS ${CMSIS_INCLUDE_DIRS}
        CMAKE_FIND_ROOT_PATH_BOTH
    )
    LIST(APPEND CMSIS_SOURCES ${HDR_FILE})
ENDFOREACH()

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(CMSIS
    REQUIRED_VARS ${CMSIS_REQUIRED_VARS}
    HANDLE_COMPONENTS)
