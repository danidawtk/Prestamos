/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;

/**
 *
 * @author DAW-A
 */
public class Utilidades {
    public static ArrayList<String> CalculaMeses(){
        int mes=0;
        ArrayList<String> listaMeses = new ArrayList<String>();
        for ( int i=0; i<=15;i++){
            mes=mes+12;
            listaMeses.add(String.valueOf(mes));
        }
        return listaMeses;
    }
    public static ArrayList<Cuota> genereListaCuotas(int numCuotas,double importeTotalPrestamo){
        
        ArrayList<Cuota> genereListaCuotas = new ArrayList<Cuota>();
        
        for ( int i = 1; i<= numCuotas; i++ ){
            int numeroCuota = i;
            double importeCuota = importeTotalPrestamo/numCuotas;
            double intereses = importeCuota-(importeCuota*(i-1))/numCuotas;
            double capital = importeCuota-intereses;
            
            Cuota miCuota = new Cuota(numeroCuota,importeCuota,intereses,capital);
            genereListaCuotas.add(miCuota);
        }
        
        return genereListaCuotas;
    }
}
