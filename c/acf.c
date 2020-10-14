// Rafael Guimaraes
// 3.5.19
// gcc acf.c -o acf



#include <stdio.h>
#include <errno.h>
#include <stdbool.h>

char versao[200]	="\n\nPrograma acf.\nVersão: 0.1 - 3.mai.2019\nAutores: Leonardo Siqueira e Rafael Guimaraes\nEditar somente as linhas do inicio do programa.\nCompilar: $gcc acf.c -o acf.\nCitar paper: XXXXXX.\n";


//++++++++++++++++++++
// EDITAR SOMENTE AQUI
int nacf		= 	4;//numero de acf
int iacf		=	1;//intervalo para calculo de acf
int isave		=	10000;	//intervalo para salvar no arquivo de saida
int itela		=	100;//100;	//intervalo para imprimir na tela
int trun		=	10; //tempo max de run
int nor			=	10;//numero de origens no tempo
//ATÉ AQUI
//++++++++++++++++++++
//int ior =0;
//float dax[1000000];
//float day[1000000];
//float daz[1000000];
float acf[1000000];
float a[10];
ImprimeTela(int step, float tempo, float x, float y, float z){
     	printf("\nImprimeTela");
	printf("\n %.5f \t %.5f \t %.5f \t %.5f",  tempo, x, y, z);
	printf("\n multiplicacao %f",x*y*z);
	printf("\nPasso:%d\tACF:%f",step,acf[step]);
}

CalculaAcf(int s,float x,float y,float z){
	printf("\nCalculaACF %d",s);
//	nor++; //nor é o contador de nacf
//	ior++; //ior é a origem no tempo
//	if(nor > nacf) nor=nacf;
//	if(ior > nacf) ior=1;
//      dax[ior] = x;
//     	day[ior] = y;
//	daz[ior] = z;

	int i,j;
	
	for(i=0;i<trun;i++){
		a[0] = acf[i];
		for(j=0;j<nor;j++){ //is<nor
			acf[i+1] = acf[i+1] + a[0]*x + a[0]*y + a[0]*z;
			printf("\n i:%d j:%d a[0]: %f acf[i+1]:%.5f x:%.5f y:%.5f z:%.5f",i,j,a[0],acf[i+1],x,y,z);
			//printf("\n %f",acf[is]);		
		}
	}
}

Salva(int s){
	printf("\nSalva %d",s);
}

int main(void)
{
    Inicializa();

    int step=0;	//contador de passos
    float tempo,strxy,strxz,stryz;
    FILE *fp;

    if((fp = fopen("database.txt", "r+")) == NULL) {
        printf("Nao achei o arquivo --database.txt-- \n");
        exit(1);
    }

    while (true) {
        step++;
	int ret = fscanf(fp, "%f %f %f %f", &tempo, &strxy, &strxz, &stryz);
        if(ret == 4){
        	if(step % itela == 0){
			//ImprimeTela(step,tempo,strxy,strxz,stryz);
		}
		if(step % iacf == 0){
			CalculaAcf(step,strxy,strxz,stryz);
			printf("\nstress: %f %f %f",strxy,strxz,stryz);
		}
		if(step % isave == 0){
		//	Salva(step);
		}

	}
        else if(errno != 0) {
            perror("scanf:");
            break;
        } else if(ret == EOF) {
            break;
        } else {
            printf("No match.\n");
        }
    }
    printf("\n");
    if(feof(fp)) {
        puts("EOF");
    }
    return 0;
}

Inicializa(){
    printf("%s", versao);
    acf[1000]	= 0;
    acf[0]	= 0.00000000000000001;
}
