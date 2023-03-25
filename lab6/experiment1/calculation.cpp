#include <iostream>
#include <cmath>
using namespace std;
// sum 0, +inf    (n^2 * x^4n) / (n + 5) 
double getValue(double point, int n){
    double v = 1;
    for(int i = 0; i <= n;i++){
        v *= 0.5;
    }
    return n * n * pow(point, 4 * n) / (n + 5);
}

int main(int argc, char ** argv){
    if(argc != 3){
        return 0;
    }
    int N = stoi(argv[1]);
    double point = stod(argv[2]);
    double result = 0;
    for(int i = 0; i <= N;i++){
        result += getValue(point, i);
    }
    cout << result << endl;
}
