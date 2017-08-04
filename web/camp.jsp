 <%@page import="mypkg.NewClass"%>
<%@page import="java.util.List"%>
<%@page import="mypkg.FileHandler"%>
<%@page import="mypkg.Person"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>

<hhml>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
    <%
        HashMap<String, Person> data = new HashMap();

        data.put("kihoon", new Person("male","Seoul",32));
        data.put("jihoon", new Person("male","Daegu",23));
        data.put("jungan", new Person("female","Pusan",29));
        
        out.println("<table>");
           for (String key:data.keySet())
           {   
               out.print("<tr>"
                       + "<td>"+key+"</td>"
                       + "<td>"+data.get(key).getName() +"</td>");
               out.print("</tr>");
           }
        out.println("</table>");
        
        NewClass lotto = new NewClass();
        
        List<List<String>> wow = new ArrayList();
        
        wow=lotto.getHitNumber();

        out.println("<table>");
            for(List<String> r : wow){

                out.println("<tr>");
                
                for (String el:r)
                    out.println("<td style='width:150px;border:1px solid blue;text-align:left'>"+el+"</td>");
                
                out.println("</tr>");  
            }
//        out.println("</table>");
//        
//        int temp[]= new int [45];
//        
//        for (int i=0;i<temp.length;i++)
//            temp[i]=0;
//        
//        
//
//         for (List<Integer> r : wow)
//            for (Integer p : r)
//                temp[p-1]+=1;
//         
//                
//         int count=0;
//         
//         
//         
//         for (int p : temp)
//            System.out.println(++count+" : "+p);
        
       


     %>
    
     
    </body>
    
</html>