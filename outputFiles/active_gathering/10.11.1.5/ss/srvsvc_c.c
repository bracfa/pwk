/* this ALWAYS GENERATED file contains the RPC client stubs */


/* File created by MIDL compiler version 5.01.0164 */
/* at Mon Oct 27 00:34:14 2008
 */
/* Compiler settings for srvsvc.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )

#include <string.h>
#if defined( _ALPHA_ )
#include <stdarg.h>
#endif

#include "srvsvc.h"

#define TYPE_FORMAT_STRING_SIZE   25                                
#define PROC_FORMAT_STRING_SIZE   49                                

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;

/* Standard interface: srvsvc, ver. 3.0,
   GUID={0x4b324fc8,0x1670,0x01d3,{0x12,0x78,0x5a,0x47,0xbf,0x6e,0xe1,0x88}} */



static const RPC_CLIENT_INTERFACE srvsvc___RpcClientInterface =
    {
    sizeof(RPC_CLIENT_INTERFACE),
    {{0x4b324fc8,0x1670,0x01d3,{0x12,0x78,0x5a,0x47,0xbf,0x6e,0xe1,0x88}},{3,0}},
    {{0x8A885D04,0x1CEB,0x11C9,{0x9F,0xE8,0x08,0x00,0x2B,0x10,0x48,0x60}},{2,0}},
    0,
    0,
    0,
    0,
    0,
    0
    };
RPC_IF_HANDLE srvsvc_v3_0_c_ifspec = (RPC_IF_HANDLE)& srvsvc___RpcClientInterface;

extern const MIDL_STUB_DESC srvsvc_StubDesc;

static RPC_BINDING_HANDLE srvsvc__MIDL_AutoBindHandle;


void func0( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          0);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          1);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func2( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          2);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func3( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          3);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func4( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          4);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func5( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          5);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func6( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          6);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func7( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          7);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func8( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          8);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func9( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          9);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func0a( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          10);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func0b( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          11);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func0c( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          12);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func0d( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          13);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func0e( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          14);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func0f( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          15);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func10( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          16);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func11( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          17);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func12( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          18);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func13( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          19);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func14( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          20);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func15( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          21);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func16( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          22);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func17( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          23);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func18( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          24);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func19( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          25);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1a( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          26);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1b( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          27);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1c( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          28);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1d( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          29);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1e( void)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          30);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


void func1f( 
    /* [string][unique][in] */ wchar_t __RPC_FAR *element_607,
    /* [string][in] */ wchar_t __RPC_FAR *element_608,
    /* [size_is][out] */ unsigned char __RPC_FAR element_609[  ],
    /* [in] */ long element_610,
    /* [string][in] */ wchar_t __RPC_FAR *element_611,
    /* [out][in] */ long __RPC_FAR *element_612,
    /* [in] */ long element_613)
{

    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(!element_608)
        {
        RpcRaiseException(RPC_X_NULL_REF_POINTER);
        }
    if(!element_611)
        {
        RpcRaiseException(RPC_X_NULL_REF_POINTER);
        }
    if(!element_612)
        {
        RpcRaiseException(RPC_X_NULL_REF_POINTER);
        }
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          31);
        
        
        
        _StubMsg.BufferLength = 16U + 14U + 10U + 14U + 10U + 7U;
        NdrPointerBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                              (unsigned char __RPC_FAR *)element_607,
                              (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[2] );
        
        NdrConformantStringBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)element_608,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        NdrConformantStringBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)element_611,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrPointerMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                            (unsigned char __RPC_FAR *)element_607,
                            (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[2] );
        
        NdrConformantStringMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)element_608,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( long __RPC_FAR * )_StubMsg.Buffer)++ = element_610;
        
        NdrConformantStringMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)element_611,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( long __RPC_FAR * )_StubMsg.Buffer)++ = *element_612;
        
        *(( long __RPC_FAR * )_StubMsg.Buffer)++ = element_613;
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[2] );
        
        NdrConformantArrayUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR * __RPC_FAR *)&element_609,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[10],
                                      (unsigned char)0 );
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *element_612 = *(( long __RPC_FAR * )_StubMsg.Buffer)++;
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
}


int func20( void)
{

    int _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          32);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[28] );
        
        _RetVal = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
    return _RetVal;
}


int func21( void)
{

    int _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          33);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[28] );
        
        _RetVal = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
    return _RetVal;
}


int func22( void)
{

    int _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          34);
        
        
        
        _StubMsg.BufferLength = 0U;
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[28] );
        
        _RetVal = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
    return _RetVal;
}


