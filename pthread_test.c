/***************************************
 * Filename: thread_test.c
 * Title: Creating/terminating threads(1)
 * Desc: 쓰레드 생성 제거 예제
 * Revision History
 * 
 ***************************************/
#include <stdio.h>
#include <pthread.h>

int thread_args[3] = { 0, 1, 2 };  /* 쓰레드가 사용할 인자 */
//-------------------------------------------------------------
/* 쓰레드로 수행할 함수 */
void* Thread( void *arg )
{
    int i;
    for ( i=0; i<3; i++ )
        printf( "thread %d: %dth iteration\n", *(int*)arg, i );
    pthread_exit(0);  /* 쓰레드 종료 함수 */
}
//-------------------------------------------------------------
int main( void )
{
    int i, clock_get;
    pthread_t threads[3]; /* 쓰레드 아이디를 위한 변수 */
    
    for ( i=0; i<3; i++ )  /* 쓰레드 생성 */
        // TODO: 스레드 생성하기
        pthread_create( &threads[i],                /* 쓰레드ID */
                        NULL,                       /* 쓰레드 속성 */
                        ( void* (*)(void*) )Thread, /* 쓰레드 시작 함수 */
                        &thread_args[i] );          /* 생성된 쓰레드에 전달 인자 */
    
    pthread_exit(0); /*메인 쓰레드 종료 */
}

/****************************************
 Run:
*****************************************
thread 0: 0th iteration
thread 0: 1th iteration
thread 0: 2th iteration
thread 1: 0th iteration
thread 1: 1th iteration
thread 1: 2th iteration
thread 2: 0th iteration
thread 2: 1th iteration
thread 2: 2th iteration

****************************************/

