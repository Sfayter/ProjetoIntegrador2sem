<%-- 
    Document   : deleteData
    Created on : 25 de nov. de 2023, 08:29:07
    Author     : win
--%>
<%@page import="classes.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar Leitura</title>
    </head>
    <body>
        <% 
            int cod = -1;
            if(!request.getParameter("cod").equals("")){
                cod = Integer.parseInt(request.getParameter("cod"));
            }
  
            Conexao conexao = new Conexao();
            Connection con = conexao.abreConec();
            PreparedStatement st;
            
            try{
                st = con.prepareStatement("delete from leitura where id = ?");
                st.setInt(1, cod);
                int res = st.executeUpdate();
                if(res == 1){
                %>
                    <div>
                        <h1>Excluído com sucesso!</h1>
                    </div>
                <%
                }
            }
            catch(Exception ex){
                String erro = ex.getMessage();
                %>        
                        <div>
                        <h1>Ocorreu um erro, não foi possível excluir.</h1>
                            <p>
                                Erro: <%=erro%>
                            </p>   
                        </div>    
                <%
            }
        %>
    </body>
</html>
