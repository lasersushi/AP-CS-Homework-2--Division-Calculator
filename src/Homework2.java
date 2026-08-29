/*
Lucas Walker
Mr. Menezes
AT CS
8/29/26
*/

public class Homework2 {
    public static void main(String[]args) {
        int a = 5;
        int b = 2;
        System.out.println(computeDecimal(a,b));
    }
    public static int computeQuotient(int dividend, int divisor) {
        int answer = dividend/divisor;
        return answer;
    }
    public static int computeRemainder(int dividend, int divisor) {
        int answer = dividend%divisor;
        return answer;
    }
    public static double computeDecimal(int dividend, int divisor) {
        double DoubleDividend = (double)(dividend);
        double DoubleDivisor = (double)(divisor);
        double answer = DoubleDividend/DoubleDivisor;
        return answer;
    }
}
