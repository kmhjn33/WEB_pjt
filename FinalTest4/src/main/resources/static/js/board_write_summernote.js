$(function() {
    $('#summernote').summernote({
        height: 500,              // 에디터 높이
        minHeight: null,          // 에디터 최소 높이
        maxHeight: null,          // 에디터 최대 높이
        focus: true,              // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",	          // 한글 설정
        placeholder: '최대 2000자까지 쓸 수 있습니다.'	//placeholder 설정
        ,
        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['help']]
          ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
           , callbacks: {
             onImageUpload: function(files, editor, welEditable) {
                         for (var i = files.length - 1; i >= 0; i--) {
                         sendFile(files[i], this);
                         }
                     } //onImageUpload
             } //callbacks


    }); //summernote
    
}); //function


function sendFile(file,el) {
	var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/board/summerUpload',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(img_name) {
        	$(el).summernote('editor.insertImage', img_name);
        }
      }); 
} //sendFile 