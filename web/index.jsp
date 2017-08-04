<%@page import="mypkg.FileHandler"%>
<%@page import="java.util.Collections"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/mystyle.css"/>
        <title>JSP Page</title>
    </head>
      
    <body>
 
        <h1><u><i>Let's Be a Millionaire!</i></u></h1>
            <form action="index.jsp" method = "GET">
                <table id='t1'>
                    <%for (int i = 0; i <9; i++){%>
                        <tr> 
                            <%for (int j = 0; j <5; j++)
                            {%>
                                <td><%=5*i+j+1%>
                                    <input type='checkbox' name="included" value=<%=String.valueOf(5*i+j+1)%>>
                                    <input type='checkbox' name="excluded" value=<%=String.valueOf(5*i+j+1)%>>
                                </td>
                            <%}%>
                        </tr>
                    <%}%>
                    <tr><td colspan='5'><input type="submit" value="SUBMIT" name='submit'></td></tr>
                </table>    
            </form>

            <%
                List<Integer> r1 = new ArrayList();
                List<Integer> r2 = new ArrayList();

                List<List<Integer>> hello = new ArrayList();
                FileHandler money = new FileHandler();
                
              /* for (int i=1;i<=45;i++){
                        session.setAttribute("in"+String.valueOf(i),"");
                        session.setAttribute("ex"+String.valueOf(i),"");
                    }
                */    

                    List<String> in = new ArrayList();
                    List<String> ex = new ArrayList();
                    
                if(request.getParameter("submit")!=null){
                    
                    
                    if(request.getParameterValues("included")!=null)
                        in=Arrays.asList(request.getParameterValues("included"));
                    else
                        in.add("-1");
                    
                    String str="";
                    if (request.getParameterValues("excluded") != null) {
                            ex = Arrays.asList(request.getParameterValues("excluded"));
                        } else {
                            ex.add("-1");
                        }
                    
                   
                    /*for (String p:in)
                        session.setAttribute("in"+p,"checked");
                    
                    for (String q:ex)
                        session.setAttribute("ex"+q,"checked");
                   */
                   
                    for (String p:in) 
                        for (String q:ex) {
                            if (p.equals(q)) {
                                str="You cannot select the same number at the same time.";
                                break;
                            }
                        }
                    
                 
                    if((in.get(0)!="-1"||ex.get(0)!="-1")&&str.length()==0) 
                      hello = money.jackPot(in,ex,13);
                }

//* 제한조건 
// 1. 제외되는 수는 최대 38개이다. (39개이면 랜덤의 의미가 없음.) 
// 2. 제외수와 포함수는 동시에 같을 수 없다. 
// 3. 포함수는 최대5개 이다. (6개일시 랜덤의 의미가 없음.)
            String str="";
            %>
            
           
            <div id='div'>
                
                <table id='t2'>
                    <tr><td colspan='2'>고정번호 :</td><td style="padding-left:0px; text-align:left;" colspan='4'> <% for (String e: in) out.println(e+" "); %></td></tr>
                    <tr><td colspan='2'>배제번호 :</td><td style="text-align:left;" colspan='4'> <% for (String e: ex) out.println(e+" "); %></td></tr>
                    <tr id='rr'><td id='kk' colspan='6'>You will be super-rich!!!</td></tr>
                    <% for (int i = 0; i < hello.size(); i++) {%>
                        <tr>
                            <%for (int j = 0; j < hello.get(i).size(); j++){
                                int number=hello.get(i).get(j);    
                              
                                if(in.contains(String.valueOf(number)))
                                    str="\'color:blue;font-weight:bold\'";
                                else 
                                    str="";
                            %>    
                            <td style=<%=str%>> <%=number%> </td>
                            <%}%>
                        </tr>
                    <%}%>
               </table> 
            </div>
    </body>            
</html>

           