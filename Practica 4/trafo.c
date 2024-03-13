
#include "trafo.h"
#include "types.h"

//-----------------------------------------------------------------------------------
//Las funciones que se definan en ensamblador debran borrarse de este fichero
// o comentarse. De otra manera habra dos definciones de la misma funcion
//-----------------------------------------------------------------------------------

int rgb2gray(int r, int g, int b){
	int gris;
	gris = (r * 3483) + (g * 11718) + (b * 1183);
	return gris;
}

/*void RGB2GrayMatrix(pixelRGB orig[N][M], unsigned char dest[N][M]) {
    int i,j;
    
    for (i=0;i<N;i++)
        for (j=0; j<M; j++)
            dest[i][j] =  rgb2gray(orig[i][j].R, orig[i][j].G, orig[i][j].B);
    
}*/


void Gray2BinaryMatrix(unsigned char orig[N][M], unsigned char dest[N][M]) {
    int i,j;
    int umbral = 127;
    
    for (i=0;i<N;i++)
        for (j=0; j<M; j++)
            if (orig[i][j] > umbral)
                dest[i][j]=255;
            else
                 dest[i][j]=0;
    
}



void contarBlancos(unsigned char mat[N][M], unsigned char vector[N]) {
    int i,j;

    for (i=0;i<N;i++) {
        vector[i]=0;
        for (j=0; j<M; j++) {
            if ( mat[i][j] == 1) vector[i]++;
        }
    }
}
