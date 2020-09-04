// JavaScript source code
function UpdateTextEditor(customtextid) {
    tinyMCE.remove();
    document.getElementById("textcontents").value = document.getElementById('t' + customtextid.toString()).value;
    document.getElementById("texteditor").style.display = 'block';
    enableTinyMCE();
}

function enableTinyMCE() {

    tinymce.init({
      selector: 'textarea#textcontents',
      height: 500,
      menubar: false,
      content_style: 'body {font - family:Helvetica,Arial,sans-serif; font-size:14px }',
      });
    return true;
}

function ResetTextarea() {
    var id = document.getElementById("customtextid").selectedIndex
    UpdateTextEditor(id);
}

function SaveTextaarea() {
    tinyMCE.triggerSave();
    mysubmit();
}