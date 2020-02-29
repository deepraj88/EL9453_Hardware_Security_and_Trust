#include<iostream>
#include<fstream>
#include <stdio.h>
#include <stdlib.h>
#include <sstream>
#include <windows.h>
#include <tchar.h>
#include <assert.h>
#include "stdafx.h"
#include <stdint.h>
#include <inttypes.h>
#include <string>
#include <vector>
#include <iostream>
#include <iomanip>
#include <unistd.h>


    using namespace std;

    HANDLE hComm;  // Handle to the Serial port
    BOOL   Status; // Status
    DCB dcbSerialParams = { 0 };  // Initializing DCB structure
    COMMTIMEOUTS timeouts = { 0 };  //Initializing timeouts structure
    uint8_t* SerialBuffer; //Buffer to send and receive data
    DWORD BytesWritten = 0;
    int NumberOfBytes = 0;         // No of bytes written to the port
    DWORD dwEventMask;     // Event mask to trigger
    char  *ReadData;        //temperory Character
    DWORD NoBytesRead;     // Bytes read by ReadFile()
    unsigned char loop = 0;
    int i=0;
    int bbk;
    int bufferSize = 0;
    wchar_t PortNo[20] = { 0 }; //contain friendly name
    //TCHAR *pcCommPort = TEXT("COM4");
    uint8_t *input;
    uint8_t *key;
    uint8_t *run;
    uint8_t *output;
    uint8_t *output_value;
    uint8_t* dwSize;
    FILE *fptr;





void write_to_serial(uint8_t* send, int number_of_bytes,uint8_t* dwSize, int flag_for_output)
{
        //sleep(2);
        std::stringbuf sb;
        DWORD dwEventMask;
        char szBuf;
        DWORD dwIncommingReadSize;

        Status = WriteFile(hComm,// Handle to the Serialport
        send,            // Data to be written to the port
        number_of_bytes,   // No of bytes to write into the port
        &BytesWritten,  // No of bytes written to the port
        NULL);

        if (Status == FALSE)
        {
            printf("\nFail to Write");
            CloseHandle(hComm);//Closing the Serial Port
            system("pause");
        }

        //READ Data;
        Status = SetCommMask(hComm, EV_RXCHAR);
        if(Status == FALSE)
        {
            printf("\nFail here\n");
            CloseHandle(hComm);//Closing the Serial Port
        }
        Status = WaitCommEvent(hComm, &dwEventMask, NULL); //Wait for the character to be received
        if(Status == TRUE)
        {
            do
            {
                if(ReadFile(hComm, &szBuf, 1, &dwIncommingReadSize, NULL) != 0)
                {
                    if(dwIncommingReadSize > 0)
                    {
                        bufferSize += dwIncommingReadSize;
                        sb.sputn(&szBuf, dwIncommingReadSize);
                    }
                }
                else
                {
                    printf("\nFail to readfile");
                    CloseHandle(hComm);//Closing the Serial Port
                    system("pause");
                    //Handle Error Condition
                }

            } while(dwIncommingReadSize > 0);
        }

        else
        {
                printf("\nFail to waitcommevnt");
                CloseHandle(hComm);//Closing the Serial Port
                system("pause");
            //Handle Error Condition
        }
        //cout<<"the buffer size is : "<<bufferSize<<endl;
        string ssd = sb.str();
        dwSize = (uint8_t*)calloc(bufferSize,sizeof(uint8_t));
        for(i=0;i<bufferSize;i++)
        {
            dwSize[i] = ssd[i];
        }
        //cout<<endl;
        if(flag_for_output == 2){/*for(i=0;i<16;i++)printf("%c",dwSize[i]);*/for(i=16;i<(bufferSize-15);i++)printf("%02x ",dwSize[(i+3)%32]);}
        //else for(i=0;i<bufferSize;i++)printf("%c",dwSize[i]);
}

uint8_t hextodecimal(char decide)
{
    switch(decide)
    {
        case '0':return(0x00);break;
        case '1':return(0x01);break;
        case '2':return(0x02);break;
        case '3':return(0x03);break;
        case '4':return(0x04);break;
        case '5':return(0x05);break;
        case '6':return(0x06);break;
        case '7':return(0x07);break;
        case '8':return(0x08);break;
        case '9':return(0x09);break;
        case 'a':return(0x0a);break;
        case 'b':return(0x0b);break;
        case 'c':return(0x0c);break;
        case 'd':return(0x0d);break;
        case 'e':return(0x0e);break;
        case 'f':return(0x0f);break;
    }

}

