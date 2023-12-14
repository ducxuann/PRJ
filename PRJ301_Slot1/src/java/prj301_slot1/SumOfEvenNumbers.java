/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prj301_slot1;

import java.util.Scanner;

/**
 *
 * @author xuanduc
 */
public class PRJ301_Slot1 {
    
    public int KiemTraChanLe(int n){
        if(n % 2 == 0) return 1;
        return 0;
    }
    public static void main(String[] args){
       PRJ301_Slot1 prj = new PRJ301_Slot1();
       int rs = prj.KiemTraChanLe('a');
       if (rs == 0) System.out.println("la so le");
       else System.out.println("la so chan");
       
    }
}
public class CheckEvenOdd {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Nhập số: ");
    String input = scanner.nextLine();

    try {
      int number = Integer.parseInt(input);

      if (number % 2 == 0) {
        System.out.println("Số chẵn");
      } else {
        System.out.println("Số lẻ");
      }
    } catch (NumberFormatException e) {
      System.out.println("Input wrong");
    }
  }

}
public class CheckPrimeNumber {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Nhập số: ");
    int number = scanner.nextInt();
    try {
    if (number <= 1) {
      System.out.println("Không phải số nguyên tố");
      return;
    }

    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        System.out.println("Không phải số nguyên tố");
        return;
      }
    }

    System.out.println("Số nguyên tố");
  }catch(Exception ex){
        System.out.println("input wrong");
  }
  }
 
}

public class SumOfEvenNumbers {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Nhập số nguyên n > 0: ");
    int n = scanner.nextInt();

    int sum = 0;

    for (int i = 2; i <= n; i += 2) {
      sum += i;
    }

    System.out.println("Tổng các số chẵn từ 1 đến n là: " + sum);
  }

}
public class GreatestCommonDivisor {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Nhập số nguyên thứ nhất: ");
    int n1 = scanner.nextInt();
    System.out.println("Nhập số nguyên thứ hai: ");
    int n2 = scanner.nextInt();

    int gcd = 1;

    for (int i = 1; i <= n1 && i <= n2; i++) {
      if (n1 % i == 0 && n2 % i == 0) {
        gcd = i;
      }
    }

    System.out.println("Ước chung lớn nhất của n1 và n2 là: " + gcd);
  }

}
