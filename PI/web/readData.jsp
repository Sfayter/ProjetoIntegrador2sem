<%-- 
    Document   : read
    Created on : 23 de nov. de 2023, 15:31:48
    Author     : win
--%>

<%@page import="classes.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/reset.css"/>
        <link rel="stylesheet" href="./css/read.css"/>
    </head>
    <body>
        <main>
            <h2>Lista de Dados</h2>
            <%
                Conexao conexao = new Conexao();
                Connection con = conexao.abreConec();
                PreparedStatement st;

                try {
                    st = con.prepareStatement("call buscarDados()");
                    ResultSet rs = st.executeQuery();
                    if (!rs.isBeforeFirst()) {
            %>
            <div class="item">
                <h2>Sem dados cadastrados.</h2>
            </div>
            <%
                }
                while (rs.next()) {

            %>

            <div class="item">
                <h3>
                    Data: <%= rs.getString("data_leitura")%>
                </h3>
                <h3>
                    Horário: <%= rs.getString("hora")%>
                </h3>
                <h3>    
                    Frequência: <%= rs.getString("frequencia")%>
                </h3>

                <a href="deleteData.jsp?cod=<%=rs.getString("id")%>">Deletar</a>
            </div>
            <%

                    }
                } catch (Exception ex) {
                    out.print("Erro: " + ex.getMessage());
                }


            %>
        </main>
    </body>
</html>