int main( int argc,_TCHAR* argv[])
{
    input = (uint8_t*)calloc(2,sizeof(uint8_t));
    key = (uint8_t*)calloc(2,sizeof(uint8_t));
    run = (uint8_t*)calloc(2,sizeof(uint8_t));
    output = (uint8_t*)calloc(2,sizeof(uint8_t));

    input[0] = 0x11;
    input[1] = 0x11;

    key[0] = 0x22;
    key[1] = 0x22;

    run[0] = 0x33;
    run[1] = 0x33;

    output[0] = 0x44;
    output[1] = 0x44;

    ifstream input_file;
    input_file.open("input.hex");
    if(!input_file.is_open()){ perror("\nInput file not found!!"); return(0);}

    int i = 0, j=0, flag = 0;
    string temp;
    uint8_t input_value[17];
    uint8_t key_value[177];
    stringstream ss;
    string tpp;
    uint8_t tt,pp,jj;
    uint8_t cct = 0x10;
    while(!input_file.eof())
    {
        temp.erase(temp.begin(),temp.end());
        getline(input_file,temp,' ');
        //cout<<temp[0]<<endl;
        //ss<<hex<<setw(2)<<setfill('0')<<temp;
        if(i>=0 && i<16)
        {
             tt = hextodecimal(temp[0]);
             pp = hextodecimal(temp[1]);
             jj = ((tt*cct) + (pp));
             input_value[i] = jj;
             jj = 0;
        }
        if(i>=16 && i<192)
        {
             tt = hextodecimal(temp[0]);
             pp = hextodecimal(temp[1]);
             jj = ((tt*cct) + (pp));
             key_value[j] = jj;
             jj = 0;
             j++;
        }
        i++;
    }
    input_file.close();


    //Open the serial com port
    hComm = CreateFile(argv[1], //friendly name
                       GENERIC_READ | GENERIC_WRITE,      // Read/Write Access
                       0,                                 // No Sharing, ports cant be shared
                       NULL,                              // No Security
                       OPEN_EXISTING,                     // Open existing port only
                       0,                                 // Non Overlapped I/O
                       NULL);                             // Null for Comm Devices
    if (hComm == INVALID_HANDLE_VALUE)
    {
        printf("\n Port can't be opened\n\n");
        system("pause");
        return 0;
    }

    //CONFIGURATIONS
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
    Status = GetCommState(hComm, &dcbSerialParams); //retreives  the current settings
    if (Status == FALSE)
    {
        printf("\nError to Get the Com state\n\n");
        CloseHandle(hComm);//Closing the Serial Port
        system("pause");
        return 0;
    }
    dcbSerialParams.BaudRate = CBR_115200;      //BaudRate = 115200
    dcbSerialParams.ByteSize = 8;             //ByteSize = 8
    dcbSerialParams.StopBits = ONESTOPBIT;    //StopBits = 1
    dcbSerialParams.Parity = NOPARITY;      //Parity = None
    dcbSerialParams.fBinary = TRUE;
    dcbSerialParams.fParity = TRUE;
    Status = SetCommState(hComm, &dcbSerialParams);

    if (Status == FALSE)
    {
        printf("\nError to Setting DCB Structure\n\n");
        CloseHandle(hComm);//Closing the Serial Port
        system("pause");
        return 0;
    }


    if(GetCommTimeouts(hComm, &timeouts))
    {
        timeouts.ReadIntervalTimeout=1;
        timeouts.ReadTotalTimeoutConstant=1;
        timeouts.ReadTotalTimeoutMultiplier=1;
        timeouts.WriteTotalTimeoutConstant=1;
        timeouts.WriteTotalTimeoutMultiplier=1;
    }

    else
    {
        printf("\nError to GetComm Timeouts\n\n");
        CloseHandle(hComm);//Closing the Serial Port
        system("pause");
        return 0;
    }

    if(!SetCommTimeouts(hComm, &timeouts))
    {
        printf("\nError in Setting Comm Timeouts\n\n");
        CloseHandle(hComm);//Closing the Serial Port
        system("pause");
        return 0;
    }
    write_to_serial(input,2,dwSize, flag);free(dwSize);bufferSize=0;
    //for(i=0;i<2;i++)printf("%02x ",input[i]);
    write_to_serial(input_value,16,dwSize, flag);free(dwSize);bufferSize=0;
    //for(i=0;i<16;i++)printf("%02x ",input_value[i]);

    write_to_serial(key,2,dwSize, flag);free(dwSize);bufferSize=0;
    //for(i=0;i<2;i++)printf("%02x ",key[i]);
    write_to_serial(key_value,176,dwSize, flag);free(dwSize);bufferSize=0;
    //for(i=0;i<176;i++)printf("%02x ",key_value[i]);
    write_to_serial(run,2,dwSize, flag);free(dwSize);bufferSize=0;
    //cout<<"running the Algorithm...";
    flag = 2;
    write_to_serial(output,2,dwSize, flag);
    free(dwSize);bufferSize=0;
    free(SerialBuffer);
    CloseHandle(hComm);//Closing the Serial Port
    //system("pause");
    return(1);
}
