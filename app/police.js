function loadbutton(id){
console.log("working");
	var node = document.createElement("Button");  
	node.setAttribute("id", "alistbutton");          
	
var textnode = document.createTextNode("reject");         // Create a text node
node.appendChild(textnode);                              // Append the text to <li>
document.getElementById(id).appendChild(node); 
    // Append <li> to <ul> with id="myList"
    var node = document.createElement("Button");  
	node.setAttribute("id", "rlistbutton");          
	
var textnode = document.createTextNode("accept");         // Create a text node
node.appendChild(textnode);                              // Append the text to <li>
document.getElementById(id).appendChild(node);  

}