int func23( 
    /* [string][unique][in] */ wchar_t __RPC_FAR *arg_1,
    /* [string][in] */ wchar_t __RPC_FAR *arg_2,
    /* [string][in] */ wchar_t __RPC_FAR *arg_3,
    /* [in] */ long arg_4,
    /* [in] */ long arg_5)
{

    int _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(!arg_2)
        {
        RpcRaiseException(RPC_X_NULL_REF_POINTER);
        }
    if(!arg_3)
        {
        RpcRaiseException(RPC_X_NULL_REF_POINTER);
        }
    RpcTryFinally
        {
        NdrClientInitializeNew(
                          ( PRPC_MESSAGE  )&_RpcMessage,
                          ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                          ( PMIDL_STUB_DESC  )&srvsvc_StubDesc,
                          35);
        
        
        
        _StubMsg.BufferLength = 16U + 14U + 14U + 10U + 7U;
        NdrPointerBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                              (unsigned char __RPC_FAR *)arg_1,
                              (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[2] );
        
        NdrConformantStringBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)arg_2,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        NdrConformantStringBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)arg_3,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        NdrNsGetBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg, _StubMsg.BufferLength, srvsvc__MIDL_AutoBindHandle );
        
        NdrPointerMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                            (unsigned char __RPC_FAR *)arg_1,
                            (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[2] );
        
        NdrConformantStringMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)arg_2,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        NdrConformantStringMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)arg_3,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[8] );
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( long __RPC_FAR * )_StubMsg.Buffer)++ = arg_4;
        
        *(( long __RPC_FAR * )_StubMsg.Buffer)++ = arg_5;
        
        NdrNsSendReceive( (PMIDL_STUB_MESSAGE) &_StubMsg, (unsigned char __RPC_FAR *) _StubMsg.Buffer, (RPC_BINDING_HANDLE __RPC_FAR *) &srvsvc__MIDL_AutoBindHandle );
        
        if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[30] );
        
        _RetVal = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        }
    RpcFinally
        {
        NdrFreeBuffer( (PMIDL_STUB_MESSAGE) &_StubMsg );
        
        }
    RpcEndFinally
    
    return _RetVal;
}


static const MIDL_STUB_DESC srvsvc_StubDesc = 
    {
    (void __RPC_FAR *)& srvsvc___RpcClientInterface,
    MIDL_user_allocate,
    MIDL_user_free,
    &srvsvc__MIDL_AutoBindHandle,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x10001, /* Ndr library version */
    0,
    0x50100a4, /* MIDL Version 5.1.164 */
    0,
    0,
    0,  /* notify & notify_flag routine table */
    1,  /* Flags */
    0,  /* Reserved3 */
    0,  /* Reserved4 */
    0   /* Reserved5 */
    };

#if !defined(__RPC_WIN32__)
#error  Invalid build platform for this stub.
#endif

static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {
			0x5b,		/* FC_END */
			0x5c,		/* FC_PAD */
/*  2 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/*  4 */	NdrFcShort( 0x2 ),	/* Type Offset=2 */
/*  6 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/*  8 */	NdrFcShort( 0x6 ),	/* Type Offset=6 */
/* 10 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 12 */	NdrFcShort( 0xa ),	/* Type Offset=10 */
/* 14 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 16 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 18 */	NdrFcShort( 0x6 ),	/* Type Offset=6 */
/* 20 */	
			0x50,		/* FC_IN_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 22 */	NdrFcShort( 0x14 ),	/* Type Offset=20 */
/* 24 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 26 */	0x5b,		/* FC_END */
			0x5c,		/* FC_PAD */
/* 28 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 30 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 32 */	NdrFcShort( 0x2 ),	/* Type Offset=2 */
/* 34 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 36 */	NdrFcShort( 0x6 ),	/* Type Offset=6 */
/* 38 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 40 */	NdrFcShort( 0x6 ),	/* Type Offset=6 */
/* 42 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 44 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 46 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/*  4 */	
			0x25,		/* FC_C_WSTRING */
			0x5c,		/* FC_PAD */
/*  6 */	
			0x11, 0x8,	/* FC_RP [simple_pointer] */
/*  8 */	
			0x25,		/* FC_C_WSTRING */
			0x5c,		/* FC_PAD */
/* 10 */	
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 12 */	NdrFcShort( 0x1 ),	/* 1 */
/* 14 */	0x28,		/* Corr desc:  parameter, FC_LONG */
			0x0,		/*  */
#ifndef _ALPHA_
/* 16 */	NdrFcShort( 0xc ),	/* x86, MIPS, PPC Stack size/offset = 12 */
#else
			NdrFcShort( 0x18 ),	/* Alpha Stack size/offset = 24 */
#endif
/* 18 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 20 */	
			0x11, 0x8,	/* FC_RP [simple_pointer] */
/* 22 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */

			0x0
        }
    };
