/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Mon Oct 27 00:34:14 2008
 */
/* Compiler settings for srvsvc.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __srvsvc_h__
#define __srvsvc_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __srvsvc_INTERFACE_DEFINED__
#define __srvsvc_INTERFACE_DEFINED__

/* interface srvsvc */
/* [auto_handle][version][uuid] */ 

void func0( void);

void func1( void);

void func2( void);

void func3( void);

void func4( void);

void func5( void);

void func6( void);

void func7( void);

void func8( void);

void func9( void);

void func0a( void);

void func0b( void);

void func0c( void);

void func0d( void);

void func0e( void);

void func0f( void);

void func10( void);

void func11( void);

void func12( void);

void func13( void);

void func14( void);

void func15( void);

void func16( void);

void func17( void);

void func18( void);

void func19( void);

void func1a( void);

void func1b( void);

void func1c( void);

void func1d( void);

void func1e( void);

void func1f( 
    /* [string][unique][in] */ wchar_t __RPC_FAR *element_607,
    /* [string][in] */ wchar_t __RPC_FAR *element_608,
    /* [size_is][out] */ unsigned char __RPC_FAR element_609[  ],
    /* [in] */ long element_610,
    /* [string][in] */ wchar_t __RPC_FAR *element_611,
    /* [out][in] */ long __RPC_FAR *element_612,
    /* [in] */ long element_613);

int func20( void);

int func21( void);

int func22( void);

int func23( 
    /* [string][unique][in] */ wchar_t __RPC_FAR *arg_1,
    /* [string][in] */ wchar_t __RPC_FAR *arg_2,
    /* [string][in] */ wchar_t __RPC_FAR *arg_3,
    /* [in] */ long arg_4,
    /* [in] */ long arg_5);



extern RPC_IF_HANDLE srvsvc_v3_0_c_ifspec;
extern RPC_IF_HANDLE srvsvc_v3_0_s_ifspec;
#endif /* __srvsvc_INTERFACE_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
