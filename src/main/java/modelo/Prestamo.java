/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author DAW-A
 */
public class Prestamo {
    private double capital;
    private double interes;
    int mesPres;
    double importePrestamo;

    public Prestamo(double capital, double interes, int mesPres) {
        this.capital = capital;
        this.interes = interes;
        this.mesPres = mesPres;
        
        importePrestamo=((capital*interes*mesPres)/1200)+capital;
    }

    public double getCapital() {
        return capital;
    }

    public void setCapital(double capital) {
        this.capital = capital;
    }

    public double getInteres() {
        return interes;
    }

    public void setInteres(double interes) {
        this.interes = interes;
    }

    public int getMesPres() {
        return mesPres;
    }

    public void setMesPres(int mesPres) {
        this.mesPres = mesPres;
    }

    public double getImportePrestamo() {
        return importePrestamo;
    }

    public void setImportePrestamo(double importePrestamo) {
        this.importePrestamo = importePrestamo;
    }
    
    
    
    
    
}
