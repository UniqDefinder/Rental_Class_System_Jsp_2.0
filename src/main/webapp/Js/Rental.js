
let url = location.href;
if(url.indexOf('Classromm_Code=')==-1 ){
	window.location.href='../User_Pages/User_Search_Place.jsp';
	}


 
 
function Post_Day(Y,M,D){
	let url = location.href;
	if(url.indexOf('?')!=-1 ){
	    //之後去分割字串把分割後的字串放進陣列中
	    let ary1 = url.split('?');
		let ary2 = ary1[1].split('&');
	    var Classromm_Code = ary2[0].toString();

	}
	
	let stateObj = { '': 1 }; // 設定狀態，目前沒用
	
	let Date = Y.toString()+"/"+ M.toString() + "/"+D.toString();
	
	history.replaceState(stateObj, "", "?"+Classromm_Code+"&Date="+Date); // 網址後面加上文字
	
	window.history.go(); //刷新頁面 
	return;
}