#include <iostream>
#include <stdlib.h>

int n_especies, n_molec, n_atomos, n_at_por_molec ;

void read(){
	std::ifstream inputData("file.dat");
	std::string line;

	while(getline(inputFile, line)){
		if(!line.length() || line[0] == '#')
		continue;
		std::istringstream iss(line);
		double x=0., y=0.;
		iss>>x>>y;
		ste::cout<<x<<' '<<y<<std::endl;
	}	

}


int main(int argc, char** argv){
	std::cout << " \n Argumentos: moleculas atomos nome \n\n";
	std::cout << "n argumentos: " << argc;

	for (int i=0;i<argc;i++){
		std::cout << argv[i+1] << " \n";
	}

	//int N=0;
	for(int i=0;i<argc-3;i++){
		n_molec[i] = atoi(argv[i+2]);
		n_at_por_molec[i]  = atoi(argv[i+3]);
		n_atomos += n_molec[i] * n_at_por_molec[i];
		n_especies = argc-3;
	}
	std::cout << "\ntotal de atomos (N): " << N << "\n\n" ;
	return(0);

int escreve(){
	int k=0;
	for(int i=0;i<n_atomos;i++){
		aux=1;
		if(i>isp	



	}
}

}
