class Program{
    static int Main(){
        int count = 1;
        int i;
        int j;
        byte is_prime;
        int square;

        for (i=3;i<50000000;i+=2){
            is_prime = 1;
            square = (int)System.Math.Sqrt(i);
            for (j = 3; j<=square; j+=2){
                if (i%j==0){
                    is_prime = 0;
                    break;
                }
            }
            if (is_prime == 1){
                count++;
            }
        }
        return count;
    }
}