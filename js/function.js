var $ = jQuery.noConflict();


$(window).load(function(){
	var p = $('#ulSelectNilaiP').find('li.selected').length;
	if(p == 0){ $('#ulSelectNilaiP li:eq(0)').addClass('selected'); }
	
	var q = $('#ulSelectNilaiQ').find('li.selected').length;
	if(q == 0){ $('#ulSelectNilaiQ li:eq(0)').addClass('selected'); }
	
	var r = $('#ulSelectNilaiR').find('li.selected').length;
	if(r == 0){ $('#ulSelectNilaiR li:eq(0)').addClass('selected'); }
});
	
$(document).ready(function(){
	
	setInterval(function(){
				
		$.ajax({
			url:"./inc/autoDate.php",
			error: function(errMsg){

			},
			success: function(serverRsp){
				$('.autoDate').html(serverRsp);
			}
		});
		
	}, 60000);
	 
	$('#btnAddMorePhone').click(function() {	
		addMorePhone('');
	});
	
	$('#btnAddMoreEmail').click(function() {	
		addMoreEmail('');
	});

	$('#btnHapus').click(function() {	
		if (confirm("Yakin ini ingin dihapus?")) {
			$('#actionSave').val('delete');
			return true;
		} else {
			return false;
		}
	});
	
	/*SelectCustom*/
	$('.txtSelectCustom').click(function(){
		var goTo = $(this).parent().find('.ulSelectCustom');
		var bgSelectCustom = $('.bgSelectCustom');
		if(goTo.hasClass('active')){ goTo.removeClass('active'); bgSelectCustom.hide(); } else { goTo.addClass('active'); bgSelectCustom.show(); }
	});
	
	$('.ulSelectCustom > li').click(function(){
		var parentx	= $(this).parent().parent();
		var txt		= parentx.find('.txtSelectCustom');
		var valuex	= $(this).children('div').attr('data-value');
		var bgSelectCustom = $('.bgSelectCustom');
		
		txt.val(valuex);
		
		$(this).parent().find('li').removeClass('selected');
		$(this).addClass('selected');
		
		$(this).parent().removeClass('active');
		bgSelectCustom.hide();
	});	
	
	$('.ulSelectCustom.input-nilai > li').click(function(){
		var nilai   = $(this).children('div').attr('data-nilai');		
		$(this).parents('.controls').find('.div-nilai .disabled-clear').val(nilai);
		hitungTotalNilaiSeluruh();
	});	
	
	$('.ulSelectCustom.input-jenis-parent > li').click(function(){
		var nilai   = $(this).children('div').attr('data-nilai');		
		$('#txtJenisParent').val(nilai);
		getParent(nilai);
	});	
	
	$('.ulSelectCustom.input-jenis-parent-penilai > li').click(function(){
		var nilai   = $(this).children('div').attr('data-nilai');
		
		var controlgroup = $(this).parents('.control-group'),
			ulSelectNilaiP = controlgroup.find('.ulSelectNilaiP'),
			txtJenisParent = controlgroup.find('.txtJenisParent'),
			txtSelectNilaiP = controlgroup.find('.txtSelectNilaiP'),
			txtNilaiP = controlgroup.find('.txtNilaiP');
			
			txtJenisParent.val(nilai);
			ulSelectNilaiP.find('li').removeClass('selected').hide();
			ulSelectNilaiP.find('li:eq(0)').show();
			ulSelectNilaiP.find('li[data-filter='+nilai+']').show();
			txtNilaiP.val('');
			txtSelectNilaiP.val('');
	});	
	
	$('.bgSelectCustom').click(function(){
		$('.ulSelectCustom').removeClass('active');
		$(this).hide();
	});
	/*/SelectCustom*/

	 
	$(window).scroll(function() {
		var pos = $(window).scrollTop();
		var posContent = $('#divContent').position().top;
		var divStep = $('#divStep');
		
		if(pos > posContent){
			divStep.addClass('stepFixed');
		} else {
			divStep.removeClass('stepFixed');
		}
		
	});
	
});

/* --- Global --- */	

function checkAvailable(idMsg){
	
	$('#check'+idMsg).css('display','block').html('<img src="./img/loading.gif" style="border:none;" /> Checking...');
	var tampungId = $('#txt'+idMsg).val();
	
	var xmlhttp;
	if (window.XMLHttpRequest) { xmlhttp=new XMLHttpRequest(); } else { xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); }
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200){
			if (xmlhttp.responseText == 1) {
				$('#check'+idMsg).attr('data-value','1');
				$('#check'+idMsg).html('<span class="is_available"><b>'+ tampungId +'</b> belum digunakan.</span>');
			} else {
				$('#check'+idMsg).attr('data-value','0');
				$('#check'+idMsg).html('<span class="is_not_available"><b>'+ tampungId +'</b> sudah digunakan, silahkan ganti yang lain!</span>');
			}
		}
	}
	xmlhttp.open("GET","./func/checkAvailable.php?tampungId="+tampungId+"&action="+idMsg,true);
	xmlhttp.send();
}

