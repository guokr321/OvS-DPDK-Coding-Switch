#include <stdio.h>
#include <string.h>
#include "PCIE.h"

#if defined(__GNUC__)
#include <dlfcn.h> // dlopen/dlclsoe for linxu
#include <stdbool.h>
#else
#include <windows.h>
#define dlopen(x,y) LoadLibrary(x)
#define dlclose     FreeLibrary
#define dlsym       GetProcAddress
#define dlerror()   "LoadLibrary failed"
#define false 0
#define true 1

#endif //

LPPCIE_Open PCIE_Open;
LPPCIE_Close PCIE_Close;
LPPCIE_Read32 PCIE_Read32;
LPPCIE_Write32 PCIE_Write32;
LPPCIE_Read8 PCIE_Read8;
LPPCIE_Write8 PCIE_Write8;
LPPCIE_DmaWrite PCIE_DmaWrite;
LPPCIE_DmaRead PCIE_DmaRead;
LPPCIE_ConfigRead32 PCIE_ConfigRead32;

void QueryModualName(char szName[])
{
#if defined(__GNUC__)
	strcpy(szName, "./terasic_pcie_msgdma.so"); // linux libary
#else
	// windows
	//check OS
	bool bIsWow64 = false;
	typedef bool (WINAPI *LPFN_ISWOW64PROCESS) (HANDLE, bool*);
	LPFN_ISWOW64PROCESS fnIsWow64Process;

	fnIsWow64Process = (LPFN_ISWOW64PROCESS) GetProcAddress(GetModuleHandle("kernel32"), "IsWow64Process");
	if (NULL != fnIsWow64Process) {
		fnIsWow64Process(GetCurrentProcess(), &bIsWow64);
	}

	if (bIsWow64) {
		strcpy(szName, "TERASIC_PCIE_mSDGMA32.DLL"); // 32-bits dll, not support yet
	} else {
		strcpy(szName, "TERASIC_PCIE_mSGDMA.dll"); // 64-bits dll
	}

#endif
}

void *PCIE_Load(void)
{

	bool bSuccess = true;
	void *lib_handle;
	char szName[256];

	QueryModualName(szName);

	lib_handle = dlopen(szName, RTLD_NOW);
	if (!lib_handle) {
		printf("Load %s error: %s\r\n", szName, dlerror());
		bSuccess = false;
	}

	if (bSuccess) {
		PCIE_Open = (LPPCIE_Open) dlsym(lib_handle, "PCIE_Open");
		PCIE_Close = (LPPCIE_Close) dlsym(lib_handle, "PCIE_Close");
		PCIE_Read32 = (LPPCIE_Read32) dlsym(lib_handle, "PCIE_Read32");
		PCIE_Write32 = (LPPCIE_Write32) dlsym(lib_handle, "PCIE_Write32");
		PCIE_Read8 = (LPPCIE_Read8) dlsym(lib_handle, "PCIE_Read8");
		PCIE_Write8 = (LPPCIE_Write8) dlsym(lib_handle, "PCIE_Write8");
		PCIE_DmaWrite = (LPPCIE_DmaWrite) dlsym(lib_handle, "PCIE_DmaWrite");
		PCIE_DmaRead = (LPPCIE_DmaRead) dlsym(lib_handle, "PCIE_DmaRead");
		PCIE_ConfigRead32 = (LPPCIE_ConfigRead32) dlsym(lib_handle, "PCIE_ConfigRead32");
		if (!PCIE_Open || !PCIE_Close ||
			!PCIE_Read32 || !PCIE_Write32 ||
			!PCIE_Read8 || !PCIE_Write8 ||
			!PCIE_DmaWrite || !PCIE_DmaRead || !PCIE_ConfigRead32
		)
			bSuccess = false;

		if (!bSuccess) {
			dlclose(lib_handle);
			lib_handle = 0;
		}
	}

	return lib_handle;
}

void PCIE_Unload(void *lib_handle)
{
	dlclose(lib_handle);
}

