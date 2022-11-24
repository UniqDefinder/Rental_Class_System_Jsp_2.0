
function Post_Day(Y,M,D){
	let url = location.href;
	if(url.indexOf('?')!=-1 ){
	    //之後去分割字串把分割後的字串放進陣列中
	    let ary1 = url.split('?');
		let ary2 = ary1[1].split('&');
	    var Classromm_Code = ary2[0].toString();

	}
	
	let stateObj = { '': 1 }; // 設定狀態，目前沒用
	
	let Date =  M.toString() + "/"+D.toString()+"/"+Y.toString();
	
	history.replaceState(stateObj, "", "?"+Classromm_Code+"&Date="+Date); // 網址後面加上文字
	
	window.history.go(); //刷新頁面 
	return;
}
function checkForm(){
	const Reason = document.getElementById('Reason');
	const TermArr = ["8:10~9:00","9:10~10:00","10:10~11:00","11:10~12:00","12:40~13:30","13:40~14:30","14:10~15:30","15:40~16:30","16:40~17:30","17:40~18:30"];
	let TermCheck =false;
	
	
	for(let i=0;i<10;){
		let Term;
		Term = document.getElementById(TermArr[i]);
		if( Term.checked == true){
			TermCheck = true
		}
		i++
	}
	
	if(TermCheck == false){
		alert("請至少選擇一個時段！")
		return false;
	}else if(Reason.value == "" ){
		alert("請輸入租借原因！")
		return false;
	}
	
	
}