function checkAvailable2(idMsg){
	
	$('#check'+idMsg).css('display','block').html('<img src="../img/loading.gif" style="border:none;" /> Checking...');
	var tampungId = $('#txt'+idMsg).val();
	
	var xmlhttp;
	if (window.XMLHttpRequest) { xmlhttp=new XMLHttpRequest(); } else { xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); }
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200){
			if (xmlhttp.responseText == 1) {
				$('#check'+idMsg).attr('data-value','1');
				$('#check'+idMsg).html('<span class="is_available"><b>'+ tampungId +'</b> belum digunakan.</span>');
			} else {
				$('#check'+idMsg).attr('data-value','0');
				$('#check'+idMsg).html('<span class="is_not_available"><b>'+ tampungId +'</b> sudah digunakan, silahkan ganti yang lain!</span>');
			}
		}
	}
	xmlhttp.open("GET","../func/checkAvailable.php?tampungId="+tampungId+"&action="+idMsg,true);
	xmlhttp.send();
}

function checkAvailable3(idMsg,oldVal){
	
	$('#check'+idMsg).css('display','block').html('<img src="../img/loading.gif" style="border:none;" /> Checking...');
	var tampungId = $('#txt'+idMsg).val();
	
	var xmlhttp;
	if (window.XMLHttpRequest) { xmlhttp=new XMLHttpRequest(); } else { xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); }
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200){
			if (xmlhttp.responseText == 1) {
				$('#check'+idMsg).attr('data-value','1');
				$('#check'+idMsg).html('<span class="is_available"><b>'+ tampungId +'</b> dapat digunakan.</span>');
			} else {
				$('#check'+idMsg).attr('data-value','0');
				$('#check'+idMsg).html('<span class="is_not_available"><b>'+ tampungId +'</b> sudah digunakan, silahkan ganti yang lain!</span>');
			}
		}
	}
	xmlhttp.open("GET","../func/checkAvailable2.php?tampungId="+tampungId+"&oldVal="+oldVal,true);
	xmlhttp.send();
}

function getParent(tampungId){
	
	$('#ulSelectNilaiP').find('li').removeClass('selected').hide();
	$('#ulSelectNilaiP').find('li:eq(0)').show();
	$('#ulSelectNilaiP').find('li[data-filter='+tampungId+']').show();
	$('#txtNilaiP').val('0');
	$('#txtSelectNilaiP').val('');
	
}

function showProvinsi(tampungId,nmDiv){
	if(tampungId == 'Indonesia'){
		$('#'+nmDiv).fadeIn(200);
	} else {
		$('#'+nmDiv).fadeOut(200);
	}
}

var no_urut = 1;
function addMorePhone(val_txt) {
	
	var $divPhone = document.getElementById("divPhone");
	
	var element = document.createElement("input");
		element.setAttribute("type", "text");
		element.setAttribute("value", val_txt);
		element.setAttribute("name", "txtPhone[]");
		element.setAttribute("id", "txtPhone"+no_urut);
		element.setAttribute("class", "input-xlarge");
	
	var divContent = document.createElement("div");
		divContent.setAttribute("class", "span12");
		if(no_urut == 1){
			divContent.setAttribute("style", "margin:0px;");
		} else {
			divContent.setAttribute("style", "margin:5px 0px 0px 0px;");
		}
		
	$divPhone.appendChild( divContent );
	divContent.appendChild( element );
	
	no_urut += 1;
}

var no_urut = 1;
function addMorePhone2(val_txt) {
	
	var $divPhone = document.getElementById("divPhone");
	
	var element = document.createElement("input");
		element.setAttribute("type", "text");
		element.setAttribute("value", val_txt);
		element.setAttribute("name", "txtPhone[]");
		element.setAttribute("id", "txtPhone"+no_urut);
		element.setAttribute("class", "input-xlarge");
		element.setAttribute("readonly", "readonly");
	
	var divContent = document.createElement("div");
		divContent.setAttribute("class", "span12");
		if(no_urut == 1){
			divContent.setAttribute("style", "margin:0px;");
		} else {
			divContent.setAttribute("style", "margin:5px 0px 0px 0px;");
		}
		
	$divPhone.appendChild( divContent );
	divContent.appendChild( element );
	
	no_urut += 1;
}

