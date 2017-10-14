function create(){
	console.log("working");
	var node = document.createElement("LI");  
	node.setAttribute("id", "list");          
	var text = document.getElementById("text").value;     // Create a <li> node
var textnode = document.createTextNode(text);         // Create a text node
node.appendChild(textnode);                              // Append the text to <li>
document.getElementById("ullist").appendChild(node);     // Append <li> to <ul> with id="myList"
}
