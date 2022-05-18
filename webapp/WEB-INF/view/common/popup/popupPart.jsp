<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/_include/taglib.jsp"%>

<script type="text/javascript">
var popupDrawgrid = function(formId,data){
	var mydata2 = data;
	$('#popupGrid').setViewGrid({id:'popupGrid',type:'view',
// 		url:CTX+'/common/popup/getDataGeneratorPopup.ajax',
		url:CTX+'${urlGetData}',  

		param : formId ,
		data:mydata2,  
		gridOptions : {width: 500, sortable:true, caption: '검색결과' , loadonce:true},
		colModels : [	             
		   	{name:'ID', id :'PART_ID', width:60},
   	   		{name:'<spring:message code='title.part.PART_NM' />', id :'PART_NM', width:190, align:'left'}  , 	   	
   	   		{name:'<spring:message code='title.part.MNG_CODE' />', id :'MNG_CODE', width:190, align:'left'} ,  	   		
   	   	],
		defaultOptions:{ width:120, sortable:true},
		colspan:[],
		rowspan:[], 
		colGroup:[], 
		events:[
			{
				event:'${param.eventType}', funcName:'${param.funcname}',
				target:'${param.target}', type:'${param.type}', callback:'${param.callback}'
			}
		]
	});
	return false;
}; 

/*
 * *****************************************
 * Grid 이벤트
 * ******************************************
 */
 
//"필수적용사항"
//*********폼 다이얼로그 & 팝업 (폼에서 다이얼로그 & 팝업 뛰운 경우)
//그리드의 데이터를 모두 가지고 넘어가야할 경우
//1. 다이얼로그
function onSelectAlldialog(rowid, iRow, iCol, rowData, target,callback, obj){
	onSelectAll(rowid, iRow, iCol, rowData, target,callback, obj);
}

//2. 팝업
function onSelectAllpopup(rowid, iRow, iCol, rowData, target,callback, obj){
	window.opener.onSelectAll(rowid, iRow, iCol, rowData, target,callback, obj);
	window.close();
}

//*********그리드 다이얼로그 & 팝업 (그리드에서 다이얼로그 & 팝업 뛰운 경우)
//그리드의 데이터를 모두 가지고 넘어가야할 경우
//1. 다이얼로그
function onSelectGridAlldialog(rowid, iRow, iCol, rowData, target,callback, obj){
	onSelectGridAll(rowid, iRow, iCol, rowData, target,callback, obj);
}

//2. 팝업
function onSelectGridAllpopup(rowid, iRow, iCol, rowData, target,callback, obj){
	window.opener.onSelectGridAll(rowid, iRow, iCol, rowData, target,callback, obj);
	window.close();
}

/*
 * *****************************************
 * 폼 이벤트
 * ******************************************
 */

//조회 - search_box 전송
function doSubmit() {
	$('.form_search_box#popupDrawgrid').trigger('submit');
}

//[유형- radio] change
function changeCls() {
    $('input[name=SE_CLS]').change(function(){
        $('.form_search_box#popupDrawgrid').submit();
    });
}

// [search_box] 전체 Reset
function searchBoxReset() {
 	$('.form_search_box#popupDrawgrid').each(function() {  
        this.reset();  
    });  
 	doSubmit();
}

$(document).ready(function(){
	// [유형- radio] change
	changeCls(); 	
	
	//$('.form_search_box#popupDrawgrid').trigger('submit');
});

</script>
<div id="popup_wrapper">
	<h4><spring:message code='title.popup.generator' /></h4>
	<a2m:searchbox script="popupDrawgrid" >
	<table class="search_tbl">
			<caption>Search</caption>
			<colgroup>
				<col style="width: 100px;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
				<tr>
					<th><spring:message code='title.tb.GERATOR_NM' /></th>
					<td>
						<select id="FARM_ID" class="" style="width: 25%; margin-right: 20px;"  name="search.FARM_ID">
							<option value="">-- <spring:message code='title.farm.FARM_NM' /> --</option>
							<c:forEach var="farm" items="${farms}">
								<option value="${farm.FARM_ID}"> ${farm.FARM_NM}</option>
							</c:forEach>
						</select>
						<select id="GROUP_ID" class="" style="width: 25%; margin-right: 20px;"  name="search.GROUP_ID">
							<option value="">-- <spring:message code='title.farm.group' /> --</option>
						</select>
						<select id="GERATOR_ID" class="" style="width: 25%; margin-right: 20px;"  name="search.GERATOR_ID">
							<option value="">-- Generator name --</option>
						</select>
					</td>
					
				</tr>
			</tbody>
		</table>
	
		
		
	</a2m:searchbox>
	<div id="popupGrid"> </div>
</div>	