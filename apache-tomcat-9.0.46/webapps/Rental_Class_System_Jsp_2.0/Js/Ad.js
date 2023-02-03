/**
 * 
 */
 
 function Edit(I){
 	for(let i =2 ;  document.getElementById('Ob'+i+'_'+I)!=null;){
 		document.getElementById('Ob'+i).value=document.getElementById('Ob'+i+'_'+I).innerText;
 		i++;
 	}
}
 
function Delete(I){
 	for(let i =2 ;  document.getElementById('Ob'+i+'_'+I)!=null;){
 		document.getElementById('DOb'+i).value=document.getElementById('Ob'+i+'_'+I).innerText;
 		i++;
 	}
}