var no_urut_email = 1;
function addMoreEmail(val_txt) {
	
	var $divEmail = document.getElementById("divEmail");
	
	var element = document.createElement("input");
		element.setAttribute("type", "text");
		element.setAttribute("value", val_txt);
		element.setAttribute("name", "txtEmail[]");
		element.setAttribute("id", "txtEmail"+no_urut_email);
		element.setAttribute("class", "input-xlarge");
	
	var divContent = document.createElement("div");
		divContent.setAttribute("class", "span12");
		if(no_urut_email == 1){
			divContent.setAttribute("style", "margin:0px;");
		} else {
			divContent.setAttribute("style", "margin:5px 0px 0px 0px;");
		}
		
	$divEmail.appendChild( divContent );
	divContent.appendChild( element );
	
	no_urut_email += 1;
}

var no_urut_email = 1;
function addMoreEmail2(val_txt) {
	
	var $divEmail = document.getElementById("divEmail");
	
	var element = document.createElement("input");
		element.setAttribute("type", "text");
		element.setAttribute("value", val_txt);
		element.setAttribute("name", "txtEmail[]");
		element.setAttribute("id", "txtEmail"+no_urut_email);
		element.setAttribute("class", "input-xlarge");
		element.setAttribute("readonly", "readonly");
	
	var divContent = document.createElement("div");
		divContent.setAttribute("class", "span12");
		if(no_urut_email == 1){
			divContent.setAttribute("style", "margin:0px;");
		} else {
			divContent.setAttribute("style", "margin:5px 0px 0px 0px;");
		}
		
	$divEmail.appendChild( divContent );
	divContent.appendChild( element );
	
	no_urut_email += 1;
}

function hitungTotalNilaiSeluruh(){
	var a = 0;
	var nilaiK = 0;
	var idSumoSelect = '';
	var sum = $('.SumoSelect').find('ul li').length;
	for(var i=0;i<sum;i++){		
		if($('.SumoSelect').find('ul li:eq('+i+')').hasClass('selected')){
			var nilaiselect = $('.SumoSelect').find('ul li:eq('+i+')').attr('data-nilai');
			nilaiK = parseInt(nilaiK) + parseInt(nilaiselect);
			
			var idSelect= $('.SumoSelect').find('ul li:eq('+i+')').attr('data-id');
			if(a==0){ idSumoSelect = idSelect; } else { idSumoSelect = idSumoSelect +','+ idSelect; }
			a += 1;
		}		
	}
	$('#divNilaiKopetensi .disabled-clear').val(nilaiK);
	$('#txtSelectKopetensi').val(idSumoSelect);
	
	var nilai = 1;	
	var nilaiP = $('#ulSelectNilaiP').find('li.selected > div').attr('data-nilai');
	var nilaiQ = $('#ulSelectNilaiQ').find('li.selected > div').attr('data-nilai');
	var nilaiR = $('#ulSelectNilaiR').find('li.selected > div').attr('data-nilai');
	
	if(nilaiP == '0' && nilaiQ == '0' && nilaiR == '0' && nilaiK == '0'){
		var totalnilai = '0';
	} else {
		if(nilaiP == '0'){ nilaiP = 1; }
		if(nilaiQ == '0'){ nilaiQ = 1; }
		if(nilaiR == '0'){ nilaiR = 1; }
		if(nilaiK == '0'){ nilaiK = 1; }
		var totalnilai = parseInt(nilai) * parseInt(nilaiP) * parseInt(nilaiQ) * parseInt(nilaiR) * parseInt(nilaiK);
	}
	$('#txtTotalNilai').val(totalnilai);
}

function hitungTotalNilaiSeluruhPenilai(valX){
	var $this = valX.parents('.SumoSelect');
	var a = 0;
	var nilaiK = 0;
	var idSumoSelect = '';
	var sum = $this.find('ul li').length;
	for(var i=0;i<sum;i++){		
		if($this.find('ul li:eq('+i+')').hasClass('selected')){
			var nilaiselect = $this.find('ul li:eq('+i+')').attr('data-nilai');
			nilaiK = parseInt(nilaiK) + parseInt(nilaiselect);
			
			var idSelect= $this.find('ul li:eq('+i+')').attr('data-id');
			if(a==0){ idSumoSelect = idSelect; } else { idSumoSelect = idSumoSelect +','+ idSelect; }
			a += 1;
		}		
	}
	
	$this.parent().find('.txtSelectKopetensi').val(idSumoSelect);
}

/* ---------------------------------------------------------------------- */
/*	Validate number only
/* ---------------------------------------------------------------------- */
function validate(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]|\./;
	if( !regex.test(key) ) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}
}
function validatePrice(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]/;
	if( !regex.test(key) ) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}
}
function validatePhone(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]|\-/;
	if( !regex.test(key) ) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}
}
function validateDate(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]|\//;
	if( !regex.test(key) ) {
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}
}