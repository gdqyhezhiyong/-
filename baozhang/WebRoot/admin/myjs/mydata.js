var box = document.getElementById("data");
var ta = document.createElement("table");
ta.setAttribute("id","mytable");
ta.setAttribute("border","1px");
var row=document.createElement("tr");
var cell =document.createElement("td");
cell.appendChild(document.createTextNode ("��1��")); 
row.appendChild(cell);
ta.appendChild(row);
box.appendChild(ta);

