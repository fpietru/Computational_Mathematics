#include <iostream>
#include <vector>
#include <cmath>
#include <assert.h>
#include <stdlib.h>

using namespace std;

void print(const vector<vector<double>>& A) {
  int n = A.size();
  int m = A[0].size();
  for (int i=0; i<n; i++) {
    for (int j=0; j<m; j++) {
      cout << A[i][j] << " ";
    }
    cout << "\n";
  }
}

int LU(vector<vector<double>>& A, vector<int>& P, double eps=1e-14) {
  int n = A.size();
  for (int i=0; i<n; i++) {
    P[i] = i;
  }
  for (int i=0; i<n; i++) {
    double mxAbs = 0.0;
    int mxPos = i;
    for (int j=i; j<n; j++) {
      double absVal = fabs(A[j][i]);
      if (absVal > mxAbs) {
        mxAbs = absVal;
        mxPos = j;
      }
    }
    if (mxAbs < eps) {
      return 1; // A is singular matrix
    }
    if (mxPos != i) {
      swap(A[i], A[mxPos]);
      swap(P[i], P[mxPos]);
    }
    for (int j=i+1; j<n; j++) {
      A[j][i] /= A[i][i];
      for (int k=i+1; k<n; k++) {
        A[j][k] -= A[j][i] * A[i][k];
      }
    }
  }
  return 0;
}

int main () {
  ios_base::sync_with_stdio(0);
  cin.tie(0), cout.tie(0);

  int n; cin >> n;
  vector<int> P(n);
  vector<vector<double>> A(n,vector<double>(n));
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      cin >> A[i][j];
    }
  }

  LU(A, P);
  print(A); 

  return 0;
}