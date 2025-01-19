class benchmark{
  public static void main(String args[]){
      int i, j, count = 1;
      byte is_prime;
      int square;
      for (i = 3; i < 10000000; i += 2){
          is_prime = 1;
          square = (int) Math.sqrt(i);
          for (j = 3; j <= square; j += 2){
              if (i % j == 0){
                  is_prime = 0;
                  break;
              }
          }
          if (is_prime == 1){
              count++;
          }
      }
      System.out.format("%d", count);
  }
}