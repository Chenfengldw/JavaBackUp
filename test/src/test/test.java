package test;

/**
 * Created by Administrator on 2016/4/24.
 */
public class test {



    public int totalNQueens(int n) {
        int [][] arr = new int[n][n];
        return totalNQueens(arr,n);
    }

    public int totalNQueens(int [][] arr,int n){
        if(n==1){
            int result = 0;
            for(int i=0;i<n;++i){
                for(int j=0;j<n;++j){
                    if(arr[i][j]==0)result++;
                }
            }
            return result;
        }

        int result = 0;
        for(int i=0;i<n;++i){
            for(int j=0;j<n;++j){
                if(arr[i][j]==0){
                    set(arr,i,j,n,1);
                    result+=totalNQueens(arr,n-1);
                    set(arr,i,j,n,0);
                }
            }
        }
        return result;
    }

    public void set(int [][] arr,int i,int j,int n,int val){
        for(int ii=0;ii<n;++ii)arr[ii][j]=val;
        for(int ii=0;ii<n;++ii)arr[i][ii]=val;

        int a=i,b=j;
        while(a<n&&b<n){
            arr[a][b]=val;
            a++;
            b++;
        }
        a=i;b=j;
        while(a>=0&&b>=0){
            arr[a][b]=val;
            a--;
            b--;
        }
    }


    public static void main(String args[]){
        test t = new test();
        System.out.println(t.totalNQueens(8));
    }
}
