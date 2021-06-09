<%-- 
    Document   : prestamos
    Created on : 26-may-2021, 16:39:42
    Author     : DAW-A
--%>

<%@page import="modelo.Cuota"%>
<%@page import="modelo.Prestamo"%>
<%@page import="modelo.Utilidades"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco Bosco</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="/">Banco Bosco</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                
                <li class="nav-item">
                  <a class="nav-link" href="/ServletPrestamos">Pedir prestamos</a>
                </li>


              </ul>
              
            </div>
        </nav>
        <br>
        <br>
        <div style="text-align: center">
            <h2>Solicitud de Prestamos</h2>
            <%
            ArrayList<String> listaMeses = ( ArrayList<String> ) request.getAttribute("listaMeses");
            ArrayList<Cuota> genereListaCuotas = ( ArrayList<Cuota> ) request.getAttribute("genereListaCuotas");

            String nombre=( String ) request.getAttribute("nombre");
               if (nombre==null) {
                   nombre="";
               }
            Prestamo miPrestamo = ( Prestamo ) request.getAttribute("miPrestamo");
            double capital=0;
            double interes=0;
            int mesPres=12;
            if ( miPrestamo!=null) {
                    capital=miPrestamo.getCapital(); 
                    interes=miPrestamo.getInteres();
                    mesPres= miPrestamo.getMesPres();
                }
            %>
            <form action="ServletPrestamos" method="post">
                <p><label>Nombre:</label><input type="text" name="nombre" value="<%=nombre%>"></p>
                <p><label>Capital que solicita:</label><input type="text" name="capital" value="${miPrestamo.capital}"></p>
                <p><label>Interes:</label><input type="text" name="interes" value="${miPrestamo.interes}"></p>
                <p><label>Tiempo(en meses):</label>
                    <select name="mesPres">
                         <%

                            for ( String a: listaMeses ){
                              String cadenaSelected="";
                              if ( Integer.parseInt(a)==mesPres){
                                  cadenaSelected = " selected ";
                              }

                              out.println("<option value=" + a + cadenaSelected +">" + a + "</option>" );
                          }
                           %>

                    </select>
                </p>
                <input type="submit" value="Calcular">
                <h1>ImporteTotalPrestamo: ${miPrestamo.importePrestamo}</h1> 
                <% if(genereListaCuotas!=null){
                    out.print("<table style='border:2px solid blue'>");
                    for( Cuota v:genereListaCuotas){
                        out.print("<tr>"
                            +   "<td>NºCuota</td>"
                            +   "<td>Importe</td>"
                            +   "<td>Capital</td>"
                            +   "<td>Interes</td>"
                            + "</tr>"
                            +"<tr>"
                                + "<td>"+v.getNumeroCuota()+"</td>"
                                + "<td>"+v.getImporteCuota()+"</td>"
                                + "<td>"+v.getCapital()+"</td>"
                                + "<td>"+v.getIntereses()+"</td>"
                            + "</tr>");
                    }
               }%>
            </form>
            
            
            
        </div>
    </body>
</html>
