<%-- 
    Document   : excel.jsp
    Created on : 23 de nov. de 2023, 16:32:43
    Author     : win
--%>
<%@page import="classes.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/reset.css"/>
        <title>Cadastro via Excel</title>
    </head>
    <body>
        <%
                Conexao conexao = new Conexao();
                Connection con = conexao.abreConec();
                PreparedStatement st;

                String arquivo = "C:\\Users\\win\\Desktop\\dados.csv";
                FileReader fr = new FileReader(arquivo);
                BufferedReader br = new BufferedReader(fr);
                String linha;
                int row = 0;
                while ((linha = br.readLine()) != null) {
                    String[] dados = linha.split(";");
                    row++;
                    if(row > 7){
                        if (dados.length > 0) {
                                %><p><%= dados[0] + " " + dados[1]%></p><%
                            try {
                                st = con.prepareStatement("call adiciona_leitura(?,?)");
                                st.setString(1, dados[0]);
                                st.setString(2, dados[1]);
                                st.executeUpdate();
                            } catch (Exception erro) {
                                out.print("<p>"+erro.getMessage()+"</p>");
                            }
                        }
                    }
                }
            


        %>
    </body>
</html>
